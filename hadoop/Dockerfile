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

# Hadoop env
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION
ENV PATH=$HADOOP_HOME/bin/:$PATH
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native

# Spark env
RUN ln -s /opt/spark-$SPARK_VERSION-bin-hadoop2.7 /etc/spark
ENV SPARK_HOME /opt/spark-$SPARK_VERSION-bin-hadoop2.7
ENV PATH=$SPARK_HOME/bin/:$PATH

# Install JDBC
# ENV JDBC_VERSION 5.1.44
# RUN curl -fSL "https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-$JDBC_VERSION.tar.gz" -o /tmp/jdbc.tar.gz \
#	&& tar -xvf /tmp/jdbc.tar.gz -C /tmp/ \
#	&& mkdir $SPARK_HOME/lib \
#	&& cp /tmp/mysql-connector-java-5.1.44/mysql-connector-java-$JDBC_VERSION-bin.jar $SPARK_HOME/lib/ \
#	&& rm -rf /tmp/jdbc.tar.gz /tmp/mysql-connector-java-$JDBC_VERSION

# ENV SPARK_CLASSPATH=$SPARK_HOME/lib/mysql-connector-java-$JDBC_VERSION-bin.jar:$SPARK_CLASSPATH

RUN apt-get install -y --no-install-recommends python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python \
	&& ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install requests

# clean
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
