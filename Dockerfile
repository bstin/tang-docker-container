FROM centos:7

LABEL maintainer="Adrian Lucrèce Céleste <adrianlucrececeleste@airmail.cc>"

RUN yum -y update && yum -y install tang xinetd && yum clean all && rm -rf /var/cache/yum
EXPOSE 80

COPY tangd.xinetd /etc/xinetd.d/tangd
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/xinetd","-dontfork"]
