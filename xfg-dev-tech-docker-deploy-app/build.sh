# 普通镜像构建，随系统版本构建 amd/arm
#docker build -t fuzhengwei/xfg-dev-tech-docker-deploy-app:1.5-SNAPSHOT -f ./Dockerfile .

docker build --platform linux/amd64 --load -t fuzhengwei/xfg-dev-tech-docker-deploy-app:1.5-SNAPSHOT -f ./Dockerfile .

# 兼容 amd、arm 构建镜像
#docker buildx build --load --platform linux/amd64,linux/arm64 -t system/xfg-dev-tech-docker-deploy-app:1.1-SNAPSHOT -f ./Dockerfile .