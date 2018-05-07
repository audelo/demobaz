FROM openjdk:8-jdk-alpine


# Install the gradle version used in the repository through gradlew
RUN mkdir /usr/lib/gradle
RUN cd /usr/lib/gradle
RUN ./gradlew
RUN pwd
RUN ls -l
RUN ./gradlew build docker

COPY build/docker/corebaz-1.0.0.jar corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]