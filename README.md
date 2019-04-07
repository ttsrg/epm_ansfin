# jenkins-installation
```
exec: -  $ ansible-playbook -i inventory/stage  playbook.yml  
```

```
users added in role constants
```

'''
For troubleshooting you may uncomment role usersudossh, since it installed sudo user devops (necessary set ls to your id_rsa.pub in roles/usersudossh/files/ )
'''