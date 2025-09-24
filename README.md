# Tiny Agents MCP - Análise de Vagas e Candidatos

<div align="center">

![Python](https://img.shields.io/badge/python-v3.11+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)

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

## 🚀 Funcionalidades

- **Análise de Vagas**: Processamento inteligente de descrições de vagas
- **Análise de Candidatos**: Avaliação automática de currículos
- **Compatibilidade**: Matching entre vagas e candidatos
- **Geração de Convites**: Criação automática de convites de entrevista
- **Processamento Local**: Sem dependência de APIs externas
- **Privacidade Total**: Dados nunca deixam seu ambiente

## 🛠️ Tecnologias Utilizadas

- **Python 3.11+**
- **Lemonade SDK 8.0.3** - Framework para agentes inteligentes
- **Hugging Face Hub 0.33.0** - Acesso a modelos de linguagem
- **MCP (Model Context Protocol)** - Protocolo de contexto para modelos
- **FastAPI** - Framework web moderno e rápido
- **Pydantic** - Validação de dados
- **ONNX** - Otimização de modelos de ML

## 📦 Instalação

### Pré-requisitos

- Python 3.11 ou superior
- pip (gerenciador de pacotes Python)
- Git

### Passo a Passo

1. **Clone o repositório**
```bash
git clone https://github.com/Jcnok/mcp-course-hf.git
cd curso-mcp
```

2. **Crie um ambiente virtual**
```bash
python -m venv .venv
```

3. **Ative o ambiente virtual**

**Windows:**
```bash
.venv\Scripts\activate
```

**Linux/macOS:**
```bash
source .venv/bin/activate
```

4. **Instale as dependências**
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

5. **Verifique a instalação**
```bash
python -c "import lemonade, huggingface_hub, typer, mcp, aiohttp; print('✅ Todas as dependências principais importadas com sucesso')"
```

Se você vir a mensagem de sucesso, a instalação foi concluída corretamente!

## 🎮 Como Usar

### Pré-requisitos Adicionais

Antes de começar, certifique-se de ter:
- Node.js instalado
- Um modelo GGUF (recomendado: Jan-Nano ou Qwen3-4B)

### Passo a Passo Completo

#### 1. Instale Node.js
Baixe e instale em: https://nodejs.org/

#### 2. Localize o caminho do npx

**WSL2/Linux:**
```bash
which npx
```

**Windows:**
```powershell
where npx
```

Guarde esta informação, você precisará dela no passo 6.

#### 3. Inicie o Lemonade Server
```bash
lemonade-server-dev serve
```

⚠️ **Importante**: Deixe esta janela aberta durante todo o uso do sistema.

Acesse a interface em: http://localhost:8000/#model-management

#### 4. Adicione o Modelo GGUF

Na interface do Lemonade:
1. Clique em **"Add Model"**
2. Preencha os campos:
   - **Name**: `user.jan-nano`
   - **Checkpoint**: Caminho local para o modelo .gguf 
     - Use esse da huggingface: `Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf`
   - **Recipe**: `llamacpp`
3. Clique em Install
   
💡 **Dica**: Modelos "nano" e "qwen3-4b" são os mais leves para testes funcionais.

#### 5. Use o exemplo:

```bash
cd file-assistant
```
#### 6. Configure o agent.json

Crie o arquivo `agent.json` com o seguinte conteúdo:

```json
{
  "model": "user.jan-nano",
  "endpointUrl": "http://localhost:8000/api/",
  "servers": [
    {
      "type": "stdio",
      "config": {
        "command": "/CAMINHO/DO/NPX",
        "args": ["-y", "@wonderwhy-er/desktop-commander"]
      }
    }
  ]
}
```

**Substitua `/CAMINHO/DO/NPX` pelo caminho obtido no passo 2:**

**Exemplos:**
- **Linux**: `"/home/seuuser/.nvm/versions/node/vXX/bin/npx"`
- **Windows**: `"C:\\Program Files\\nodejs\\npx.cmd"`

#### 7. Execute o Agente Tiny via MCP

```bash
tiny-agents run agent.json
```

✅ **Sucesso**: O agente mostrará as ferramentas disponíveis: `read_file`, `write_file`, entre outras.

### 🎯 Exemplos Práticos Testados

> **⚠️ Importante**: Para modelos menores (como Jan-Nano), seja específico sobre qual ferramenta usar. Use comandos diretos e claros.

#### A) Ler Arquivo da Vaga
```text
use only tool read_file to read job_description.md
```

#### B) Ler Currículo do Candidato
```text
use only tool read_file to read candidates/john_resume.md
```

#### C) Análise de Compatibilidade
**Primeiro, certifique-se de ter lido os arquivos necessários, depois pergunte:**
```text
John Doe atende aos requisitos da vaga? Responda se ele é adequado para o cargo?
```

💡 **Como funciona**: O modelo LLM usa o contexto dos arquivos lidos anteriormente para gerar a análise.

#### D) Criar Convite de Entrevista (Comando Testado com Sucesso)
```text
use only a tool write_file to create invite.md with interview invitation for John Doe
```

**Comando alternativo mais específico:**
```text
use tool write_file to create invite.md with interview invitation for John Doe
```

#### E) Verificar o Convite Criado
```text
use tool read_file to read invite.md
```

### 🔄 Fluxo de Trabalho Resumido

1. **Leitura**: Use `read_file` para carregar dados do sistema local
2. **Análise**: Faça perguntas em linguagem natural para comparar requisitos
3. **Geração**: Use `write_file` para criar documentos automáticos
4. **Verificação**: Confira os resultados com `read_file`

**Resultado**: Análise rápida, assertiva e 100% local — sem exposição de dados!

### 💡 Dicas para Execução Assertiva

- ✅ Sempre confira se está no diretório correto (`file-assistant`)
- ✅ Garanta que o Lemonade está rodando sem erros na interface
- ✅ Use comandos diretos (`read_file`, `write_file`) para garantir funcionamento
- ✅ Para análises complexas, sempre leia os arquivos primeiro
- ✅ O sistema aceita comandos em português livre 
- ✅ Você pode pedir para resumir, corrigir ou detalhar informações
- ✅ Dependendo o hardware o modelo pode dermorar para responder algumas perguntas

  

### 🔧 Comandos Úteis Adicionais

**Listar arquivos disponíveis:**
```text
Quais arquivos estão disponíveis no diretório atual?
```

**Criar novos arquivos de análise:**
```text
write_file analise_completa.md "Análise detalhada do candidato John Doe"
```

**Editar arquivos existentes:**
```text
Como posso melhorar o convite de entrevista?
```

## 📁 Estrutura do Projeto

```
curso-mcp/
├── .venv/                  # Ambiente virtual
├── .python-version         # Versão do Python
├── requirements.in         # Dependências principais
├── requirements.txt        # Dependências compiladas
├── agent.json             # Configuração do agente
├── job_description.md     # Exemplo de descrição de vaga
├── candidates/            # Pasta com currículos
│   └── john_resume.md     # Exemplo de currículo
├── invite.md              # Convite gerado
└── README.md              # Este arquivo
```

## 🧪 Executando Testes

Para verificar se tudo está funcionando corretamente:

1. **Teste de importação das dependências:**
```bash
python -c "import lemonade, huggingface_hub, typer, mcp, aiohttp; print('✅ Teste passou!')"
```

2. **Teste do ambiente virtual:**
```bash
pip list | grep -E "(lemonade|huggingface|mcp)"
```

3. **Teste do agente:**
```bash
tiny-agents --help
```

## 🔧 Desenvolvimento

### Atualizando Dependências

Para adicionar novas dependências:

1. Edite o arquivo `requirements.in`
2. Execute:
```bash
pip-compile requirements.in
pip install -r requirements.txt
```

### Verificando Dependências Não Utilizadas

```bash
deptry .
```

## 🐛 Solução de Problemas

#### Problema: Comando não é executado
**Solução**: Seja mais específico sobre a ferramenta:
```text
❌ write_file invite.md "conteúdo"
✅ use only a tool write_file to create invite.md with interview invitation
```

#### Problema: Análise sem contexto
**Solução**: Sempre leia os arquivos primeiro:
```text
1. use tool read_file to read job_description.md
2. use tool read_file to read candidates/john_resume.md  
3. O candidato atende aos requisitos da vaga?
```

#### Problema: Resposta genérica
**Solução**: Use comandos mais diretos e específicos:
```text
❌ "Crie um convite"
✅ "use only a tool write_file to create invite.md com convite para John Doe"
```

### 📋 Checklist de Execução

- [ ] Lemonade Server rodando em http://localhost:8000
- [ ] Modelo carregado corretamente na interface
- [ ] Arquivos de exemplo criados (job_description.md, john_resume.md)
- [ ] agent.json configurado com caminho correto do npx
- [ ] Comandos específicos usando "use tool [nome] to [ação]"
- [ ] Arquivos lidos antes de fazer análises
- [ ] Verificação dos arquivos criados

## 📚 Recursos Adicionais

- [Documentação do Lemonade SDK](https://docs.lemonade.ai/)
- [Hugging Face Hub](https://huggingface.co/docs/huggingface_hub)
- [Model Context Protocol](https://modelcontextprotocol.io/)

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 🙏 Agradecimentos

- Equipe do Hugging Face pela infraestrutura de modelos
- Comunidade Python pelo ecossistema robusto
- Contribuidores do projeto Lemonade SDK

---

## 👨‍💻 Informações do Desenvolvedor

**Julio Okuda**
- 📧 Email: julio.okuda@gmail.com
- 🐙 GitHub: [github.com/jcnok](https://github.com/jcnok)
- 💼 LinkedIn: [linkedin.com/in/juliookuda](https://linkedin.com/in/juliookuda)