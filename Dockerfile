FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE=target/corebaz-1.0.0.jar
ADD ${JAR_FILE} corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]