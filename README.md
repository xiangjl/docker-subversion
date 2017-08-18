# 基于CentOS的Subversion版本控制系统

请使用以下命令部署容器：

```
git clone https://github.com/xiangjl/docker-subversion.git

cd docker-subversion/

docker build -t xiangjl/subversion .

docker run -d --name subversion \
  -p 80:80/tcp \
  -p 443:443/tcp \
  -v /configdir/of/your/choice:/subversion \
  -v /reposdir/of/your/choice:/repos \
  --restart=always \
  xiangjl/subversion
```

更多信息，访问以下网站:
 * http://subversion.apache.org/


# Docker Image for Subversion

To start the subversion, launch a container like this:

```
git clone https://github.com/xiangjl/docker-subversion.git

cd docker-subversion/

docker build -t xiangjl/subversion .

docker run -d --name subversion \
  -p 80:80/tcp \
  -p 443:443/tcp \
  -v /configdir/of/your/choice:/subversion \
  -v /reposdir/of/your/choice:/repos \
  --restart=always \
  xiangjl/subversion
```

For more information, visit their website:
 * http://subversion.apache.org/
