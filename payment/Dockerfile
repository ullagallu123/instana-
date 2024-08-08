FROM python:alpine3.19
RUN mkdir /opt/server
RUN adduser --home /opt/server --disabled-password roboshop \
    && mkdir -p /opt/server \
    && chown roboshop:roboshop -R /opt/server
WORKDIR /opt/server
COPY payment.ini .
COPY payment.py .
COPY rabbitmq.py .
COPY requirements.txt .
RUN pip3 install -r requirements.txt
USER roboshop
EXPOSE 8080
CMD ["/usr/local/bin/uwsgi", "--ini", "payment.ini"]