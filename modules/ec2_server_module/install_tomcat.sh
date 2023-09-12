#!/bin/bash

#Version of Tomcat server
VERSION=10.1.13

sudo apt-get update -y

#Install Java 11
sudo apt-get install openjdk-11-jre -y
echo -e "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) \n export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc

cd /opt
sudo su

#Download Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-10/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz
wget https://downloads.apache.org/tomcat/tomcat-10/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz.sha512

#Verify Checksum
sha512sum apache-tomcat-${VERSION}.tar.gz| awk '{print $1}' | diff -u - <(cat apache-tomcat-${VERSION}.tar.gz.sha512| awk '{print $2}') > verified.txt

#Extract tomcat
tar -xvzf /opt/apache-tomcat-${VERSION}.tar.gz

#Give executable permissions
chmod +x /opt/apache-tomcat-${VERSION}/bin/startup.sh 
chmod +x /opt/apache-tomcat-${VERSION}/bin/shutdown.sh

#Create link
ln -s /opt/apache-tomcat-${VERSION}/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/apache-tomcat-${VERSION}/bin/shutdown.sh /usr/local/bin/tomcatdown

# Change tomcat default port number
sed -i 's/Connector port="8080"/Connector port="8090"/g' /opt/apache-tomcat-${VERSION}/conf/server.xml

#Modify Exisiting tomcat page with static website
cd /opt/apache-tomcat-${VERSION}/webapps/ROOT
cat << EOF > index.jsp
<!DOCTYPE html>
<html>
  <head>
    <title>Server Hello World: Static Website</title>
  </head>
  <body>
    <h1>Hello DevOpsNxt!</h1>
    <p>.</p>
  </body>
</html>
EOF

tomcatup