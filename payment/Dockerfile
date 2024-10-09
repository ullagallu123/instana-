FROM python:alpine3.19

# Install build dependencies and uWSGI in one step
RUN apk add --no-cache \
        build-base \
        pcre-dev \
        libffi-dev \
    && pip3 install uwsgi setuptools \
    && adduser --home /opt/server --disabled-password roboshop \
    && mkdir -p /opt/server \
    && chown roboshop:roboshop -R /opt/server

# Set the working directory and switch to the roboshop user
WORKDIR /opt/server
USER roboshop

# Copy application files and install Python dependencies
COPY --chown=roboshop:roboshop payment.ini payment.py rabbitmq.py requirements.txt ./
RUN pip3 install -r requirements.txt

# Expose the necessary port and run uWSGI
EXPOSE 8080
CMD ["uwsgi", "--ini", "payment.ini"]

