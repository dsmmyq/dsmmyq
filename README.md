# docker-proxy
使用clash +docker 进行路由转发实现全局透明代理

## 食用方法
1. 开启混杂模式

    `ip link set eth0 promisc on`

1. docker创建网络,注意将网段改为你自己的

    `docker network create -d macvlan --subnet=192.168.10.0/24 --gateway=192.168.0.1 -o parent=eth0 macnet`

1. 提前准备好正确的clash config , 必须打开redir在7892, 以及dns在53端口

1. 运行容器

    `sudo docker run --name clash_tp -d -v /your/path/clash_config:/clash_config  --network macnet --ip 192.168.1.100 --privileged dsmmyq/clash-proxy`

1. 将手机/电脑等客户端 网关设置为容器ip,如192.168.1.100 ,dns也设置成这个

