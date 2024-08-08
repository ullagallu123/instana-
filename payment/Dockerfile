FROM python:alpine3.19
RUN adduser --home /opt/server --disabled-password roboshop \
    && mkdir -p /opt/server \
    && chown roboshop:roboshop -R /opt/server
WORKDIR /opt/server
USER roboshop
COPY --chown=roboshop:roboshop payment.ini payment.py rabbitmq.py requirements.txt ./
RUN pip3 install -r requirements.txt
EXPOSE 8080
CMD ["/usr/local/bin/uwsgi", "--ini", "payment.ini"]
