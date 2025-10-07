FROM openjdk:17-jdk-slim
# Install curl and wget for testing
RUN apt-get update && \
    apt-get install -y curl wget && \
    rm -rf /var/lib/apt/lists/*

# Copy the JAR from the build stage
COPY target/*.jar app.jar

# Expose port if needed
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java","-jar","/app.jar"]
