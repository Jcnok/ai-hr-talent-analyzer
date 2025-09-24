# Use a imagem oficial do Python 3.11 como base. A versão 'slim' é mais leve.
FROM python:3.11-slim

# Define variáveis de ambiente para garantir que os logs do Python apareçam em tempo real
ENV PYTHONUNBUFFERED=1

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Atualiza os pacotes do sistema operacional e instala o Node.js e o npm (que inclui o npx)
# O `-y` confirma a instalação automaticamente.
RUN apt-get update && apt-get install -y nodejs npm curl

# Copia os arquivos de dependências para o diretório de trabalho
COPY requirements.txt requirements.in ./

# Instala as dependências do Python. `--no-cache-dir` evita salvar o cache, mantendo a imagem menor.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o resto do código do projeto para o diretório de trabalho
# O .dockerignore garantirá que arquivos desnecessários não sejam incluídos.
COPY . .

# O comando para iniciar a aplicação será definido no docker-compose.yml,
# pois teremos diferentes comandos para o servidor e para o agente.