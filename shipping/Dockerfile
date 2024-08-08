FROM maven:3.6.2-jdk-11 AS build
RUN mkdir /opt/server
WORKDIR /opt/server
COPY pom.xml .
COPY src src
RUN mvn clean package
RUN mv target/shipping-1.0.jar shipping.jar
FROM adoptopenjdk/openjdk11
RUN adduser --home /opt/server --disabled-password roboshop \
    && mkdir -p /opt/server \
    && chown roboshop:roboshop -R /opt/server
COPY --from=build /opt/server /opt/server
WORKDIR /opt/server
USER roboshop
CMD ["java", "-jar", "shipping.jar"]
