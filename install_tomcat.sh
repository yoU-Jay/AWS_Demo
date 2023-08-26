#!/bin/bash

#Version of Tomcat server
VERSION=10.1.13

sudo apt-get update -y

#Install Java 11
sudo apt-get install openjdk-11-jre -y
echo -e "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) \n export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc

#Download Tomcat
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-10/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz
wget https://downloads.apache.org/tomcat/tomcat-10/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz.sha512

#Verify Checksum
sha512sum apache-tomcat-${VERSION}.tar.gz| awk '{print $1}' | diff -u - <(cat apache-tomcat-${VERSION}.tar.gz.sha512| awk '{print $2}') > verified.txt

sudo su
tar -xvzf /opt/apache-tomcat-${VERSION}.tar.gz
chmod +x /opt/apache-tomcat-${VERSION}/bin/startup.sh 
chmod +x /opt/apache-tomcat-${VERSION}/bin/shutdown.sh
ln -s /opt/apache-tomcat-${VERSION}/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/apache-tomcat-${VERSION}/bin/shutdown.sh /usr/local/bin/tomcatdown
tomcatup