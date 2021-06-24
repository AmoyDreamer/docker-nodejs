# docker-nodejs
A docker image of [Node.js](https://nodejs.org/) that supports [PM2](https://pm2.keymetrics.io/docs/usage/quick-start/).

## Download
```
docker pull amoydreamer/nodejs:14.17.0-pm2
```
## Usage

### Ready
You need edit a config file named **process.json** in pm2_configs directory to support node process management. Your local directory structure like this => **/path/to/pm2_configs/process.json**, in order to mount data volumes when creating containers.

### Create a runtime container with current image
```
docker run --name nodejs14.17.0-pm2 -d \
--restart=always \
-v /path/to/pm2_configs/:/data/pm2/ \
amoydreamer/nodejs
```

## License
docker-nodejs is [MIT licensed](https://github.com/AmoyDreamer/docker-nodejs/blob/master/LICENSE).
