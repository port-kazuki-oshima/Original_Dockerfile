From centos:latest
MAINTAINER pt1311
RUN yum -y install epel-release
RUN echo -e "sed -i -e "s/enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo"|bash
RUN rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum -y install --enablerepo=epel nginx

ENTRYPOINT /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf