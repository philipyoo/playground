#!/bin/bash
# Arg1: Topic Name
bin/kafka-configs.sh --zookeeper localhost:2181 --describe --entity-type topics --entity-name $1
