# Base images 基础镜像
FROM mirrors.tencent.com/todacc/tlinux2.2-64bit:0.2.0

#MAINTAINER 维护者信息
LABEL MAINTAINER="iceshi"

#ENV 设置环境变量
ENV PATH /usr/local/nginx/sbin:$PATH

#RUN 执行以下命令
RUN yum install -y wget nginx && yum clean all
RUN wget https://raw.githubusercontent.com/icesyc/nginx_php_conf/main/nginx.conf && mv nginx.conf /etc/nginx/nginx.conf

#WORKDIR 相当于cd
WORKDIR /usr/local/app

EXPOSE 80
CMD ["nginx"]