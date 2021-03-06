# simple kafka scripts

### Topic-Level Config Options
- `retention.ms`
- `segment.ms`
- `file.delete.delay.ms`
- `delete.retention.ms` : used in log compaction which is turned off by default

### Global Broker Config Options
- `broker.id` (required)
- `log.dirs` (required)
- `zookeeper.connect` (required)
- `log.retention.<hours|minutes|ms>`
- `log.segment.delete.delay.ms` : Amount of time to wait before deleting a file from the filesystem. Default 1 minute.
- `log.roll.<hours|ms>` : max time before new log segment is rolled out
- `log.segment.bytes`
- `log.cleaner.delete.retention.ms` : used in log compaction which is turned off by default
- `log.flush.inverval.messages` : number of msgs accumulated on a log partition before messages are flushed to disk
- `log.flush.invterval.ms` : max time that a msg in any topic is kept in memory before flushed to disk. If not set, `log.flush.scheduler.interval.ms` is used.


### Random Notes
- A Partition represents a directory within the kafka-logs directory (or targetted endpoint, configured with `log.dirs` or `log.dir`
- A Segment represents a separate set of `.index`, `.log`, and `.timeindex` files within a partition. These files are zero-left-filled indexed files.
- Specifying how much data or how long data should be retained for a Topic, Kafka will purge messages in-order, regardless of whether the message has been consumed.
- Deletion of segment log/index files are async. When Kafka decides to clean the logs, it only adds a suffix ".deleted" to the files so other Kafka threads no longer access it. The actual file deletion will be executed later, with period controlled by `file.delete.delay.ms` or `log.segment.delete.delay.ms`
- A topic resides within a Broker (server process) and has multiple partitions. Partitions can exist on different Brokers/machines. But a single partition has to be stored entirely on a single machine/Broker.
- The data stored on disk is the same as what the Broker receives from the Producer over the network and sends to its Consumers.