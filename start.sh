export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook -i ~/ansible/epm_ansfin/inventory/stage  ~/ansible/epm_ansfin/playbook.yml 
#--tags=nexus
