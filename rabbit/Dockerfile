FROM rabbitmq
RUN rabbitmqctl add_user roboshop roboshop123
RUN rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"