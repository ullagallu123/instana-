# Stage 1: Build the application
FROM maven:3.8.6-openjdk-17 AS build
RUN mkdir /opt/server
WORKDIR /opt/server
COPY pom.xml .
COPY src src
RUN mvn clean package
RUN cp target/shipping-1.0.jar shipping.jar

# Stage 2: Create the final image
FROM openjdk:17-alpine

# Create application user and set permissions
RUN adduser -D -h /opt/server roboshop \
    && mkdir -p /opt/server \
    && chown roboshop:roboshop /opt/server

# Copy application artifacts from build stage
COPY --from=build /opt/server/shipping.jar /opt/server/shipping.jar

# Set working directory and user
WORKDIR /opt/server

USER roboshop
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "shipping.jar"]
