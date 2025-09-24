---
layout: default
title: Instalação
---

Bem-vindo ao guia de instalação do AI HR Talent Analyzer. Para atender a diferentes necessidades e níveis de conhecimento técnico, oferecemos três métodos de instalação distintos.

<div class="toc">
  <strong>Nesta página:</strong>
  <ul>
    <li><a href="#instalacao-com-docker">1. Instalação com Docker (Recomendado para Usuários)</a></li>
    <li><a href="#instalacao-local-com-scripts">2. Instalação Local com Scripts (Intermediário)</a></li>
    <li><a href="#guia-de-instalacao-manual">3. Guia de Instalação Manual (Avançado para Desenvolvedores)</a></li>
  </ul>
</div>

---

<h2 id="instalacao-com-docker">1. Instalação com Docker (Recomendado para Usuários)</h2>

Este é o método **mais simples e rápido** para começar. Ele usa contêineres Docker para criar um ambiente de software completo, isolado e pré-configurado. Você não precisa se preocupar com versões de Python, Node.js ou outras dependências.

### Por que usar Docker?
- **Simplicidade Extrema:** Um único comando (`docker-compose up`) para iniciar todo o ambiente.
- **Consistência Garantida:** Funciona da mesma forma em qualquer máquina (Windows, macOS, Linux) que tenha Docker.
- **Isolamento Total:** Não interfere com nenhuma outra ferramenta ou projeto na sua máquina.

### Pré-requisitos
- **Git**: Essencial para clonar o repositório. [Guia de Instalação](https://git-scm.com/downloads).
- **Docker e Docker Compose**: A plataforma de contêineres. [Guia de Instalação](https://docs.docker.com/get-docker/).

### Passos Detalhados

1.  **Clone o Repositório:**
    Abra seu terminal e execute o seguinte comando para baixar o código do projeto:
    ```bash
    git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
    cd ai-hr-talent-analyzer
    ```

2.  **Inicie os Serviços com Docker Compose:**
    Este comando é o coração do processo. Ele lê o arquivo `docker-compose.yml`, constrói a imagem do projeto (se for a primeira vez) e inicia os dois contêineres necessários: o servidor de modelos e o agente.
    ```bash
    docker-compose up
    ```
    > **Nota:** Na primeira execução, o Docker fará o download da imagem base do Python, instalará as dependências e construirá a imagem do projeto. Isso pode levar alguns minutos. Nas execuções futuras, será quase instantâneo.

3.  **Instale o Modelo LLM (Ação Manual Necessária):**
    - Após o passo anterior, o terminal do agente exibirá uma mensagem "⏳ Modelo 'user.jan-nano' ainda não encontrado." e ficará aguardando. Este é o comportamento esperado.
    - Enquanto ele espera, abra seu navegador e acesse a interface do Lemonade Server em **[http://localhost:8000](http://localhost:8000/#model-management)**.
    - Clique no botão **"Add Model"** e preencha os campos para instalar o modelo que será usado. Para os exemplos, use:
        - **Name**: `user.jan-nano` (O nome deve ser exatamente este para o `agent.docker.json` funcionar).
        - **Checkpoint**: `Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf`
        - **Recipe**: `llamacpp`
    - Clique em **Install** e aguarde o download e a instalação terminarem.

4.  **Comece a Usar:**
    - Assim que o modelo for instalado, o terminal do agente irá detectá-lo automaticamente, exibirá a mensagem "✅ Modelo detectado!" e iniciará a interface de chat.
    - Você já pode interagir com o agente, digitando seus comandos diretamente neste terminal.

---

<h2 id="instalacao-local-com-scripts">2. Instalação Local com Scripts (Intermediário)</h2>

Este método é ideal se você é um desenvolvedor que prefere não usar Docker, mas ainda deseja um processo de setup automatizado e seguro.

### Pré-requisitos
- **Git**
- **Python 3.11+**
- **Node.js (com npx)**

### Passos Detalhados

1.  **Clone o repositório** (se ainda não o fez).

2.  **Execute o Script de Setup:**
    Nossos scripts automatizam a criação do ambiente virtual e a instalação de dependências.

    *   **Linux / macOS (Terminal):**
        ```bash
        # Dá permissão de execução ao script. Você só precisa fazer isso uma vez.
        chmod +x ./scripts/setup.sh
        # Executa o script de setup
        ./scripts/setup.sh
        ```

    *   **Windows (PowerShell como Administrador):**
        ```powershell
        # Altera a política de execução apenas para esta sessão, permitindo que o script rode.
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
        # Executa o script de setup
        .\scripts\setup.ps1
        ```
    > **O que este script faz?** Ele executa uma série de comandos para você: `python -m venv .venv` para criar um ambiente virtual, ativa o ambiente e, em seguida, executa `pip install -r requirements.txt` para instalar todas as bibliotecas Python necessárias.

3. **Inicie o Servidor Lemonade (Terminal 1):**
   Abra um terminal, ative o ambiente virtual e inicie o servidor.
   ```bash
   # Ative o ambiente virtual
   # Linux/macOS: source .venv/bin/activate
   # Windows: .venv\Scripts\activate

   lemonade-server-dev serve
   ```
   Deixe este terminal aberto e rodando.

4. **Instale o Modelo LLM:**
   Acesse a interface web em **[http://localhost:8000](http://localhost:8000/#model-management)** e instale o modelo, como descrito no método Docker.

5. **Configure e Execute o Agente (Terminal 2):**
   - Primeiro, siga o guia em **[Configuração e Arquitetura](api.html)** para configurar o seu `agent.json` com o caminho correto do `npx`.
   - Depois, em um segundo terminal, execute o agente com o nosso script `run`:
     * **Linux / macOS:**
       ```bash
       chmod +x ./scripts/run.sh
       ./scripts/run.sh
       ```
     * **Windows (PowerShell):**
       ```powershell
       .\scripts\run.ps1
       ```
   > **O que este script faz?** Ele primeiro ativa o ambiente virtual para você, depois verifica se o servidor Lemonade está respondendo e, se tudo estiver certo, inicia o agente.

---

<h2 id="guia-de-instalacao-manual">3. Guia de Instalação Manual (Avançado para Desenvolvedores)</h2>

Este guia é para desenvolvedores que desejam entender e controlar cada etapa do processo de configuração.

### 1. Clonar o Repositório
```bash
git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
cd ai-hr-talent-analyzer
```

### 2. Criar e Ativar o Ambiente Virtual
Um ambiente virtual (`venv`) é uma pasta que contém uma instalação Python específica para o seu projeto. Isso é crucial para isolar as dependências e evitar conflitos com outros projetos.
```bash
# Comando para criar o ambiente virtual na pasta .venv
python -m venv .venv

# Comando para ativar no Linux/macOS
source .venv/bin/activate

# Comando para ativar no Windows (PowerShell)
.venv\Scripts\activate
```
> Você saberá que o ambiente está ativo pois o nome dele, `(.venv)`, aparecerá no início do seu prompt de terminal.

### 3. Instalar as Dependências
O `pip` é o gerenciador de pacotes do Python. O arquivo `requirements.txt` lista todas as bibliotecas que nosso projeto precisa.
```bash
# É uma boa prática sempre atualizar o pip
pip install --upgrade pip
# O comando a seguir lê cada linha do requirements.txt e baixa/instala a biblioteca correspondente
pip install -r requirements.txt
```

### 4. Iniciar o Servidor de Modelos (Terminal 1)
Com o ambiente ainda ativo, inicie o servidor.
```bash
lemonade-server-dev serve
```
Acesse `http://localhost:8000` no seu navegador e instale um modelo LLM (ex: `user.jan-nano`).

### 5. Configurar e Iniciar o Agente (Terminal 2)
- **Configurar:** Siga o guia em **[Configuração e Arquitetura](api.html)** para configurar o seu `agent.json` com o caminho correto do `npx`.
- **Executar:** Em um novo terminal (e com o ambiente virtual também ativado), execute o agente:
```bash
tiny-agents run file-assistant/agent.json
```