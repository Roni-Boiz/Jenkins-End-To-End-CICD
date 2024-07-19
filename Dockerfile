# Use Maven with OpenJDK 17 as the base image
FROM maven:3.8.1-openjdk-17-slim

# Install Docker CLI
USER root
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /opt/app

# Copy the application JAR file
ARG artifact=target/spring-boot-app.jar
COPY ${artifact} app.jar

# Define the entry point for the container
ENTRYPOINT ["java", "-jar", "app.jar"]