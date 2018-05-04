FROM openjdk:8-jdk-alpine
RUN cd ./demobaz && ./gradlew build
COPY /build/libs/corebaz-1.0.0.jar /corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]