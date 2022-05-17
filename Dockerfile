FROM alpine:latest

WORKDIR /root
RUN apk add --update ca-certificates iptables nano curl \
        && wget https://github.com/MetaCubeX/Clash.Meta/releases/download/v1.10.0/Clash.Meta-linux-amd64v1-v1.10.0.gz \
        && gzip -d Clash.Meta-linux-amd64v1-v1.10.0.gz \
        && mv Clash.Meta-linux-amd64v1-v1.10.0 /usr/bin/clash \
        && chmod +x /usr/bin/clash
        
 COPY 1.sh /root/sh     
 COPY sh.sh /root/sh
