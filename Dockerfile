# basic image
FROM centos:7.9.2009

# update software package, install dependencies, set localtime
RUN yum install -y deltarpm \
    && yum -y update \
    && yum install -y wget rsync gcc gcc-c++ make \
    && cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# download compressed package of node source code and unzip it
RUN wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.gz -P /root \
    && tar -zxvf /root/node-v14.17.0-linux-x64.tar.gz -C /root

# set environment variable
ENV PATH="/root/node-v14.17.0-linux-x64/bin:${PATH}"

# install PM2 and remove node package
RUN npm install pm2 -g \
    && rm -rf /root/node-v14.17.0-linux-x64.tar.gz

CMD ["sh", "-c", "pm2 start /data/pm2/process.json; pm2 logs"]
