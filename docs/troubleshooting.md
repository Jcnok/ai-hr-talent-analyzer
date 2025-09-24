---
layout: default
title: Solução de Problemas
---

Encontrou um problema? Esta página é seu guia de primeiros socorros. Aqui estão as questões mais comuns e como resolvê-las, divididas por categoria para facilitar a busca.

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
-   **Diagnóstico:** Este é o erro mais comum do Docker. Significa que o comando `docker-compose` não conseguiu se comunicar com o serviço do Docker que deveria estar rodando em segundo plano na sua máquina.
-   **Solução:**
    -   **Windows/macOS:** Abra o aplicativo **Docker Desktop**. Certifique-se de que ele está em execução e que o ícone na sua barra de tarefas está estável (não animado).
    -   **Linux:** Execute `sudo systemctl start docker` para iniciar o serviço. Você pode verificar o status com `sudo systemctl status docker`.

#### Erro: `Error starting userland proxy: listen tcp4 0.0.0.0:8000: bind: address already in use`
-   **Diagnóstico:** O Docker está tentando expor a porta 8000 do contêiner para a sua máquina, mas outro programa já está usando essa porta.
-   **Solução:**
    1.  **Identifique e Pare o Processo:** Use um comando como `lsof -i :8000` (macOS/Linux) ou `netstat -ano | findstr :8000` (Windows) para encontrar o ID do processo que está usando a porta e pare-o.
    2.  **Altere a Porta (Alternativa):** Se você não pode parar o outro processo, edite o arquivo `docker-compose.yml`. Altere a linha `- "8000:8000"` para `- "8001:8000"`. Isso fará com que a interface web do Lemonade fique acessível em `http://localhost:8001`.

#### O agente para na mensagem "⏳ Modelo ... ainda não encontrado."
-   **Diagnóstico:** Isto **não é um erro**, mas sim o comportamento esperado do `entrypoint.sh`. O agente está pausado, esperando que você instale o modelo LLM.
-   **Solução:** Siga as instruções no terminal: acesse `http://localhost:8000` no seu navegador e instale o modelo com o nome exato que o agente está esperando (por padrão, `user.jan-nano`). Assim que a instalação for concluída, o agente continuará automaticamente.

---

<h2 id="problemas-na-instalacao-local">2. Problemas na Instalação Local</h2>

#### Erro: `command not found: python` ou `pip`
-   **Diagnóstico:** O Python não está instalado ou, mais comumente, o local onde ele foi instalado não foi adicionado à variável de ambiente `PATH` do seu sistema.
-   **Solução:** Baixe e instale a versão mais recente do [Python 3.11+](https://www.python.org/downloads/). Durante a instalação no Windows, é **crucial** marcar a caixa de seleção "Add Python to PATH".

#### Erro: `command not found: lemonade-server-dev` ou `tiny-agents`
-   **Diagnóstico:** O ambiente virtual (`.venv`) não está ativado no seu terminal. Os pacotes foram instalados dentro deste ambiente, e o terminal só os encontrará se o ambiente estiver ativo.
-   **Solução:** Antes de executar qualquer comando do projeto, ative o ambiente com o comando apropriado para o seu sistema:
    -   **Linux/macOS:** `source .venv/bin/activate`
    -   **Windows (PowerShell):** `.\.venv\Scripts\activate`
    > Você saberá que funcionou quando vir `(.venv)` no início do seu prompt de terminal.

#### Erro: `.\scripts\setup.ps1 cannot be loaded because running scripts is disabled on this system.`
-   **Diagnóstico:** A política de execução padrão do PowerShell é restritiva e impede a execução de scripts locais para proteger o sistema.
-   **Solução:** Abra o PowerShell **como Administrador** e execute o seguinte comando. Ele altera a política apenas para a sessão atual do seu terminal, tornando-o seguro.
    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
    ```
    Depois disso, execute o script de setup normalmente: `.\scripts\setup.ps1`.

---

<h2 id="problemas-em-tempo-de-execucao">3. Problemas em Tempo de Execução</h2>

#### O agente responde "não sei" ou dá respostas genéricas
-   **Diagnóstico:** Você fez uma pergunta ao agente sem antes carregar os arquivos necessários no contexto dele. O agente não tem memória de longo prazo entre as sessões.
-   **Solução:** Siga sempre o fluxo de trabalho correto: primeiro, use `read_file` para carregar a vaga e o currículo. **Depois**, faça a pergunta de análise.

#### O agente não usa a ferramenta correta (`read_file`, `write_file`)
-   **Diagnóstico:** Modelos de linguagem menores, como o Jan-Nano, podem se confundir com comandos ambíguos ou muito abertos.
-   **Solução:** Seja o mais explícito e direto possível. Dê uma "dica" forte ao modelo sobre qual ação tomar.
    -   **Ruim:** "Crie um convite."
    -   **Bom:** "**use a ferramenta write_file para criar o arquivo invite.md com...**"