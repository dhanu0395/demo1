# Final Dockerfile
FROM openjdk:8-jdk-alpine
WORKDIR /app

# Copy JAR from pipeline build output
COPY target/demo1-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9095
ENTRYPOINT ["java", "-jar", "app.jar"]
