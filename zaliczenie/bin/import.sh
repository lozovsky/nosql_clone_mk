#!/bin/sh
# Import sample datasets into MongoDB

`mongoimport --db test --collection alarm --file ../data/911_calls_for_service.csv --type csv --headerline --drop`
