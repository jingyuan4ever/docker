# Version: 0.0.1
FROM jingyuan4ever/java:latest
MAINTAINER jingyuan


# For hadoop
RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends ssh rsync curl

# You can download hadoop here.
# http://hadoop.apache.org/releases.html

ENV HADOOP_VERSION 2.8.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
	&& curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
	&& curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
	&& curl -fSL "https://dist.apache.org/repos/dist/release/hadoop/common/KEYS" -o /tmp/HADOOP_KEYS \
	&& gpg --import /tmp/HADOOP_KEYS \
	&& gpg --verify /tmp/hadoop.tar.gz.asc \
	&& tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
	&& rm /tmp/hadoop.tar.gz*



# For spark
ENV SPARK_VERSION 2.2.0
ENV SPARK_URL http://www.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz
RUN set -x \
	&& curl -fSL "$SPARK_URL" -o /tmp/spark.tar.gz \
	&& curl -fSL "$SPARK_URL.asc" -o /tmp/spark.tar.gz.asc \
	&& curl -fSL "https://www.apache.org/dist/spark/KEYS" -o /tmp/SPARK_KEYS \
	&& gpg --import /tmp/SPARK_KEYS \
	&& gpg --verify /tmp/spark.tar.gz.asc \
	&& tar -xvf /tmp/spark.tar.gz -C /opt/ \
	&& rm /tmp/spark.tar.gz*

RUN apt-get install -y --no-install-recommends python-dev

# clean
RUN rm -rf /var/lib/apt/lists/*

# Hadoop env
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION
ENV PATH=$HADOOP_HOME/bin/:$PATH
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native

# Spark env
RUN ln -s /opt/spark-$SPARK_VERSION-bin-hadoop2.7 /etc/spark
ENV SPARK_HOME /opt/spark-$SPARK_VERSION-bin-hadoop2.7
ENV PATH=$SPARK_HOME/bin/:$PATH

CMD ["/bin/bash"]
