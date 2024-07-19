FROM adoptopenjdk/openjdk11:alpine-jre

# Install necessary packages
RUN apk update && \
    apk add --no-cache curl bash git openssl && \
    apk add --no-cache openrc

# Install Jenkins
RUN apk add --no-cache jenkins

# Create Jenkins directory and set permissions
RUN mkdir -p /var/jenkins_home && \
    chown -R jenkins:jenkins /var/jenkins_home

# Simply the artifact path
ARG artifact=target/spring-boot-app.jar

WORKDIR /opt/app

COPY ${artifact} app.jar

# This should not be changed
ENTRYPOINT ["java","-jar","app.jar"]