#!/bin/bash

#  curl -T '{{playbook_dir}}/test/helloworld-ws/target/helloworld-ws.war' \
#       'http://deployer:s3cret@application.playpit.by/manager/text/deploy?path=/helloworld-ws-{{student}}&update=true'
#http://nexus-ci.playpit.by/repository/MNT-pipeline-training/{{student}}/pipeline-{{student}}/{{ build }}/pipeline-{{ student }}-{{ build}}
#artifactarc=pipeline-stit-133

[ -f "$1" ] && source $1
echo "fromAnsible= $1"

#[[ -f /tmp/$artifactarc.tar.gz ]] && rm -rf /tmp/$artifactarc.tar.gz

#war=133
####ls -la /tmp/$artifactarc.tar.gz
#wget -P /tmp  http://nexus-ci.playpit.by/repository/MNT-pipeline-training/stit/pipeline-stit/133/$artifactarc.tar.gz

#tar xzvf /tmp/$artifactarc.tar.gz -C /tmp

deploy()
{
  curl -T "/tmp/$student/helloworld-ws/target/helloworld-ws.war"  "http://$tomuser:$tompass@$tomserver/manager/text/deploy?path=/stit&update=true&tag=$war"
  printf '{"changed": true, "build": "%s"}' $war
}


case "$action" in
deploy)
  deploy
    ;;
esac
    

#cat << EOF
#{
#   "time: "$(date)",
#   "changed": true,
#   "msg": "custom module is explained",
#   "msg": "tomuser= $tomuser",
#   "msg": "tomserver= $tomserver"
#}
EOF


exit 0





