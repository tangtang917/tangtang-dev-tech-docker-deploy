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

## 四、项目部署



