echo "rdr pass on lo0 inet proto tcp from any to 127.0.0.1 port 80 -> 127.0.0.1 port 10080" | sudo pfctl -ef - > /dev/null 2>&1
echo "set packet filter 127.0.0.1:80 -> 127.0.0.1:10080"