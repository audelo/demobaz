FROM gradle:4.2.1-jdk8-alpine
WORKDIR /app
RUN ls -l

RUN pwd

RUN ./gradlew build --stacktrace

COPY build/docker/corebaz-1.0.0.jar corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]