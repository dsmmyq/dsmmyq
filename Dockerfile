FROM alpine:latest

WORKDIR /root
RUN apk add --update ca-certificates iptables nano curl \
        && wget https://github.com/MetaCubeX/Clash.Meta/releases/download/v1.10.0/Clash.Meta-linux-amd64v1-v1.10.0.gz \
        && gzip -d Clash.Meta-linux-amd64v1-v1.10.0.gz \
        && mv Clash.Meta-linux-amd64v1-v1.10.0 /usr/bin/clash \
        && chmod +x /usr/bin/clash
        
COPY 1.sh 1.sh     
COPY sh.sh sh.sh
COPY config.yaml /root/.config/clash/
COPY clash-server /etc/init.d/clash-server

RUN mkdir /root/.config/clash && \
    wget -O .config/clash/Country.mmdb https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country.mmdb && \
    wget -O .config/clash/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat && \
    wget -O .config/clash/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat && \
    chmod +x 1.sh && \
    chmod +x sh.sh
    
CMD ["sh.sh", "/1.sh"]
    
    
