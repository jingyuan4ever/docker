# Version: 0.0.2
FROM ubuntu:trusty
MAINTAINER jingyuan

ENV DEBIAN_FRONTEND noninteractive

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bk
ADD ./sources.list /etc/apt/sources.list

# 中文支持
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8
ENV LANG zh_CN.utf8

CMD ["/bin/bash"]
