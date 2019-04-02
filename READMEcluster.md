# jenkins-installation
```
exec: -  $ ansible-playbook -i inventory/stage  installjenkins.yml -c paramiko
exec: -  $ ansible-playbook -i inventory/stageslaves  installslaves.yml -c paramiko

```

```
use http://192.168.56.200(201/202) for connect, please 
```

you should generate ssh key and may use next command to connect ssh jenkins@192.168.56.200(201/202)
