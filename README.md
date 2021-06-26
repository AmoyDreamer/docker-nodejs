# docker-nodejs
A docker image of [Node.js](https://nodejs.org/) that supports [PM2](https://pm2.keymetrics.io/docs/usage/quick-start/) and [AliNode](https://help.aliyun.com/document_detail/60321.html?spm=a2c4g.11186623.6.542.6da0a70f3JVD8a).

## Download
```
docker pull amoydreamer/nodejs:14.16.0-alinode
```
## Usage

### Ready
- You need edit a config [file](https://pm2.keymetrics.io/docs/usage/process-management/#process-configuration) named **process.json** in pm2 directory to support node process management. Your local directory structure like this => **/path/to/pm2/process.json**.
- You can edit a config [file](https://help.aliyun.com/document_detail/60338.html?spm=a2c4g.11186623.6.548.54a65a966MfD3F) named **config.json** in pm2 directory to support node process monitor. Your local directory structure like this => **/path/to/pm2/config.json**.
- The directory **/path/to/pm2/** must be mounted data volumes when creating containers.

### Create a runtime container with current image
```
docker run --name nodejs14.16.0-alinode -d \
--restart=always \
-v /path/to/pm2/:/data/pm2/ \
amoydreamer/nodejs:14.16.0-alinode
```

## License
docker-nodejs is [MIT licensed](https://github.com/AmoyDreamer/docker-nodejs/blob/master/LICENSE).
