#!/bin/bash

sudo apt-get install haproxy

sudo sed -i 's/ENABLED=0/ENABLED=1/' /etc/default/haproxy

sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.OLD
sudo cp $SANDBOX_ENV_ROOT/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg

sudo sed -i 's/#$ModLoad imudp/$ModLoad imudp/' /etc/rsyslog.conf
sudo sed -i 's/#$UDPServerRun 514/$UDPServerRun 514/' /etc/rsyslog.conf
sudo service rsyslog restart

sudo service haproxy restart
netstat -nat
