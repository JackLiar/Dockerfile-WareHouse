FROM openjdk:11
RUN mkdir -p /app; \
    curl -L -o /app/meuse.jar https://github.com/mcorbin/meuse/releases/download/v1.2.0/meuse-1.2.0-standalone.jar
WORKDIR /app

CMD ["java", "-jar", "/app/meuse.jar"]
