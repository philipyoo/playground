#!/bin/bash
# Arg1: Topic Name
# Arg2: retention.ms time
bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $1 --add-config retention.ms=$2
