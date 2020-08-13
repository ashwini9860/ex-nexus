FROM openjdk:8-jre-alpine3.7
COPY target/maven-tutorial-*.jar maven-tutorial.jar
CMD java -jar maven-tutorial.jar
