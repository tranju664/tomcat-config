#!/bin/bash
ver=`curl --silent http://mirror.vorboss.net/apache/tomcat/tomcat-9/ | grep v9 | awk '{split($5,c,">v") ; split(c[2],d,"/") ; print d[1]}'`
yum install -y java wget git
cd /opt
rm -rf apache*
wget https://dlcdn.apache.org/tomcat/tomcat-9/v$ver/bin/apache-tomcat-$ver.tar.gz
tar xvzf apache-tomcat-9.*
rm -rf apache*.gz
git clone https://github.com/adhig93/tomcat-config
cp ./tomcat-config/context.xml /opt/apache-tomcat-9.*/webapps/manager/META-INF/context.xml
cp ./tomcat-config/context.xml /opt/apache-tomcat-9.*/webapps/host-manager/META-INF/context.xml
cp ./tomcat-config/tomcat-users.xml /opt/apache-tomcat-9.*/conf/tomcat-users.xml
rm -rf tomcat-config
cd /opt/apache-tomcat-9.*
sh bin/startup.sh
