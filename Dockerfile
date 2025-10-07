FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src

# Build the JAR
RUN mvn clean package -DskipTests

# Stage 2: Final image
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Copy the JAR from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run Spring Boot
ENTRYPOINT ["java","-jar","/app.jar"]
