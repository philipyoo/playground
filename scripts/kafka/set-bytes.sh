#!/bin/bash
# Arg1: Topic Name
# Arg2: retention.bytes size
bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $1 --add-config retention.bytes=$2
