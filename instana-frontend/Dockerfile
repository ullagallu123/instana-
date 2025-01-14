FROM        docker.io/redhat/ubi9
RUN         dnf module disable nginx -y && dnf module enable nginx:1.24 -y && dnf install nginx gettext -y
RUN         rm -rf /usr/share/nginx/html/*
COPY        web/ /usr/share/nginx/html/
COPY        nginx.conf /opt/nginx.conf
COPY        run.sh /
ENTRYPOINT  ["bash", "/run.sh"]