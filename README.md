# docker-nodejs
A docker image of [Node.js](https://nodejs.org/) that supports [PM2](https://pm2.keymetrics.io/docs/usage/quick-start/).

## Download
```
docker pull amoydreamer/nodejs:14.17.0-pm2
```
## Usage

### Ready
- You need edit a config [file](https://pm2.keymetrics.io/docs/usage/process-management/#process-configuration) named **process.json** in pm2 directory to support node process management. Your local directory structure like this => **/path/to/pm2/process.json**.
- The directory **/path/to/pm2/** must be mounted data volumes when creating containers.

### Create a runtime container with current image
```
docker run --name nodejs14.17.0-pm2 -d \
--restart=always \
-v /path/to/pm2/:/data/pm2/ \
amoydreamer/nodejs:14.17.0-pm2
```

## License
docker-nodejs is [MIT licensed](https://github.com/AmoyDreamer/docker-nodejs/blob/master/LICENSE).
