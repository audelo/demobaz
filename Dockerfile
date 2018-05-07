FROM gradle:4.2.1-jdk8-alpine

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN pwd
RUN ls -l
RUN gradle build
RUN ls -l

COPY build/libs/corebaz-1.0.0.jar corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]