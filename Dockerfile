FROM openjdk:17-jdk-slim
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
