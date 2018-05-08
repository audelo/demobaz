FROM gradle:4.2.1-jdk8-alpine

RUN pwd
RUN ls -l /home/gradle/src

COPY . /home/gradle/src

RUN ls -l /home/gradle/src

WORKDIR /home/gradle/src

USER root
RUN chmod -R 777 gradlew
RUN ls -l
RUN ./gradlew build

USER gradle

RUN ls -l
RUN ls -l build/libs/

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","build/libs/corebaz-1.0.0.jar"]