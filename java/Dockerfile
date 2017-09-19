# Version: 0.0.1
FROM ubuntu:trusty
MAINTAINER jingyuan

RUN \
	apt-get update && \
	apt-get install -y ssh rsync && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update && \
	apt-get install -y oracle-java8-installer && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Chinese language
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8

CMD ["/bin/bash"]
