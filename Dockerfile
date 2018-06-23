#Container for Spark-Kafka-Cassandra
FROM alpine:latest

RUN apk --update --no-cache add openjdk8-jre \
        python \
        py-pip \
        sudo \
        curl \
        zip \
        bzip2 \
        git \
        bash

RUN adduser -D -h /pavi pavi -u 1000

ENV HOME /pavi
WORKDIR $HOME

USER pavi

#Install Spark
RUN wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz
RUN tar xvzf spark-2.1.1-bin-hadoop2.7.tgz
RUN mv spark-2.1.1-bin-hadoop2.7 spark

ENV SPARK_HOME $HOME/spark

#Install Kafka
RUN wget http://mirrors.dotsrc.org/apache/kafka/0.10.2.1/kafka_2.11-0.10.2.1.tgz
RUN tar xvzf kafka_2.11-0.10.2.1.tgz
RUN mv kafka_2.11-0.10.2.1 kafka

#Install Zeppelin
RUN wget http://www-us.apache.org/dist/zeppelin/zeppelin-0.7.3/zeppelin-0.7.3-bin-netinst.tgz
RUN tar xvzf zeppelin-0.7.3-bin-netinst.tgz
RUN mv zeppelin-0.7.3-bin-netinst zeppelin

#Install Cassandra
RUN wget http://www-eu.apache.org/dist/cassandra/3.11.2/apache-cassandra-3.11.2-bin.tar.gz
RUN tar xvzf apache-cassandra-3.11.2-bin.tar.gz
RUN mv apache-cassandra-3.11.2 cassandra

ENV PATH $HOME/spark/bin:$HOME/spark/sbin:$HOME/kafka/bin:$HOME/zeppelin/bin:$HOME/cassandra/bin:$PATH


