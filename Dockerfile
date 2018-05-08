FROM gradle:4.2.1-jdk8-alpine

COPY . /home/gradle/src
WORKDIR /home/gradle/src
RUN pwd
RUN ls -l
RUN chmod 777 gradlew
RUN ls -ls
RUN ./gradlew build
RUN ls -l
RUN ls -l build/libs/

COPY build/libs/corebaz-1.0.0.jar corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]
