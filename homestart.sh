export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook -i ~/work/ansible/epm_ansfin/inventory/stage  ~/work/ansible/epm_ansfin/playbook.yml 
#--tags=nexus
