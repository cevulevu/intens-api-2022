#build
FROM eclipse-temurin:8-jdk AS build
WORKDIR /app  
COPY . .
RUN ./mvnw clean package -DskipTests

#run
FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]