# Version: 0.0.1
FROM jingyuan4ever/java:latest
MAINTAINER jingyuan

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
	&& curl -fSL "https://dist.apache.org/repos/dist/release/hadoop/common/KEYS" -o /tmp/KEYS \
	&& gpg --import /tmp/KEYS \
	&& gpg --verify /tmp/hadoop.tar.gz.asc \
	&& tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
	&& rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
ENV HADOOP_PREFIX /opt/hadoop-$HADOOP_VERSION
ENV PATH=$HADOOP_PREFIX/bin/:$PATH

CMD ["/bin/bash"]
