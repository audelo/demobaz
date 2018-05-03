FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD corebaz-1.0.0 corebaz-1.0.0.jar
RUN sh -c 'touch /corebaz-1.0.0.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]