# Usa o Java 17
FROM eclipse-temurin:17-jdk-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia tudo o que está na pasta atual para dentro do container
COPY . .

# Dá permissão e compila (removi o "cd DEMO" pois você já está na pasta certa)
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Expõe a porta
EXPOSE 8080

# Comando para rodar o JAR
# O "*" ajuda a encontrar o arquivo mesmo que a versão mude
ENTRYPOINT ["sh", "-c", "java -jar target/*.jar"]