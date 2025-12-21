# 云服务器部署工程方法

作者：小傅哥
<br/>博客：[https://bugstack.cn](https://bugstack.cn)

> 沉淀、分享、成长，让自己和他人都能有所收获！😄

大家好，我是技术UP主小傅哥。

在实践中发现，不少伙伴不了解云服务器是什么，搞不清楚云服务器和本地电脑的关系，也不知道怎么把一个项目部署到云服务器。但作为程序员学习编程，又离不开云服务器，逃避不了一点！

<div align="center">
    <img src="https://bugstack.cn/images/roadmap/tutorial/road-map-github-actions-workflows-01.png" width="150px">
</div>

**看看是不你也遇到了这些问题**

云服务器选什么系统、云服务器怎么安装环境、Intellij IDEA 怎么连接云服务器、云服务器安装了 Docker 本地电脑还用安装吗、SpringBoot 项目怎么部署到云服务器、构建的镜像推送不到 Docker Hub 怎么办？

等等，一些列的问题，把小白拦截在云服务器的门外。不过，没关系，今天小傅哥就帮你把这接腿🦵🏻的事办啦，让你以后畅通无阻。

>文末提供了，5个AI项目、5个业务项目、8个组件项目、1套源码项目，还有非常多的学习资料，你可以全部获取学习，积累来自互联网大厂的经验。

## 一、云服务器是什么？

在使用云服务器之前，我们先来理解下云服务器是什么，把定位搞清楚，后面的事才好办。如图；

<div align="center">
    <img src="/Users/fuzhengwei/Desktop/road-map-docker-deploy-01.png" width="650px">
</div>

- 云服务器，你可以理解为是你的书桌上摆着的2台电脑。你可以通过其中一台电脑，以 SSH 方式连接另外一台电脑，并在另外一台电脑安装 MySQL、Redis、Ollama 等，以减轻当前这台电脑的压力。让手里的这台电脑只负责代码开发，需要什么资源就连接另外一台电脑的上软件即可。
- 现在为了方便的让每个人都可以拥有自己的另外一台电脑，有一些公司就把电脑集中起来搭建成了服务器机房，在通过提供公网IP让你在购买云服务器后，可以用你的电脑连接上云服务器电脑，进行软件的部署和程序对软件的连接。

## 二、云服务器咋操作（命令）

当然，云服务器的操作也需要一点 Linux 命令的知识，它不是那种`点点点`的方式使用电脑，而是通过命令行。比如，`ls` 查看文件列表、`mkdir` 创建文件夹、`chmod +x` 给文件授予执行权限，当然也有些死鬼告诉你执行 `rm -rf /*` 今天一天都不用干活！

为了，让小伙伴们，先不需要看非常的多的资料，就能快速的使用起这些命令。这里小傅哥做了个模拟 Linux 服务器，进行命令练习的网页，你可以通过页面的模拟建立 SSH 连接，之后学习这些命令。

<div align="center">
    <img src="/Users/fuzhengwei/Desktop/road-map-docker-deploy-02.png" width="750px">
</div>

地址：[https://gaga.plus/app/dev-ops/tutorials/what-is-a-cloud-server.html](https://gaga.plus/app/dev-ops/tutorials/what-is-a-cloud-server.html)

说明：你每点击一个右侧的命令，他就会在左侧进行输入，之后提示命令的用途和效果。这些命令包括了常用的文件、目录、系统、用户的操作，也给大家增加了 Git、Docker、Maven 的命令（右侧往下翻即可）

## 三、云系统环境安装

### 1. 环境选择

在你首次购买和设置云服务器的时候，它会让你选择需要安装的系统（也可以重置重新安装），安装完成后你就可以通过命令操作，部署 Docker 以及安装软件了。

<div align="center">
    <img src="/Users/fuzhengwei/Desktop/road-map-docker-deploy-03.png" width="550px">
</div>

这里比较推荐 Centos 7.6、7.9 或则 Ubuntu 24+，这两个系统，我已经做好了一键安装脚本，可以让你非常方便的把 Docker 以及一些常用的软件，全部安装完成。

### 2. 安装脚本

#### 2.1 Git 安装

**Centos**

```java
sudo yum install git
```

**Ubuntu**

```java
# sudo apt update
# sudo apt install nodejs npm
# node -v
# npm -v
```


```java
apt-get install git
```

#### 2.2 Docker + Portainer

```java
root@iv-ydw2iok0lcbw80bxaha0:~# ls
root@iv-ydw2iok0lcbw80bxaha0:~# cd /
root@iv-ydw2iok0lcbw80bxaha0:/# mkdir dev-ops
root@iv-ydw2iok0lcbw80bxaha0:/# ls
bin                cdrom    etc   lib64              media  proc  sbin                sys  var
bin.usr-is-merged  dev      home  lib.usr-is-merged  mnt    root  sbin.usr-is-merged  tmp
boot               dev-ops  lib   lost+found         opt    run   srv                 usr
root@iv-ydw2iok0lcbw80bxaha0:/# cd dev-ops/
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops# ls
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops# git clone https://gitcode.com/Yao__Shun__Yu/xfg-dev-tech-docker-install.git
Cloning into 'xfg-dev-tech-docker-install'...
remote: Enumerating objects: 181, done.
remote: Counting objects: 100% (35/35), done.
remote: Compressing objects: 100% (21/21), done.
remote: Total 181 (delta 20), reused 25 (delta 14), pack-reused 146 (from 1)
Receiving objects: 100% (181/181), 12.51 MiB | 1.26 MiB/s, done.
Resolving deltas: 100% (75/75), done.
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops# ls
xfg-dev-tech-docker-install
```

- 推荐；git clone https://gitcode.com/Yao__Shun__Yu/xfg-dev-tech-docker-install.git
- 备用；git clone https://github.com/fuzhengwei/xfg-dev-tech-docker-install.git

- 在 Linux 系统的根目录，通过命令创建一个空文件夹，进入文件夹，通过 git clone 检出代码。
- 这里有2个地址，如果 github.com 检出很慢，可以使用 gitcode.com 地址检出。

```java
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# chmod +x ubuntu_run_install_docker_local.sh 
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# ./ubuntu_run_install_docker_local.sh 
[INFO] 使用本地Docker安装脚本: ubuntu_install_docker.sh
[INFO] 设置可执行权限...
[INFO] 开始执行Docker安装脚本...
[INFO] 注意：安装过程可能需要root权限，如果需要会自动请求
-----------------------------------------------------------
[INFO] docker 环境安装脚本 By xiaofuge，建议使用 https://618.gaga.plus 优惠购买服务器，安装 Ubuntu 24.04 LTS 系统。
[INFO] 开始安装 Docker 环境...
[INFO] 检查系统信息...
内核版本: 6.8.0-55-generic
操作系统: Ubuntu 24.04 LTS
[INFO] 检测网络连接状态...
[INFO] 网络连接正常，可以访问: https://www.baidu.com
[INFO] 网络连接检测通过
...
Status: Downloaded newer image for registry.cn-hangzhou.aliyuncs.com/xfg-studio/portainer:latest
1c2d6211944ced359ebec2e5d28b9cf30eec55bc781b386838c54abc944ed1f3
[INFO] Portainer安装成功！
[WARNING] 重要提示：请确保您的云服务器已开放9000端口！
-----------------------------------------------------------
Portainer访问方式：
1. 通过公网访问：http://您的服务器公网IP:9000
2. 首次访问需要设置管理员账号和密码
3. 登录后即可通过Web界面管理Docker容器
-----------------------------------------------------------
[INFO] 您可以使用Portainer来方便地管理Docker容器、镜像、网络和卷等资源
```

- Centos 执行 `chmod +x centos_run_install_docker_local.sh` `./centos_run_install_docker_local.sh`
- Ubuntu 执行 `chmod +x ubuntu_run_install_docker_local.sh` `./ubuntu_run_install_docker_local.sh`

执行的中间，他会有一些提示你的操作，你可以按照提示输入之后继续运行就好。安装到最后，Docker + Portainer 就安装完成了。注意，云服务器的访问，需要开放对应的端口在云服务器的安全组中找到出入站配置（也可以在云服务器官网搜，他都会提供文档）。

#### 2.3 软件安装（JDK、Maven）可选

在 xfg-dev-tech-docker-install 一键安装脚本中，还有提供 JDK、Maven 的安装。这个软件安全是为了在云服务器直接构建 Java 项目，如果你不需要，是完全可以不用安装的。

**Centos 安装**

```java
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# ls
centos_install_docker.sh            help.md                  software
centos_run_install_docker_local.sh  README.md                ubuntu_install_docker.sh
environment                         run_install_software.sh  ubuntu_run_install_docker_local.sh
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# cd environment/
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment# ls
jdk  maven
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment# cd jdk/
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/jdk# ls
install-java.sh  remove-java.sh
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/jdk# chmod +x install-java.sh 
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/jdk# ./install-java.sh 
[INFO] 开始JDK安装程序...
[INFO] 检测到系统: Ubuntu 24.04

[INFO] 请选择要安装的JDK版本：
1. JDK 8 (1.8.0_202)
2. JDK 17 (17.0.14)

请选择版本 (1/2): 1
[INFO] 已选择JDK 8
[INFO] JDK配置: 版本=1.8.0_202, 包名=jdk-8u202-linux-x64.tar.gz
[INFO] 检查并安装依赖包...
[INFO] JDK包已存在: ./jdk-8u202-linux-x64.tar.gz
[SUCCESS] JDK包验证通过
[INFO] 开始安装JDK 1.8.0_202 到: /usr/local/java
[INFO] 解压JDK包...
[SUCCESS] JDK解压完成
...
\033[0;34m环境变量:\033[0m
JAVA_HOME=/usr/local/java
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar
是否删除下载的JDK包? (y/N): N
[SUCCESS] JDK 1.8.0_202 安装完成!
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/jdk# java -version
```

```java
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment# ls
jdk  maven
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment# cd maven/
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/maven# ls
apache-maven-3.8.8.zip  install-maven.sh  remove-maven.sh
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/maven# chmod +x install-maven.sh 
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/maven# ./install-maven.sh 
[INFO] 开始Maven安装程序...
[INFO] 检测到系统: Ubuntu 24.04
[INFO] 检测到Java版本: 1.8.0_472
[INFO] 检查并安装依赖包...
[SUCCESS] Maven包验证通过
[INFO] 开始安装Maven 3.8.8 到: /usr/local/maven
[INFO] 解压Maven包...
[SUCCESS] Maven解压完成
[INFO] 配置环境变量...
[SUCCESS] 环境变量配置完成
[INFO] 环境变量已在当前会话中生效
[INFO] 验证安装...
[SUCCESS] Maven安装成功!
```

**Ubuntu 安装**

```java
sudo apt update
sudo apt install openjdk-8-jdk
  
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment# java -version
openjdk version "1.8.0_472"
OpenJDK Runtime Environment (build 1.8.0_472-8u472-ga-1~24.04-b08)
OpenJDK 64-Bit Server VM (build 25.472-b08, mixed mode)
```

```java
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/maven# apt install maven
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically in
  
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/maven# mvn --version
Apache Maven 3.8.7
Maven home: /usr/share/maven
...  
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/environment/maven# cd /usr/share/maven
root@iv-ydw2iok0lcbw80bxaha0:/usr/share/maven# ls
bin  boot  conf  lib  man
root@iv-ydw2iok0lcbw80bxaha0:/usr/share/maven# cd conf
root@iv-ydw2iok0lcbw80bxaha0:/usr/share/maven/conf# ls
logging  m2.conf  settings.xml  toolchains.xml  
```

Ubuntu 基本通过 apt 就可以完整这些软件的安装了。注意进入 conf 替换 settings.xml 文件带有阿里云 maven 镜像的地址。

地址：[https://gitcode.com/Yao__Shun__Yu/xfg-dev-tech-docker-install/blob/main/environment/maven/apache-maven-3.8.8/conf/settings.xml](https://gitcode.com/Yao__Shun__Yu/xfg-dev-tech-docker-install/blob/main/environment/maven/apache-maven-3.8.8/conf/settings.xml)

#### 2.4 软件安装（MySQL、Redis）

```java
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# cd software/
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/software# ls
docker-compose-software-aliyun.yml  grafana  logstash  pgvector    rabbitmq
docker-compose-software.yml         kibana   mysql     prometheus  redis
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install/software# cd ..
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# ls
centos_install_docker.sh            help.md                  software
centos_run_install_docker_local.sh  README.md                ubuntu_install_docker.sh
environment                         run_install_software.sh  ubuntu_run_install_docker_local.sh
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# chmod +x run_install_software.sh 
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-install# ./run_install_software.sh 
[INFO] 当前磁盘空间信息：总空间 40G，已使用 4.3G，可用 34G，使用率 12%
-----------------------------------------------------------
[HEADER] 选择配置文件：
-----------------------------------------------------------
1. 使用原始配置文件 (推荐，但可能需要从Docker Hub拉取镜像)
2. 使用阿里云镜像配置文件 (国内网络环境推荐)
-----------------------------------------------------------
请选择配置文件 [1/2] (默认: 1): 1
[INFO] 已选择使用原始配置文件
-----------------------------------------------------------
[HEADER] 可安装的软件列表：
-----------------------------------------------------------
1. nacos (预计占用空间: 500MB)
2. mysql (预计占用空间: 600MB)
3. phpmyadmin (预计占用空间: 100MB)
4. redis (预计占用空间: 50MB)
5. redis-admin (预计占用空间: 50MB)
6. rabbitmq (预计占用空间: 300MB)
7. elasticsearch (预计占用空间: 500MB)
8. logstash (预计占用空间: 300MB)
9. kibana (预计占用空间: 200MB)
10. xxl-job-admin (预计占用空间: 150MB)
11. prometheus (预计占用空间: 100MB)
12. grafana (预计占用空间: 100MB)
13. ollama (预计占用空间: 200MB)
14. pgvector (预计占用空间: 150MB)
15. pgvector-admin (预计占用空间: 50MB)
-----------------------------------------------------------
请选择要安装的软件（多选，用空格分隔，如：1 3 5）：
2 3
-----------------------------------------------------------
[HEADER] 您选择了以下软件：
- phpmyadmin (预计占用空间: 100MB)
- mysql (预计占用空间: 600MB)
总计预计占用空间: 700MB
-----------------------------------------------------------
-----------------------------------------------------------
[HEADER] MySQL初始化提示：
-----------------------------------------------------------
[INFO] 您选择了安装MySQL，安装完成后可以使用phpmyadmin进行管理
[INFO] 如果您希望在初始化时创建数据库和表，可以将SQL脚本放在以下目录：
  /dev-ops/xfg-dev-tech-docker-install/software/mysql/sql/
[INFO] 目前该目录已包含以下SQL文件：
  - init.sql
  - nacos.sql
  - xxl_job.sql
[INFO] 您可以添加自己的SQL文件到该目录，它们将在MySQL初始化时自动执行
-----------------------------------------------------------
确认安装以上软件？(y/n): y
[INFO] 正在检查服务依赖关系...
[INFO] 开始安装选中的软件...
[+] Running 34/34
 ✔ phpmyadmin 21 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                              499.9s 
   ✔ 858a356e9dad Pull complete                                                                       1.7s 
 ✔ Container phpmyadmin         Started                                                               5.8s 
[INFO] 软件安装完成！
-----------------------------------------------------------
[HEADER] 已安装的软件及访问信息：
- phpmyadmin: 访问地址：http://服务器IP:8899 (连接到MySQL)
- mysql: 账号：root 密码：123456 端口：13306
[INFO] MySQL已安装成功，您可以使用phpmyadmin进行管理
[INFO] 初始化SQL脚本已自动执行，包括：
  - init.sql
  - nacos.sql
  - xxl_job.sql
-----------------------------------------------------------
[INFO] 如需修改账号密码，请编辑 /dev-ops/xfg-dev-tech-docker-install/software/docker-compose-software.yml 文件
[INFO] 修改后，重新运行此脚本即可更新配置  
```

- 执行提供好的脚本，即可完成各项软件的安装。其他的软件，也可以搜索教程安装。

### 3. 应用配置

<div align="center">
    <img src="/Users/fuzhengwei/Desktop/road-map-docker-deploy-04.png" width="750px">
</div>

- 云服务器环境 Docker + Portainer（管理docker的软件） 以及软件安装完成后，你就可以在你的 IntelliJ IDEA 的程序里配置对应的连接信息了。这样你的本地就可以连接到云服务器上的 Docker 里安装的 MySQL 了。
- Docker 是非常常用的软件，也是非常好用的软件，对于开发学习部署和卸载各类软件都非常方便，不会破坏本地环境。

## 四、项目部署

Docker 部署项目需要的是程序的镜像，镜像的目的是把一个程序运行所需的各类环境都给打包进行，等运行部署的时候直接执行即可。

所以，这里我们会通过各种方式来完成镜像的构建和部署，包括；
| 方案                                                         | 复杂度 |
| ------------------------------------------------------------ | ------ |
| 本地打包Jar + 云上构建镜像。                                 | ⭐️⭐️     |
| 云上打包Jar + 云上构建镜像。                                 | ⭐️⭐️⭐️    |
| 本地打包Jar + 本地构建镜像 + 上传到阿里云 Docker 镜像仓库 + 云上拉取构建 | ⭐️⭐️⭐️⭐️   |

### 1. 文件配置

#### 1.1 dockerfile

```java
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
```

- 这里配置了构建镜像的地址信息。

#### 1.2 build.sh

```java
# 普通镜像构建，随系统版本构建 amd/arm
docker build -t system/xfg-dev-tech-docker-deploy-app:1.0-SNAPSHOT -f ./Dockerfile .

# 兼容 amd、arm 构建镜像
# docker buildx build --load --platform liunx/amd64,linux/arm64 -t xiaofuge/xfg-frame-archetype-app:1.0 -f ./Dockerfile . --push
```

- 配置了构建镜像的名称。

### 2. 获取镜像

#### 2.1 本地打包Jar + 云上构建镜像

##### 2.1.1 构建jar 

<div align="center">
    <img src="/Users/fuzhengwei/Desktop/road-map-docker-deploy-05.png" width="750px">
</div>

- 在本地 install 构建项目 jar，target 目录下可以只保留项目的 jar 其他的删掉就可以。

##### 2.1.2 上传jar

<div align="center">
    <img src="/Users/fuzhengwei/Desktop/road-map-docker-deploy-06.png" width="750px">
</div>

- 把本地构建的jar，通过 sftp 把整个 xfg-dev-tech-deploy-app 上传到云服务器。

##### 2.1.3 构建镜像

```java
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops# ls
xfg-dev-tech-docker-deploy-app  xfg-dev-tech-docker-install
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops# cd xfg-dev-tech-docker-deploy-app/
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-deploy-app# ls
build.sh  Dockerfile  pom.xml  src  target
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-deploy-app# chmod +x build.sh 
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-deploy-app# ./build.sh 
[+] Building 64.5s (8/8) FINISHED                                                           docker:default
 => [internal] load build definition from Dockerfile                                                  0.0s
 => => transferring dockerfile: 484B                                                                  0.0s
 => WARN: MaintainerDeprecated: Maintainer instruction is deprecated in favor of using label (line 5  0.0s
 => [internal] load metadata for registry.cn-hangzhou.aliyuncs.com/xfg-studio/openjdk:8-jre-slim      0.7s
 => [internal] load .dockerignore                                                                     0.0s
 => => transferring context: 2B                                                                       0.0s
...
 => => unpacking to docker.io/system/xfg-dev-tech-docker-deploy-app:1.0-SNAPSHOT                      0.1s

 1 warning found (use docker --debug to expand):
 - MaintainerDeprecated: Maintainer instruction is deprecated in favor of using label (line 5)
root@iv-ydw2iok0lcbw80bxaha0:/dev-ops/xfg-dev-tech-docker-deploy-app# docker images
                                                                                       i Info →   U  In Use
IMAGE                                                      ID             DISK USAGE   CONTENT SIZE   EXTRA
mysql:8.0.32                                               f496c25da703        728MB          157MB    U   
phpmyadmin:5.2.1                                           6e75aa8f767c        798MB          193MB    U   
registry.cn-hangzhou.aliyuncs.com/xfg-studio/portainer:latest
                                                           11384457b374        374MB         86.8MB    U   
system/xfg-dev-tech-docker-deploy-app:1.0-SNAPSHOT         14e1cd401829        332MB         98.2MB  
```

- 通过这样的方式就把整个镜像构建出来，`docker images` 可以查看镜像列表，system/xfg-dev-tech-docker-deploy-app:1.0-SNAPSHOT 就是咱们构建的镜像。

### 2.2 云上打包Jar + 云上构建镜像



