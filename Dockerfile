# basic image
FROM centos:7.9.2009

# update software package, install dependencies, set localtime
RUN yum install -y deltarpm \
    && yum -y update \
    && yum install -y wget rsync gcc gcc-c++ make \
    && cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# download compressed package of node source code and unzip it, set global variable, install PM2
RUN wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.gz -P /root \
    && tar -zxvf /root/node-v14.17.0-linux-x64.tar.gz -C /root \
    && ln -sv /root/node-v14.17.0-linux-x64/bin/npm /usr/local/bin/ \
    && ln -sv /root/node-v14.17.0-linux-x64/bin/node /usr/local/bin/ \
    && ln -sv /root/node-v14.17.0-linux-x64/bin/npx /usr/local/bin/ \
    && npm install pm2 -g \
    && ln -sv /root/node-v14.17.0-linux-x64/bin/pm2 /usr/local/bin/ \
    && ln -sv /root/node-v14.17.0-linux-x64/bin/pm2-dev /usr/local/bin/ \
    && ln -sv /root/node-v14.17.0-linux-x64/bin/pm2-docker /usr/local/bin/ \
    && ln -sv /root/node-v14.17.0-linux-x64/bin/pm2-runtime /usr/local/bin/ \
    && rm -rf /root/node-v14.17.0-linux-x64.tar.gz

CMD ["pm2-runtime", "start", "/data/pm2/process.json"]
