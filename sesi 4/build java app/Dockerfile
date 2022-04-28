FROM maven:3.6.3-openjdk-11 AS maven_build

WORKDIR /app

COPY pom.xml /app/

COPY src /app/src/

RUN mvn package

#pull base image

FROM fabric8/java-alpine-openjdk11-jre
#expose port 8080
EXPOSE 8080

#copy hello world to docker image from builder image
COPY --from=maven_build /app/target/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar

#default command
CMD java -jar /data/hello-world-0.1.0.jar
