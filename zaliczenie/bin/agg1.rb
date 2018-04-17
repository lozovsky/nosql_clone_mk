#!/usr/bin/ruby

require 'mongo'
require 'builder'
require 'optparse'
require_relative '../lib/connection'

options = {}
optparse = OptionParser.new do |opt|
  opt.on('-l', '--limit number') { |o| options[:limit] = o }
end

begin
  optparse.parse!
rescue OptionParser::MissingArgument
  puts "\nUse -l <numer> to set a limit of showing description.\n"
end

if options[:limit]
    limit=options[:limit]
else
  limit=10
end

conn = Connection.new
db = conn.client.database
alarms = conn.alarms

results = alarms.find.aggregate([ {'$group' => { '_id' => '$description',
                                                 'count' => { '$sum' => 1}
                                                  }
                                                },
                                  {'$sort' => {count: -1}},
                                  {'$limit' => Integer(limit)}
                                                ])


data = results.to_a
xm = Builder::XmlMarkup.new(:indent => 2)
xm.table {
  xm.tr { data[0].keys.each { |key| xm.th(key)}}
  data.each { |row| xm.tr { row.values.each { |value| xm.td(value)}}}
}

if File.file?('tabelka1.html')
  File.truncate('tabelka1.html',0)
end
File.write('tabelka1.html',"#{xm}")