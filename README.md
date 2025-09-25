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

Este é o método mais simples e rápido. O modelo de linguagem já vem pré-instalado na imagem.

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
    > Na primeira vez, o Docker construirá a imagem, o que inclui o download do modelo LLM e pode levar alguns minutos.

✅ **É isso!** O terminal se tornará sua janela de chat com o agente. A interface do servidor estará disponível em `http://localhost:8001`.

---

## ⚙️ Instalação Local (Alternativa)

<details>
<summary>👉 Clique aqui para ver as instruções de instalação local sem Docker.</summary>

Este método requer a instalação manual do Python e do Node.js.

1.  **Siga o guia de instalação detalhado** na nossa [**página de documentação completa**](https://jcnok.github.io/ai-hr-talent-analyzer/installation).

</details>

---

## 📚 Documentação Completa

Para guias detalhados, exemplos de uso e informações sobre a arquitetura do projeto, visite nosso site de documentação:

**[https://jcnok.github.io/ai-hr-talent-analyzer/](https://jcnok.github.io/ai-hr-talent-analyzer/)**

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir um Pull Request.

### Testando a Documentação Localmente
O site de documentação em `docs/` é construído com Jekyll.
1.  Instale o Ruby e o Bundler.
2.  Execute `bundle install` no diretório `docs/`.
3.  Execute `bundle exec jekyll serve --livereload` no diretório `docs/`.

## 📄 Licença

Este projeto está sob a licença MIT.

---

## 👨‍💻 Informações do Desenvolvedor

**Julio Okuda**
- 📧 Email: julio.okuda@gmail.com
- 🐙 GitHub: [github.com/jcnok](https://github.com/jcnok)
- 💼 LinkedIn: [linkedin.com/in/juliookuda](https://linkedin.com/in/juliookuda)