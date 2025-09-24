---
layout: default
title: AI HR Talent Analyzer
description: AI-powered HR tool for job-candidate compatibility analysis using local LLM models
---

# 🤖 AI HR Talent Analyzer

<div align="center">
  <img src="https://img.shields.io/badge/python-v3.11+-blue.svg" alt="Python">
  <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/badge/MCP-Model_Context_Protocol-orange.svg" alt="MCP">
  <img src="https://img.shields.io/badge/AI-Local_LLM-green.svg" alt="AI">
</div>

## 🎯 Overview

AI HR Talent Analyzer é uma ferramenta de análise de recursos humanos que utiliza modelos de linguagem locais para processar vagas e currículos, mantendo total privacidade dos dados.

## 🚀 Quick Start

1. **Clone o repositório**
   ```bash
   git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
   cd ai-hr-talent-analyzer
   ```

2. **Configure o ambiente**
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # Linux/macOS
   # OU .venv\Scripts\activate  # Windows
   pip install -r requirements.txt
   ```

3. **Inicie os serviços**
   ```bash
   # Terminal 1
   lemonade-server-dev serve
   
   # Terminal 2  
   tiny-agents run agent.json
   ```

## 📚 Documentation

- [Installation Guide](installation.html)
- [API Reference](api.html)
- [Usage Examples](examples.html)
- [Troubleshooting](troubleshooting.html)

## ✨ Features

- 🔒 **100% Local Processing** - Complete data privacy
- 🤖 **AI-Powered Analysis** - Intelligent job-candidate matching
- 📊 **Compatibility Scoring** - Automated resume screening
- 💌 **Auto-Generated Invites** - Interview invitation creation
- 🚀 **MCP Integration** - Model Context Protocol support
- ⚡ **Lightweight Models** - Jan-Nano, Qwen3-4B support

## 🛠️ Tech Stack

| Component | Technology |
|-----------|------------|
| **Language** | Python 3.11+ |
| **Framework** | Lemonade SDK 8.0.3 |
| **Models** | Hugging Face Hub |
| **Protocol** | MCP (Model Context Protocol) |
| **Optimization** | GGUF Models |

## 🔗 Links

- [GitHub Repository](https://github.com/Jcnok/ai-hr-talent-analyzer)
- [Report Issues](https://github.com/Jcnok/ai-hr-talent-analyzer/issues)
- [Contribute](https://github.com/Jcnok/ai-hr-talent-analyzer/pulls)

---

<div align="center">
  <p><strong>⭐ Star this project if it helped you!</strong></p>
</div>
```