---
layout: default
title: Solução de Problemas
---

Encontrou um problema? Esta página é seu guia de primeiros socorros.

<div class="toc">
  <strong>Nesta página:</strong>
  <ul>
    <li><a href="#problemas-com-docker">1. Problemas com Docker</a></li>
    <li><a href="#problemas-na-instalacao-local">2. Problemas na Instalação Local</a></li>
    <li><a href="#problemas-em-tempo-de-execucao">3. Problemas em Tempo de Execução</a></li>
  </ul>
</div>

---

<h2 id="problemas-com-docker">1. Problemas com Docker</h2>

#### Erro: `Cannot connect to the Docker daemon. Is the docker daemon running?`
-   **Diagnóstico:** O comando `docker-compose` não conseguiu se comunicar com o serviço do Docker que roda em segundo plano.
-   **Solução:** Inicie o aplicativo Docker Desktop (Windows/macOS) ou execute `sudo systemctl start docker` (Linux).

#### Erro: `Error starting userland proxy: listen tcp4 0.0.0.0:8001: bind: address already in use`
-   **Diagnóstico:** Outro programa na sua máquina já está usando a porta 8001.
-   **Solução:** Pare o outro programa ou edite o `docker-compose.yml`. Altere a linha `- "8001:8001"` para `- "8002:8001"` e acesse a interface em `http://localhost:8002`.

#### Build do Docker falha no passo `RUN lemonade-server-dev pull`
-   **Diagnóstico:** O processo de build não conseguiu baixar o modelo LLM do Hugging Face Hub.
-   **Causa Comum:** Problemas de conexão com a internet ou instabilidade temporária no Hugging Face.
-   **Solução:** Verifique sua conexão com a internet e tente construir a imagem novamente com o comando `docker-compose up --build`.

---

<h2 id="problemas-na-instalacao-local">2. Problemas na Instalação Local</h2>

#### Erro: `command not found: python` ou `pip`
-   **Diagnóstico:** O Python não está instalado ou seu local não foi adicionado à variável de ambiente `PATH` do sistema.
-   **Solução:** Instale o [Python 3.11+](https://www.python.org/downloads/) e, durante a instalação no Windows, marque a caixa "Add Python to PATH".

#### Erro: `command not found: lemonade-server-dev` ou `tiny-agents`
-   **Diagnóstico:** O ambiente virtual (`.venv`) não está ativado no seu terminal.
-   **Solução:** Antes de executar qualquer comando do projeto, ative o ambiente:
    -   **Linux/macOS:** `source .venv/bin/activate`
    -   **Windows (PowerShell):** `.\.venv\Scripts\activate`

#### Erro: `lemonade-server-dev pull` falha com erro de rede
-   **Diagnóstico:** O download do modelo do Hugging Face foi interrompido.
-   **Solução:** Verifique sua conexão com a internet e execute o comando `pull` novamente.

---

<h2 id="problemas-em-tempo-de-execucao">3. Problemas em Tempo de Execução</h2>

#### Erro: Agente reclama que o modelo `user.jan-nano` não foi encontrado
-   **Diagnóstico:** O agente iniciou, mas o modelo especificado no seu `agent.json` não está instalado no ambiente local do Lemonade.
-   **Solução:** Certifique-se de que você executou o comando `lemonade-server-dev pull user.jan-nano ...` com sucesso antes de iniciar o servidor e o agente.

#### O agente dá respostas genéricas ou diz "não sei"
-   **Diagnóstico:** Você fez uma pergunta ao agente sem antes carregar os arquivos necessários no contexto dele.
-   **Solução:** Siga sempre o fluxo de trabalho correto: primeiro, use `read_file` para carregar a vaga e o currículo. **Depois**, faça a pergunta de análise.