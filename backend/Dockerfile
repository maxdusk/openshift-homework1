FROM openjdk:11-jdk
COPY ./backend .
RUN ./gradlew clean build  -x test
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "./build/libs/backend-todo-list.jar"]
