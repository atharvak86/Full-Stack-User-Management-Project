FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /app/target/fullstack-backend-0.0.1-SNAPSHOT.jar fullstack-backend.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","fullstack-backend.jar"]
