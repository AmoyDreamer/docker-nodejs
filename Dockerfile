# basic image
FROM centos:7.9.2009

# update software package, install dependencies, set localtime
RUN yum install -y deltarpm \
    && yum -y update \
    && yum install -y wget rsync gcc gcc-c++ make \
    && cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# install tnvm、alinode、pm2、agenthub
RUN wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash \
    && source ~/.bashrc \
    && tnvm install alinode-v6.5.0 \
    && tnvm use alinode-v6.5.0 \
    && npm install pm2 @alicloud/agenthub -g

ENV PATH="/root/.tnvm/versions/alinode/v6.5.0/bin:${PATH}"
CMD ["sh", "-c", "agenthub start /data/pm2/config.json; ENABLE_NODE_LOG=YES pm2 start /data/pm2/process.json; pm2 logs"]
