# Tiny Agents MCP - Análise de Vagas e Candidatos

<div align="center">

[![Docker](https://img.shields.io/badge/docker-ready-blue.svg?logo=docker)](docker-compose.yml)
[![Python](https://img.shields.io/badge/python-v3.11+-blue.svg)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-active-success.svg)](https://github.com/Jcnok/ai-hr-talent-analyzer)
[![Documentation](https://img.shields.io/badge/docs-GitHub%20Pages-blue.svg)](https://jcnok.github.io/ai-hr-talent-analyzer/)

</div>

## 📋 Visão Geral

Este projeto demonstra a implementação e utilização do **Tiny Agents MCP** para análise automatizada de vagas e candidatos. Utilizando modelos de linguagem locais (LLM), o sistema mantém a privacidade total dos dados enquanto fornece análises de compatibilidade inteligentes e gera convites de entrevista.

---

## 🚀 Comece a Usar em 2 Minutos com Docker (Recomendado)

Este é o método mais simples e rápido. Ele elimina a necessidade de instalar Python ou Node.js na sua máquina.

### 1. Pré-requisitos

- **Git**: [Instale aqui](https://git-scm.com/downloads)
- **Docker e Docker Compose**: [Instale aqui](https://docs.docker.com/get-docker/)

### 2. Execução

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
    cd ai-hr-talent-analyzer
    ```
2.  **Inicie os serviços:**
    ```bash
    docker-compose up
    ```

O Docker irá construir a imagem, baixar as dependências e iniciar o servidor de modelos e o agente interativo.

### 3. Primeiros Passos com Docker

- **Acesse a Interface do Lemonade:** Para adicionar ou gerenciar seus modelos, abra o navegador e acesse **[http://localhost:8000](http://localhost:8000/#model-management)**.
- **Use o Agente:** O terminal onde você executou `docker-compose up` se tornará a sua janela de chat com o agente.
- **Para encerrar:** Pressione `Ctrl + C` no terminal. Para remover os contêineres, execute `docker-compose down`.

---

## ⚙️ Instalação Local (Alternativa)

<details>
<summary>👉 Clique aqui para ver as instruções de instalação local sem Docker.</summary>

### 1. Pré-requisitos

- **Git**: [Instale aqui](https://git-scm.com/downloads)
- **Python 3.11+**: [Instale aqui](https://www.python.org/downloads/)
- **Node.js (com npx)**: [Instale aqui](https://nodejs.org/)

### 2. Instalação Automatizada com Scripts

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
    cd ai-hr-talent-analyzer
    ```
2.  **Execute o script de setup para o seu sistema:**

    *   **Linux / macOS (usando Terminal):**
        ```bash
        # Dê permissão de execução ao script
        chmod +x ./scripts/setup.sh
        # Execute o script
        ./scripts/setup.sh
        ```

    *   **Windows (usando PowerShell como Administrador):**
        ```powershell
        # Permite a execução de scripts para esta sessão
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
        # Execute o script
        .\scripts\setup.ps1
        ```

### 3. Configure e Inicie o Servidor de Modelos

1.  **Inicie o Lemonade Server** em um terminal separado.
    ```bash
    # Ative o ambiente virtual primeiro
    # Linux/macOS: source .venv/bin/activate
    # Windows: .venv\Scripts\activate

    lemonade-server-dev serve
    ```
2.  **Adicione um Modelo GGUF** na interface em **[http://localhost:8000](http://localhost:8000/#model-management)**.
    *   **Name**: `user.jan-nano`
    *   **Checkpoint**: `Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf`
    *   **Recipe**: `llamacpp`

### 4. Configure o Agente

1.  **Encontre o caminho do `npx`:**
    *   **Windows:** `where.exe npx`
    *   **Linux/macOS:** `which npx`
2.  **Atualize o `file-assistant/agent.json`:** Substitua `"/CAMINHO/DO/NPX"` pelo caminho encontrado.

### 5. Execute o Agente

*   **Linux / macOS:**
    ```bash
    chmod +x ./scripts/run.sh
    ./scripts/run.sh
    ```
*   **Windows (PowerShell):**
    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
    .\scripts\run.ps1
    ```

</details>

---

## 🎮 Exemplos de Uso

Após iniciar o agente (seja com Docker ou localmente), você pode interagir com ele em linguagem natural.

> **⚠️ Dica Importante**: Para modelos menores (como Jan-Nano), seja muito específico e direto sobre qual ferramenta usar.

#### A) Ler a Descrição da Vaga
```text
use only tool read_file to read job_description.md
```

#### B) Ler o Currículo do Candidato
```text
use only tool read_file to read candidates/john_resume.md
```

#### C) Analisar Compatibilidade
*Primeiro, certifique-se de que o agente leu os dois arquivos acima.*
```text
John Doe atende aos requisitos da vaga? Responda se ele é adequado para o cargo.
```

#### D) Criar um Convite de Entrevista
```text
use only a tool write_file to create invite.md with an interview invitation for John Doe
```

---

## 📁 Estrutura do Projeto

```
ai-hr-talent-analyzer/
├── file-assistant/         # Contém os arquivos do agente e exemplos
├── scripts/                # Scripts de automação para setup local
├── Dockerfile              # Receita para construir a imagem Docker
├── docker-compose.yml      # Orquestrador dos serviços Docker
└── README.md               # Este arquivo
```

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir um Pull Request.

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🙏 Agradecimentos

- Equipe do Hugging Face, comunidade Python e contribuidores do Lemonade SDK.

---

## 👨‍💻 Informações do Desenvolvedor

**Julio Okuda**
- 📧 Email: julio.okuda@gmail.com
- 🐙 GitHub: [github.com/jcnok](https://github.com/jcnok)
- 💼 LinkedIn: [linkedin.com/in/juliookuda](https://linkedin.com/in/juliookuda)