FROM maven:3.9.2-eclipse-temurin-17-focal AS build

WORKDIR /app

COPY . /app

RUN mvn clean  package --file pom.xml

####
FROM openjdk:17.0.2-slim-buster AS run

COPY --from=build /app/target /app/.

#CMD ["java", "-jar", "hello-world.jar"]

