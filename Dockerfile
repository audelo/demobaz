FROM gradle:4.2.1-jdk8-alpine
WORKDIR /app
COPY --from=0 /app/demobaz /app

USER root                # This changes default user to root
RUN chown -R gradle /app # This changes ownership of folder
USER gradle              # This changes the user back to the default user "gradle"
RUN pwd
RUN ls -lrth
RUN ./gradlew build --stacktrace

COPY build/docker/corebaz-1.0.0.jar corebaz-1.0.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/corebaz-1.0.0.jar"]