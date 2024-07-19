FROM openjdk:17-jdk-alpine

# Install Maven
RUN apk update && \
    apk add --no-cache maven

# Simply the artifact path
ARG artifact=target/spring-boot-app.jar

WORKDIR /opt/app

COPY ${artifact} app.jar

# This should not be changed
ENTRYPOINT ["java","-jar","app.jar"]