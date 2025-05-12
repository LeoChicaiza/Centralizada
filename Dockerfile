
# Usa una imagen base con Java 21
FROM eclipse-temurin:21-jdk

# Instala Tomcat manualmente (versión 10 aquí, puedes usar 9 si prefieres)
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.27/bin/apache-tomcat-10.1.27.tar.gz && \
    tar xzf apache-tomcat-10.1.27.tar.gz && \
    mv apache-tomcat-10.1.27 tomcat && \
    rm apache-tomcat-10.1.27.tar.gz

# Copia el WAR generado al directorio webapps de Tomcat
COPY target/*.war /opt/tomcat/webapps/ROOT.war

# Expone el puerto por defecto (Railway usará la variable PORT, lo ajustamos abajo)
EXPOSE 8080

# Permite que Tomcat use el puerto dinámico que asigna Railway
ENV PORT=8080
ENV CATALINA_OPTS="-Dserver.port=${PORT}"

# Inicia Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
