# Final Dockerfile
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Copy JAR from pipeline build output
COPY target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
