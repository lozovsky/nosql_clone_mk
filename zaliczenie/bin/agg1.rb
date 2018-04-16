#!/usr/bin/ruby

require 'mongo'
require_relative '../lib/connection'

conn = Connection.new
db = conn.client.database
alarms = conn.alarms

results = alarms.find.aggregate([ {'$group' => { '_id' => '$description',
                                                 'count' => { '$sum' => 1}
                                                  }
                                                },
                                  {'$sort' => {count: -1}},
                                  {'$limit' => 10}
                                                ])

results.each do |result|
  puts result
end
