FROM    centos:7
RUN yum -y update && yum -y install epel-release && yum -y install httpd psacct python3 python3-pip mod_proxy_uwsgi gcc python3-devel haproxy && yum clean all

RUN pip3 install --upgrade pip
RUN pip3 install virtualenv flask uwsgi

EXPOSE  80 443
COPY entrypoint.sh /
COPY app /app
COPY httpd/faro.conf /etc/httpd/conf.d/
RUN sed -i 's/Listen 80/Listen 88/g' /etc/httpd/conf/httpd.conf
COPY haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY certs/faro.pem /etc/ssl/certs/faro.pem

ENTRYPOINT ["/entrypoint.sh"]
CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]
