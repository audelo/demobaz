FROM openjdk:8-jdk-alpine
VOLUME /tmp
RUN ./gradlew build --stacktrace

COPY /build/libs/corebaz-1.0.0.jar /corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]
