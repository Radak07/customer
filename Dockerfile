FROM maven:3.9.4-amazoncorretto-17 
COPY /. /java/
RUN mvn -f /java/pom.xml clean install
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/java/target/customer-1.0.1.jar"]


################ MULTI STAGE DOCKER BUILD###########################

################ First Stage build ###########################
#FROM maven:3.9.4-amazoncorretto-17 as build1
#COPY /. /java/
#RUN mvn -f /java/pom.xml clean install

########## Second Stage build ###########
#FROM amazoncorretto:17
#COPY --from=build1 /java/target/customer-1.0.1.jar /java/customer-1.0.1.jar
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","/java/customer-1.0.1.jar"]
