iptables -F
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -L -n
iptables-save | sudo tee /etc/sysconfig/iptables
service iptables restart
