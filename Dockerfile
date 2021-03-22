FROM maven:3.6.0-jdk-8 AS build
WORKDIR /dockerTemp
COPY . /dockerTemp
RUN mvn clean package


FROM openjdk:8 AS runtime
COPY --from=build /dockerTemp/target/spring-boot-docker.jar dockerTemp/spring-boot-docker.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar", "dockerTemp/spring-boot-docker.jar"]