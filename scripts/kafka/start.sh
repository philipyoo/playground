#!/bin/bash
# Arg1: Topic Name
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1
