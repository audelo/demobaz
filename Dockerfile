FROM openjdk:8-jdk-alpine
COPY gradle gradle
COPY \
  ./gradle \
  build.gradle \
  gradlew \
  ./

# Install the gradle version used in the repository through gradlew
RUN ./gradlew
RUN pwd
RUN ls -l
RUN ./gradlew build docker --stacktrace

COPY build/docker/corebaz-1.0.0.jar corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]