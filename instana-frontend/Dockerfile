FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/* \
    && rm -rf /etc/nginx/nginx.conf \
    && rm -rf /etc/nginx/conf.d/default.conf

COPY nginx.conf /opt/nginx.conf
COPY web/ /usr/share/nginx/html/
COPY run.sh /

RUN chmod +x /run.sh

ENTRYPOINT ["bash", "/run.sh"]
