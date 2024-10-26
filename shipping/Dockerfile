FROM maven:3.6.2-jdk-11 AS build
RUN mkdir /opt/server
WORKDIR /opt/server
COPY pom.xml .
COPY src src
RUN mvn clean package
RUN cp target/shipping-1.0.jar shipping.jar

FROM openjdk:17-alpine
RUN adduser -D -h /opt/server roboshop \
    && mkdir -p /opt/server \
    && chown roboshop:roboshop /opt/server

COPY --from=build /opt/server/shipping.jar /opt/server/shipping.jar

ADD https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic.jar /opt/server/newrelic.jar
COPY newrelic.yml /opt/server/newrelic.yml

WORKDIR /opt/server
USER roboshop
EXPOSE 8080

CMD ["java", "-javaagent:/opt/server/newrelic.jar", "-jar", "shipping.jar"]
