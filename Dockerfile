FROM openjdk:8
EXPOSE 8080
ADD target/mahindra.war mahindra.war
ENTRYPOINT ["java","-jar","/mahindra.war"]
