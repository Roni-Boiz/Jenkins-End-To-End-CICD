FROM openjdk:17-alpine

# Simply the artifact path
ARG artifact=target/spring-boot-app.jar

WORKDIR /opt/app

COPY ${artifact} app.jar

# This should not be changed
ENTRYPOINT ["java","-jar","app.jar"]