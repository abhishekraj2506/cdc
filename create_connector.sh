#!/bin/bash
# Launch Kafka Connect
/etc/confluent/docker/run &
#
# Wait for Kafka Connect listener
# echo "Waiting for Kafka Connect to start listening on localhost ⏳"
# while : ; do
#   curl_status = $$[[curl -s -o /dev/null -w %{http_code} 'http://localhost:8083/connectors']]
#   echo -e " Kafka Connect listener HTTP state: " $curl_status " (waiting for 200)"
#   if [[ $curl_status -eq 200 ]] ; then
#     break
#   fi
#   sleep 5 
# done

# echo -e "\n--\n+> Creating Data Generator source"
# curl -s -X PUT -H  "Content-Type:application/json" http://localhost:8083/connectors/source-datagen-01/config \
#     -d 'curl -H 'Content-Type: application/json' debezeum:8083/connectors --data
#       {
#         "name": "coredata-connector",  
#         "config": {   
#               "connector.class": io.debezium.connector.postgresql.PostgresConnector,
#               "connector.client.config.override.policy": "all",
#               "database.hostname": pg_container,
#               "database.port": 5432,
#               "database.user": root,
#               "database.password": "root",
#               "database.dbname" : core_data,
#               "database.server.name": coredata,
#               "table.include.list": "public.debezeum_signals,public.hours,public.miners_data,public.miners",
#               "publication.autocreate.mode": "filtered",
#               "publication.name": "demo_coredata_dbz_publication",
#               "signal.data.collection": "public.debezium_signals",
#               "transforms": unwrap,Reroute,route,
#               "transforms.unwrap.type": io.debezium.transforms.ExtractNewRecordState,
#               "transforms.unwrap.drop.tombstones": "false",
#               "decimal.handling.mode": string,
#               "transforms.Reroute.type": "io.debezium.transforms.ByLogicalTableRouter",
#               "transforms.Reroute.topic.regex": "(?:.+)(?:\\.)(?:.+)(?:\\.)([a-zA-Z]+(?:_[a-zA-Z]+)*)(?:_[0-9]*)?",
#               "transforms.Reroute.topic.replacement": "coredata_public_",
#               "key.enforce.uniqueness": "false",
#               "session.timeout.ms": 25000,
#               "heartbeat.interval.ms": 10000,
#               "max.queue.size": 589824,
#               "max.batch.size": 16384,
#               "poll.interval.ms": 10000,
#               "offset.flush.timeout.ms": 30000,
#               "offset.flush.interval.ms": 10000,
#               "snapshot.fetch.size": 150000,
#               "snapshot.mode": never,
#               "plugin.name": pgoutput,
#               "slot.name": "demo_coredata_connector",
#               "slot.drop.on.stop": "false",
#               "schema.refresh.mode": "columns_diff_exclude_unchanged_toast" 
#               } 
#       }'
sleep infinity