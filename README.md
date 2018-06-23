#Spark Cassandra Kafka Docker

A docker image based on Alpine Linux that has Apache Spark, Kafka, Cassandra and Zeppelin.

This image could serve as a docker image for Lambda Architecture projects.

To build the image
```
docker build -t spark-kafka-cassandra .
```

To run the image
```
docker run -p 4040:4040 -p 8888:8888 -p 8080:8080 -p 23:22 -ti spark-kafka-cassandra
```