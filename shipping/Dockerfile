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
WORKDIR /opt/server
USER roboshop
EXPOSE 8080
CMD ["java", "-jar", "shipping.jar"]





























# # Stage 1: Build the application
# FROM maven:3.6.2-jdk-11 AS build
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY pom.xml .
# COPY src src
# RUN mvn clean package
# RUN mv target/shipping-1.0.jar shipping.jar

# # Stage 2: Create the final image
# FROM adoptopenjdk/openjdk11

# # Install MySQL client
# RUN apt-get update \
#     && apt-get install -y mysql-client \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# # Create application user and set permissions
# RUN adduser --home /opt/server --disabled-password roboshop \
#     && mkdir -p /opt/server \
#     && chown roboshop:roboshop -R /opt/server

# # Copy application artifacts from build stage
# COPY --from=build /opt/server /opt/server

# # Set working directory and user
# WORKDIR /opt/server

# USER roboshop
# EXPOSE 8080
# # Command to run the application
# CMD ["java", "-jar", "shipping.jar"]


# # FROM maven:3.6.2-jdk-11 AS build
# # RUN mkdir /opt/server
# # WORKDIR /opt/server
# # COPY pom.xml .
# # COPY src src
# # RUN mvn clean package
# # RUN mv target/shipping-1.0.jar shipping.jar
# # FROM adoptopenjdk/openjdk11
# # RUN adduser --home /opt/server --disabled-password roboshop \
# #     && mkdir -p /opt/server \
# #     && chown roboshop:roboshop -R /opt/server
# # COPY --from=build /opt/server /opt/server
# # WORKDIR /opt/server
# # USER roboshop
# # CMD ["java", "-jar", "shipping.jar"]
