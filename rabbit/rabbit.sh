#!/bin/bash
rabbitmq-server -detached
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
rabbitmqctl stop
exec rabbitmq-server