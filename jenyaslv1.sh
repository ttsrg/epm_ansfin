#!/bin/bash
ansible-playbook -i inventory/stagecluster jenyaslv1  installjenkins.yml -c paramiko
