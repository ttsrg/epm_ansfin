# Jenkins installation 

# INFO:
# Vagrantfile vith next vm's:
- 1 jenkins
- 2 nexus
- 3 sonar(postgre, tomcat)
- 4 nginx

#Ansible roles:
```
common     deploy  jenkins  nexus  postgre  test    user
constants  java    library  nginx  sonar    tomcat  usersudossh
```

Description roles:
common - installs common soft
user - creates users
constants - includes default users and vars
deploy - deploys last java app from nexus  to tomcat or rollbaks stable version if trouble
java - installs java jdk
library - custom bash module for deploy
nginx - proxy for all servers
sonar - sonar-scanner for tests, include install postgre
nexus - storage for artifacts
tomcat - webapplet server
jenkins - ci server
test/usersudossh - roles for troubleshooting

# Usage:
- To run cluster 
'''
vagrant up
'''
- To run playbook
'''
exec: -  $ ansible-playbook -i inventory/stage  playbook.yml  or you may edit start.sh
'''
- to gather facts
'''
ansible all -m setup -a "filter=ansible-local"
'''

```
users added in role constants
```

```
For troubleshooting you may uncomment role usersudossh, since it installed sudo user devops (necessary set ls to your id_rsa.pub in roles/usersudossh/files/ )
```