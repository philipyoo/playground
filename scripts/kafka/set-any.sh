#!/bin/bash
# Arg1: Topic Name
# Arg2: topic-level config category
# Arg3: category value
bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $1 --add-config $2=$3
