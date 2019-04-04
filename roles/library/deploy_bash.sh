#!/bin/bash

#  curl -T '{{playbook_dir}}/test/helloworld-ws/target/helloworld-ws.war' \
#       'http://deployer:s3cret@application.playpit.by/manager/text/deploy?path=/helloworld-ws-{{student}}&update=true'
#http://nexus-ci.playpit.by/repository/MNT-pipeline-training/{{student}}/pipeline-{{student}}/{{ build }}/pipeline-{{ student }}-{{ build}}
artifactarc=pipeline-stit-133

[ -f "$1" ] && echo OK
echo "fromAnsible= $1"

[[ -f /tmp/$artifactarc.tar.gz ]] && rm -rf /tmp/$artifactarc.tar.gz

war=133
ls -la /tmp/$artifactarc.tar.gz
wget -P /tmp  http://nexus-ci.playpit.by/repository/MNT-pipeline-training/stit/pipeline-stit/133/$artifactarc.tar.gz

tar xzvf /tmp/$artifactarc.tar.gz -C /tmp


curl -T "/tmp/helloworld-ws/target/helloworld-ws.war"  "http://stit:stit@192.168.56.102:8080/manager/text/deploy?path=/stit&update=true&tag=$war"

exit 0





