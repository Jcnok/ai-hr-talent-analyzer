#!/bin/bash

# Define a URL da API do Lemonade Server e o caminho do arquivo de configuração do agente
LEMONADE_API_URL="http://lemonade-server:8000/api/models"
AGENT_CONFIG_PATH="/app/file-assistant/agent.docker.json"

# Extrai o nome do modelo necessário do arquivo de configuração do agente usando jq
# O 'jq -r' extrai o valor da string sem as aspas
MODEL_NAME=$(jq -r '.model' "$AGENT_CONFIG_PATH")

echo "---"
echo "🤖 Agente aguardando a instalação do modelo: '$MODEL_NAME'"
echo "---"

# Loop infinito para verificar a disponibilidade do modelo
while true; do
    # Usa 'curl' para obter a lista de modelos instalados e 'jq' para verificar se o nosso modelo está na lista
    # 'curl -s' é para modo silencioso. 'jq -e' retorna um status de saída 0 se encontrar o resultado.
    if curl -s "$LEMONADE_API_URL" | jq -e --arg model "$MODEL_NAME" '.[] | select(.name == $model)' > /dev/null; then
        echo "✅ Modelo '$MODEL_NAME' detectado no Lemonade Server!"
        echo "🚀 Iniciando o agente..."
        break # Sai do loop
    else
        echo "--------------------------------------------------------------------------------"
        echo "⏳ Modelo '$MODEL_NAME' ainda não encontrado."
        echo "👉 Por favor, acesse http://localhost:8000, adicione e instale o modelo."
        echo "   (O agente irá iniciar automaticamente assim que o modelo for detectado)"
        echo "--------------------------------------------------------------------------------"
        sleep 15 # Espera 15 segundos antes de verificar novamente
    fi
done

# Executa o comando que foi passado para o entrypoint (definido no docker-compose.yml)
# O 'exec' substitui o processo do script pelo do agente, o que é uma boa prática.
exec "$@"