FROM openjdk:8-jdk-alpine
COPY target/corebaz*.jar /corebaz-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-0.0.1-SNAPSHOT.jar"]