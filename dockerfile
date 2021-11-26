# Base images 基础镜像
FROM mirrors.tencent.com/todacc/tlinux2.2-64bit:0.2.0

#MAINTAINER 维护者信息
LABEL MAINTAINER="iceshi"

#ENV 设置环境变量
ENV PATH /usr/local/nginx/sbin:$PATH

#安装nginx
RUN yum install -y wget nginx && yum clean all
RUN wget https://raw.githubusercontent.com/icesyc/nginx_php_conf/main/nginx.conf && mv nginx.conf /etc/nginx/nginx.conf

#安装php
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm && yum-config-manager --enable remi-php74 && yum -y install php php-fpm php-mysql php-mbstring php-redis

#修改目录权限
RUN chmod o+x /usr/local/app

#WORKDIR 相当于cd
WORKDIR /usr/local/app

EXPOSE 8080
CMD ["nginx"]