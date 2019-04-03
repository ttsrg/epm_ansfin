#!/bin/bash
#Installing tomcat and deploy TestApp, task3
## Check root Rights

#Installing tomcat
if [ ! -d /opt/tomcat/apache-tomcat-9.0.16 ]; then
    useradd  -s /bin/false tomcat ;    mkdir -p /opt/tomcat
    wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz -P /tmp/
    tar -xvzf /tmp/apache-tomcat-9.0.16.tar.gz -C /opt/tomcat/
    [[ ! -L /opt/tomcat/latest ]] && ln -s /opt/tomcat/apache-tomcat-9.0.16 /opt/tomcat/latest &&\
    echo -en "\033[34m  LN not  exists \033[0m\n" # necessary check for symlink
    chown -R tomcat. /opt/tomcat/latest/ ;    chmod +x /opt/tomcat/latest/bin/*.sh
else
    echo -en "\033[32m  tomcat exists \033[0m\n"
fi

cat << EOF > /etc/systemd/system/multi-user.target.wants/tomcat.service
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/jre"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"

Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"

Environment="CATALINA_OPTS=-Xms256M -Xmx512M  -verbose:gc -Xloggc:/opt/tomcat/latest/logs/gc.log \
-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/tomcat/latest/logs/heap.dump"
#Environment="CATALINA_OPTS=-Xms256M -Xmx512M -XX:+PrintGC -verbose:gc -Xloggc:/opt/tomcat/latest/logs/gc.log \
#-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/tomcat/latest/logs/heap.dump"
#Environment="CATALINA_OPTS= -Xmx1024M 

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF


systemctl daemon-reload 
sed -i '/<Context>/s/<Context>/<Context allowCasualMultipartParsing="true">/1' /opt/tomcat/latest/conf/context.xml
cp -rfv  /vagrant/files/startup.sh  /opt/tomcat/latest/bin/

echo -en "\033[35m workaround start tomcat \033[0m\n"
systemctl restart tomcat
[[ $? -ne 0  ]] && systemctl restart tomcat.

#systemctl status tomcat

#autodeploy..........
#cp -rfv  /vagrant/files/TestApp.war  /opt/tomcat/latest/webapps/
#chown -R tomcat. /opt/tomcat/latest/

#enable firewalld and add rules
#systemctl enable firewalld
#systemctl stop firewalld 
#firewall-cmd --zone=public --add-port=8080/tcp --permanent
#firewall-cmd --zone=public --add-port=12345/tcp --permanent  
#firewall-cmd --zone=public --add-port=12345/udp --permanent 
#firewall-cmd --zone=public --add-port=12346/tcp --permanent  
#firewall-cmd --zone=public --add-port=12346/udp --permanent.

#firewall-cmd --reload

#!!!Check autodeploy, users, ports, services
#echo -en "\033[33m check services \033[0m\n"
#tomcat version  # doesn't work at versions 8+
#systemctl status tomcat

#systemctl status firewalld
#firewall-cmd --get-active-zones
#firewall-cmd --zone=public --list-ports
#firewall-cmd --list-forward-ports
#firewall-cmd --permanent --list-all
#firewall-cmd --list-all
#firewall-cmd --list-ports

#systemctl --failed

exit 0
