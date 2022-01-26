#!/bin/bash

# Проевряем запущены или нет контейнеры и запускаем их

if [ `docker ps | grep -c -i -e "fedora"` -eq 0 ] ; then
  docker start fedora
fi
if [ `docker ps | grep -c -i -e "ubuntu"` -eq 0 ] ; then
  docker start ubuntu
fi
if [ `docker ps | grep -c -i -e "centos7"` -eq 0 ] ; then
  docker start centos7
fi

# Выполняем playbook

ansible-playbook -i inventory/prod.yml site.yml --vault-id pass.txt

# Останавливаем контейнеры

docker stop fedora ubuntu centos7
