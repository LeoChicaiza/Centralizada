# Usamos imagen base de Java
FROM openjdk:17-jdk-slim

# Directorio de trabajo
WORKDIR /app

# Copiamos los fuentes
COPY src/main/java/Server.java .
COPY src/main/java/Client.java .

# Compilamos
RUN javac Server.java

# Puerto expuesto
EXPOSE 8080

# Comando de ejecución
CMD ["java", "Server"]