FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD corebaz-1.0.0-SNAPSHOT.jar corebaz.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz.jar"]