---
layout: default
title: Configuração e Arquitetura
---

Para usar e customizar o AI HR Talent Analyzer, é útil entender seus componentes principais e como configurá-los.

<div class="toc">
  <strong>Nesta página:</strong>
  <ul>
    <li><a href="#arquitetura-do-sistema">1. Arquitetura do Sistema</a></li>
    <li><a href="#o-arquivo-agentjson">2. O Arquivo `agent.json`</a></li>
    <li><a href="#modelos-gguf">3. Modelos GGUF e Como Escolher</a></li>
  </ul>
</div>

---

<h2 id="arquitetura-do-sistema">1. Arquitetura do Sistema</h2>

O sistema é composto por três partes principais que se comunicam para realizar as tarefas. Entender essa separação ajuda a diagnosticar problemas.

1.  **O Servidor de Modelos (`lemonade-server-dev`)**
    -   **Função:** É o "motor" do sistema. Um servidor de backend que hospeda e executa os modelos de linguagem (LLMs) de forma otimizada.
    -   **Como Funciona:** Ele expõe uma API REST. O agente envia os prompts (suas perguntas e o contexto dos arquivos) para esta API e recebe de volta a resposta gerada pelo modelo.
    -   **Sua Interação:** Você interage com ele principalmente através da interface web em `http://localhost:8000` para adicionar, gerenciar e monitorar seus modelos. É aqui que você instala o `user.jan-nano`, por exemplo.

2.  **O Agente (`tiny-agents`)**
    -   **Função:** É a "inteligência" e sua interface de linha de comando.
    -   **Como Funciona:** Ele gerencia a conversa, interpreta seus comandos em linguagem natural, decide qual ferramenta usar (se necessário), e se comunica com o Lemonade Server para acessar a capacidade de raciocínio do LLM.
    -   **Sua Interação:** Você o executa no seu terminal e dá instruções diretas a ele.

3.  **O Provedor de Ferramentas (`@wonderwhy-er/desktop-commander`)**
    -   **Função:** É a "ponte" entre o agente e o seu sistema de arquivos local.
    -   **Como Funciona:** O `npx` o executa como um serviço separado. Ele expõe um conjunto de ferramentas (`tools`) como `read_file`, `write_file`, e `list_files` de uma forma padronizada (seguindo o MCP). O agente descobre essas ferramentas e aprende a usá-las para manipular arquivos.
    -   **Sua Interação:** Geralmente é transparente. Você apenas precisa garantir que o caminho para o `npx` esteja corretamente configurado no `agent.json` para instalações locais.

---

<h2 id="o-arquivo-agentjson">2. O Arquivo `agent.json`</h2>

Este arquivo é o DNA do seu agente. Ele define qual modelo usar, onde encontrá-lo e quais ferramentas ele pode acessar.

```json
{
  "model": "user.jan-nano",
  "endpointUrl": "http://localhost:8000/api/",
  "servers": [
    {
      "type": "stdio",
      "config": {
        "command": "/caminho/para/seu/npx",
        "args": ["-y", "@wonderwhy-er/desktop-commander"]
      }
    }
  ]
}
```

-   `"model"`: Especifica o **nome exato** do modelo. Este nome deve corresponder perfeitamente ao nome do modelo que você instalou no Lemonade Server.
-   `"endpointUrl"`: A URL da API do Lemonade Server.
    -   **Instalação Local:** Sempre `http://localhost:8000/api/`.
    -   **Ambiente Docker (`agent.docker.json`):** Usa o nome do serviço, `http://lemonade-server:8000/api/`, para permitir a comunicação interna entre os contêineres.
-   `"servers"`: Uma lista de servidores de ferramentas.
    -   `"type": "stdio"`: Informa ao agente que ele deve se comunicar com o provedor de ferramentas via Entrada/Saída Padrão (ou seja, lendo e escrevendo no console do processo).
    -   `"config"`:
        -   `"command"`: O **caminho absoluto** para o executável `npx`. Este é o único campo que você precisa ajustar manualmente na instalação local.
        -   `"args"`: Os argumentos passados para o comando. `-y @wonderwhy-er/desktop-commander` diz ao `npx` para baixar (se necessário) e executar o pacote que fornece as ferramentas de sistema de arquivos, sem pedir confirmação.

---

<h2 id="modelos-gguf">3. Modelos GGUF e Como Escolher</h2>

O projeto é otimizado para usar modelos no formato **GGUF (GPT-Generated Unified Format)**.

-   **O que é GGUF?** É um formato de arquivo binário criado pela comunidade de IA de código aberto. Ele contém a arquitetura e os pesos do modelo em um único arquivo, otimizado para carregar rapidamente e rodar de forma eficiente na CPU.
-   **Onde Encontrar Modelos?** O [Hugging Face Hub](https://huggingface.co/models?search=gguf) é o principal repositório. Você pode pesquisar por "gguf" para encontrar milhares de modelos.
-   **Como Escolher um Bom Modelo?**
    -   **Tamanho:** Para tarefas de análise de texto como esta, modelos entre 3 e 8 bilhões de parâmetros (ex: Llama-3-8B, Qwen1.5-7B, Mistral-7B) são um ótimo ponto de partida. Eles são poderosos o suficiente para entender o contexto, mas leves o suficiente para rodar em um desktop moderno.
    -   **Quantização:** A quantização é um processo que reduz o tamanho do modelo com uma perda mínima de qualidade. Procure por modelos com quantização de 4 bits (nos nomes dos arquivos, você verá marcações como `Q4_K_M` ou `Q4_0`). Eles oferecem o melhor equilíbrio entre uso de memória e qualidade da resposta.
    -   **Exemplos de Modelos Populares:** `Nous-Hermes-2-Mistral-7B-DPO-GGUF`, `Llama-3-8B-Instruct-GGUF`, `Qwen1.5-7B-Chat-GGUF`.
    -   **Para Testes Iniciais:** O `Jan-nano-gguf` usado nos exemplos é extremamente leve e ótimo para verificar se o seu setup está funcionando, mas pode não ter a mesma capacidade de raciocínio de modelos maiores.