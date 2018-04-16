#!/bin/sh
# Import sample datasets into MongoDB

`mongoimport --db test --collection alarms --file ../data/alarms.json --drop`
