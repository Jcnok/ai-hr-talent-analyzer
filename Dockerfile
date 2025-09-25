# Use a imagem oficial do Python 3.11 como base. A versão 'slim' é mais leve.
FROM python:3.11-slim

# Define variáveis de ambiente para garantir que os logs do Python apareçam em tempo real
ENV PYTHONUNBUFFERED=1

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Atualiza os pacotes do sistema operacional e instala as dependências necessárias:
# - nodejs e npm: para o npx
# - curl: para verificar a API
# - jq: para processar a resposta JSON da API
# O `-y` confirma a instalação automaticamente.
RUN apt-get update && apt-get install -y nodejs npm curl jq

# Copia os arquivos de dependências para o diretório de trabalho
COPY requirements.txt requirements.in ./

# Instala as dependências do Python. `--no-cache-dir` evita salvar o cache, mantendo a imagem menor.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o resto do código do projeto para o diretório de trabalho
# O .dockerignore garantirá que arquivos desnecessários não sejam incluídos.
COPY . .

# Pré-instala o modelo LLM diretamente na imagem Docker.
# Isso garante que o modelo esteja disponível imediatamente quando o contêiner iniciar.
RUN lemonade-server-dev pull user.jan-nano --checkpoint Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf --recipe llamacpp