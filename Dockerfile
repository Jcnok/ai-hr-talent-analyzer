FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Etapa 1: Sistema
RUN echo "=== Instalando dependências do sistema ===" && \
    apt-get update && apt-get install -y nodejs npm curl jq

# Etapa 2: Python
COPY requirements.txt requirements.in ./
RUN echo "=== Instalando dependências Python ===" && \
    pip install --no-cache-dir -r requirements.txt

# Etapa 3: Código
COPY . .

# Etapa 4: Modelo (a mais demorada)
RUN echo "=== Baixando modelo LLM (pode demorar 10-20 minutos) ===" && \
    lemonade-server-dev pull user.jan-nano --checkpoint Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf --recipe llamacpp && \
    echo "=== Download concluído! ==="