---
layout: default
title: Visão Geral
---

O **AI HR Talent Analyzer** é uma ferramenta de código aberto projetada para revolucionar a análise de talentos, trazendo o poder dos Grandes Modelos de Linguagem (LLMs) diretamente para o seu ambiente local.

Em um mundo onde a privacidade de dados é primordial, este projeto oferece uma solução segura para que equipes de Recursos Humanos e gerentes de contratação possam analisar descrições de vagas e currículos de candidatos sem nunca expor informações sensíveis a serviços de API de terceiros.

## 🎯 Objetivo Principal

O objetivo central é fornecer uma ferramenta de análise de RH que seja:

- ✅ **100% Local e Privada:** Todos os dados são processados na sua máquina. Nenhuma informação de vaga ou candidato sai do seu controle.
- 🧠 **Inteligente:** Utiliza LLMs para entender o contexto e as nuances tanto das descrições de vagas quanto dos currículos, fornecendo análises de compatibilidade que vão além da simples correspondência de palavras-chave.
- 🤖 **Automatizada:** Automatiza tarefas repetitivas, como a triagem inicial de currículos e a criação de convites de entrevista personalizados.
- ⚡ **Eficiente:** Otimizada para rodar com modelos de linguagem leves (GGUF), permitindo que funcione em hardware de desktop comum sem a necessidade de GPUs caras.
- 🔗 **Protocolo Padrão:** Construída sobre o **Model Context Protocol (MCP)**, garantindo uma comunicação padronizada e robusta com os modelos de linguagem.

## ✨ Funcionalidades

- **Análise de Vagas:** Extração inteligente de requisitos, responsabilidades e qualificações de um arquivo de descrição de vaga.
- **Análise de Candidatos:** Processamento automático de currículos para extrair experiência, habilidades e formação.
- **Matching de Compatibilidade:** Geração de análises detalhadas sobre o quão bem um candidato se encaixa em uma vaga.
- **Geração de Convites:** Criação automática de convites de entrevista em markdown, personalizados com o nome do candidato.
- **Interação Flexível:** Comunique-se com o agente usando linguagem natural para ler arquivos, fazer perguntas e gerar documentos.

## 🛠️ Tecnologias Utilizadas

| Componente | Tecnologia | Propósito |
| :--- | :--- | :--- |
| **Linguagem** | Python 3.11+ | Base do projeto |
| **Framework de Agentes** | Lemonade SDK | Fornece a infraestrutura para rodar o servidor de modelos |
| **Modelos** | Hugging Face Hub | Fonte para download de modelos GGUF |
| **Protocolo** | MCP | Padrão de comunicação com os modelos |
| **Otimização de Modelos**| GGUF | Formato de arquivo que permite a execução eficiente de LLMs na CPU |

---

> 🚀 **Pronto para começar?** Vá para o nosso **[Guia de Instalação](installation.html)** para configurar o ambiente.