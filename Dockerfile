# Usa o Java 17
FROM eclipse-temurin:17-jdk-alpine

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia todos os arquivos do seu repositório para o container
COPY . .

# Entra na pasta DEMO, dá permissão ao mvnw e compila o projeto
RUN cd DEMO && chmod +x mvnw && ./mvnw clean package -DskipTests

# Expõe a porta padrão
EXPOSE 8080

# Comando para rodar o JAR que foi gerado dentro de DEMO/target
ENTRYPOINT ["java", "-jar", "DEMO/target/demo-0.0.1-SNAPSHOT.jar"]