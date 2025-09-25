---
layout: default
title: Instalação
---

Bem-vindo ao guia de instalação do AI HR Talent Analyzer. Para atender a diferentes necessidades, oferecemos três métodos de instalação.

<div class="toc">
  <strong>Nesta página:</strong>
  <ul>
    <li><a href="#instalacao-com-docker">1. Instalação com Docker (Recomendado)</a></li>
    <li><a href="#instalacao-local-com-scripts">2. Instalação Local com Scripts</a></li>
    <li><a href="#guia-de-instalacao-manual">3. Guia de Instalação Manual (Avançado)</a></li>
  </ul>
</div>

---

<h2 id="instalacao-com-docker">1. Instalação com Docker (Recomendado)</h2>

Este é o método **mais simples e rápido**. Ele usa contêineres Docker para criar um ambiente isolado onde o modelo de linguagem `user.jan-nano` já vem **pré-instalado**.

### Por que usar Docker?
- **Simplicidade Extrema:** Um único comando para iniciar todo o ambiente, sem necessidade de instalação manual de modelos.
- **Consistência Garantida:** Funciona da mesma forma em qualquer máquina (Windows, macOS, Linux).
- **Isolamento Total:** Não interfere com outras ferramentas ou projetos na sua máquina.

### Pré-requisitos
- **Git**: [Guia de Instalação](https://git-scm.com/downloads)
- **Docker e Docker Compose**: [Guia de Instalação](https://docs.docker.com/get-docker/)

### Passos

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
    cd ai-hr-talent-analyzer
    ```

2.  **Inicie os serviços com Docker Compose:**
    ```bash
    docker-compose up
    ```
    > **Nota Importante:** Na primeira vez que você executar este comando, o Docker construirá a imagem. Este processo inclui o **download do modelo LLM `user.jan-nano` (aproximadamente 2.7GB)**, então pode levar vários minutos dependendo da sua conexão com a internet. As execuções futuras serão quase instantâneas.

✅ **Pronto!** Após a conclusão do build, ambos os contêineres (servidor e agente) iniciarão automaticamente. O terminal se tornará sua janela de chat interativa com o agente.

A interface web do servidor de modelos estará disponível em `http://localhost:8001` caso você queira adicionar outros modelos.

---

<h2 id="instalacao-local-com-scripts">2. Instalação Local com Scripts</h2>

Este método é ideal se você prefere não usar Docker, mas ainda deseja um processo de setup automatizado.

### Pré-requisitos
- **Git**
- **Python 3.11+**
- **Node.js (com npx)**

### Passos Detalhados

1.  **Clone o repositório** (se ainda não o fez).

2.  **Execute o script de setup** para o seu sistema:
    *   **Linux / macOS:** `chmod +x ./scripts/setup.sh && ./scripts/setup.sh`
    *   **Windows (PowerShell como Admin):** `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process; .\scripts\setup.ps1`

3. **Instale o Modelo LLM Manualmente (Terminal 1):**
   Abra um terminal, ative o ambiente virtual e use a CLI do Lemonade para baixar o modelo.
   ```bash
   # Ative o ambiente virtual
   # Linux/macOS: source .venv/bin/activate
   # Windows: .venv\Scripts\activate

   lemonade-server-dev pull user.jan-nano --checkpoint Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf --recipe llamacpp
   ```

4. **Inicie o Servidor Lemonade (ainda no Terminal 1):**
   Após o download do modelo, inicie o servidor na porta 8001.
   ```bash
   lemonade-server-dev serve --port 8001
   ```
   Deixe este terminal aberto.

5. **Configure e Execute o Agente (Terminal 2):**
   - Siga o guia em **[Configuração e Arquitetura](api.html)** para configurar o seu `agent.json` com o caminho do `npx` e a porta `8001`.
   - Em um segundo terminal, execute o agente com o script `run`.
     * **Linux / macOS:** `chmod +x ./scripts/run.sh && ./scripts/run.sh`
     * **Windows (PowerShell):** `.\scripts\run.ps1`

---

<h2 id="guia-de-instalacao-manual">3. Guia de Instalação Manual (Avançado)</h2>

Este guia é para desenvolvedores que desejam entender cada passo.

1.  **Clone o repositório** e entre no diretório.
2.  **Crie e ative um ambiente virtual:** `python -m venv .venv` e ative-o.
3.  **Instale as dependências Python:** `pip install -r requirements.txt`.
4.  **Instale o modelo LLM:** `lemonade-server-dev pull user.jan-nano --checkpoint Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf --recipe llamacpp`.
5.  **Inicie o servidor** em um terminal: `lemonade-server-dev serve --port 8001`.
6.  **Configure o `agent.json`** com o caminho do `npx` e a porta `8001`.
7.  **Inicie o agente** em um segundo terminal: `tiny-agents run file-assistant/agent.json`.