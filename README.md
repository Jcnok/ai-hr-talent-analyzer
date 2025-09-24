# Tiny Agents MCP - Análise de Vagas e Candidatos

<div align="center">

[![Python](https://img.shields.io/badge/python-v3.11+-blue.svg)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-active-success.svg)](https://github.com/Jcnok/ai-hr-talent-analyzer)
[![Documentation](https://img.shields.io/badge/docs-GitHub%20Pages-blue.svg)](https://jcnok.github.io/ai-hr-talent-analyzer/)

</div>

## 📋 Visão Geral

Este projeto demonstra a implementação e utilização do **Tiny Agents MCP** (Model Context Protocol) para análise automatizada de vagas de emprego e candidatos. O sistema utiliza modelos de linguagem locais (LLM) para processar arquivos de descrição de vagas e currículos, fornecendo análises de compatibilidade e gerando convites de entrevista automatizados.

### 🎯 Objetivo

Criar uma ferramenta de análise de recursos humanos que:

- ✅ Processa descrições de vagas e currículos localmente
- 🔒 Mantém privacidade total dos dados (sem exposição externa)
- 🧠 Gera análises de compatibilidade inteligentes
- 🤖 Automatiza a criação de convites de entrevista
- ⚡ Utiliza modelos de linguagem leves e eficientes

---

## 🚀 Comece a Usar em 5 Minutos

Siga os passos abaixo para ter o ambiente funcionando.

### 1. Pré-requisitos

- **Git**: [Instale aqui](https://git-scm.com/downloads)
- **Python 3.11+**: [Instale aqui](https://www.python.org/downloads/)
- **Node.js (com npx)**: [Instale aqui](https://nodejs.org/)

### 2. Instalação Automatizada

Nós fornecemos scripts para uma configuração rápida e livre de erros.

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
    O script cuidará de tudo: criará o ambiente virtual, instalará as dependências e verificará a instalação.

<details>
<summary>👉 Prefere a instalação manual? Clique para expandir</summary>

1.  **Crie um ambiente virtual:**
    ```bash
    python -m venv .venv
    ```
2.  **Ative o ambiente:**
    *   **Windows:** `.venv\Scripts\activate`
    *   **Linux/macOS:** `source .venv/bin/activate`
3.  **Instale as dependências:**
    ```bash
    pip install --upgrade pip
    pip install -r requirements.txt
    ```
4.  **Verifique a instalação:**
    ```bash
    python -c "import lemonade, huggingface_hub, typer, mcp, aiohttp; print('✅ Sucesso!')"
    ```

</details>

### 3. Configure e Inicie o Servidor de Modelos

1.  **Inicie o Lemonade Server** em um terminal separado. Ele ficará rodando em segundo plano.
    ```bash
    # Ative o ambiente virtual primeiro, se não estiver ativo
    # Linux/macOS: source .venv/bin/activate
    # Windows: .venv\Scripts\activate

    lemonade-server-dev serve
    ```
2.  **Adicione um Modelo GGUF:**
    *   Acesse a interface em **[http://localhost:8000](http://localhost:8000/#model-management)**.
    *   Clique em **"Add Model"** e preencha:
        *   **Name**: `user.jan-nano` (ou o nome que preferir).
        *   **Checkpoint**: Use um modelo do Hugging Face, como `Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf`, ou o caminho para um arquivo `.gguf` local.
        *   **Recipe**: `llamacpp`.
    *   Clique em **Install**.

### 4. Configure o Agente

Os arquivos `agent.json` e `agent1.json` já estão pré-configurados. Você só precisa ajustar o caminho do `npx`.

1.  **Encontre o caminho do `npx`:**
    *   **Windows (PowerShell):** `where.exe npx`
    *   **Linux/macOS:** `which npx`
2.  **Atualize o `agent.json`:**
    *   Abra o arquivo `agent.json`.
    *   No campo `"command"`, substitua `"/CAMINHO/DO/NPX"` pelo caminho completo que você encontrou.
    *   **Exemplo Windows:** `"C:\\Program Files\\nodejs\\npx.cmd"` (note as barras duplas).
    *   **Exemplo Linux:** `"/home/user/.nvm/versions/node/v20.10.0/bin/npx"`.

### 5. Execute o Agente

Use nossos scripts de execução que verificam se o ambiente está pronto antes de iniciar.

*   **Linux / macOS (usando Terminal):**
    ```bash
    # Dê permissão de execução ao script (apenas na primeira vez)
    chmod +x ./scripts/run.sh

    # Execute o agente
    ./scripts/run.sh
    ```

*   **Windows (usando PowerShell):**
    ```powershell
    # Permite a execução de scripts para esta sessão (se necessário)
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

    # Execute o agente
    .\scripts\run.ps1
    ```
✅ **Sucesso!** O agente será iniciado e mostrará as ferramentas disponíveis.

---

## 🎮 Exemplos de Uso

Depois de iniciar o agente, você pode interagir com ele em linguagem natural.

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

#### E) Verificar o Convite Criado
```text
use tool read_file to read invite.md
```

---

## 📁 Estrutura do Projeto

```
ai-hr-talent-analyzer/
├── .venv/                  # Ambiente virtual (criado pelo setup)
├── scripts/                # Scripts de automação
│   ├── setup.sh            # Script de instalação para Linux/macOS
│   ├── setup.ps1           # Script de instalação para Windows
│   ├── run.sh              # Script de execução para Linux/macOS
│   └── run.ps1             # Script de execução para Windows
├── candidates/             # Pasta com exemplos de currículos
├── docs/                   # Documentação para GitHub Pages
├── .python-version         # Versão do Python (para pyenv)
├── requirements.in         # Dependências principais
├── requirements.txt        # Dependências travadas
├── agent.json              # Configuração do agente (modelo Jan-Nano)
├── agent1.json             # Configuração alternativa (modelo Qwen)
└── README.md               # Este arquivo
```

---

## 🔧 Solução de Problemas Comuns

- **Erro de `command not found` ao rodar scripts:** Verifique se você deu permissão de execução (`chmod +x`) no Linux/macOS ou se ajustou a `ExecutionPolicy` no PowerShell.
- **Agente não responde ou dá erro:** Garanta que o **Lemonade Server está rodando** no outro terminal.
- **Análise incorreta:** Lembre-se de usar `read_file` para carregar a vaga e o currículo no contexto do modelo **antes** de fazer a pergunta de análise.

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir um Pull Request.

1. Faça um fork do projeto.
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`).
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`).
4. Faça o push (`git push origin feature/MinhaFeature`).
5. Abra um Pull Request.

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🙏 Agradecimentos

- Equipe do Hugging Face pela infraestrutura de modelos.
- Comunidade Python pelo ecossistema robusto.
- Contribuidores do projeto Lemonade SDK.

---

## 👨‍💻 Informações do Desenvolvedor

**Julio Okuda**
- 📧 Email: julio.okuda@gmail.com
- 🐙 GitHub: [github.com/jcnok](https://github.com/jcnok)
- 💼 LinkedIn: [linkedin.com/in/juliookuda](https://linkedin.com/in/juliookuda)