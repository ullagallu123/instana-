FROM mongo:latest
RUN useradd -ms /bin/bash mongo
WORKDIR /home/mongo
COPY catalogue.js /docker-entrypoint-initdb.d/
COPY user.js /docker-entrypoint-initdb.d/
RUN chown -R mongo:mongo /docker-entrypoint-initdb.d/
USER mongo
EXPOSE 27017
CMD ["mongod"]
