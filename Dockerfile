FROM gradle:4.2.1-jdk8-alpine

RUN pwd
COPY . /home/gradle/src

RUN ls -l /home/gradle/src/

WORKDIR /home/gradle/src
RUN ls -l

USER root
RUN chmod -R 777 gradlew
RUN ls -l
RUN ./gradlew build
RUN pwd
RUN ls -l
RUN ls build/libs/
RUN cp build/libs/corebaz-1.0.0.jar /corebaz-1.0.0.jar

RUN rm -R /home/gradle/src/

USER gradle
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]
