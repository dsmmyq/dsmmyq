iptables -t nat -A PREROUTING -p tcp -m multiport --dport 22,15401 -j ACCEPT
iptables -t nat -A PREROUTING -d 0.0.0.0/8 -j RETURN
iptables -t nat -A PREROUTING -d 10.0.0.0/8 -j RETURN
iptables -t nat -A PREROUTING -d 127.0.0.0/8 -j RETURN
iptables -t nat -A PREROUTING -d 169.254.0.0/16 -j RETURN
iptables -t nat -A PREROUTING -d 172.16.0.0/12 -j RETURN
iptables -t nat -A PREROUTING -d 192.168.0.0/16 -j RETURN
iptables -t nat -A PREROUTING -d 224.0.0.0/4 -j RETURN
iptables -t nat -A PREROUTING -d 240.0.0.0/4 -j RETURN
iptables -t nat -A PREROUTING -p tcp -j REDIRECT --to-ports 7892
