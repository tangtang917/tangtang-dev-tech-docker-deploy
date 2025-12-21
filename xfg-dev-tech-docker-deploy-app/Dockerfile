# 基础镜像 openjdk:8-jre-slim
FROM registry.cn-hangzhou.aliyuncs.com/xfg-studio/openjdk:8-jre-slim

# 作者
MAINTAINER xiaofuge

# 配置
ENV PARAMS=""

# 时区
ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 添加应用
ADD target/xfg-dev-tech-docker-deploy-app.jar /xfg-dev-tech-docker-deploy-app.jar

ENTRYPOINT ["sh","-c","java -jar $JAVA_OPTS /xfg-dev-tech-docker-deploy-app.jar $PARAMS"]