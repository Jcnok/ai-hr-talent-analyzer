---
layout: default
title: Installation Guide
---

# Installation Guide

## System Requirements

- Python 3.11 or higher
- Node.js 18+ (for npx command)
- Git
- 4GB+ RAM (recommended for local LLM models)

## Quick Installation

### Linux/macOS

```bash
# Clone repository
git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
cd ai-hr-talent-analyzer

# Create virtual environment
python -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt
```

### Windows

```powershell
# Clone repository
git clone https://github.com/Jcnok/ai-hr-talent-analyzer.git
cd ai-hr-talent-analyzer

# Create virtual environment
python -m venv .venv
.venv\Scripts\activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt
```

## Manual Installation Steps

### 1. Create Virtual Environment

```bash
python -m venv .venv

# Activate (Linux/macOS)
source .venv/bin/activate

# Activate (Windows)
.venv\Scripts\activate
```

### 2. Install Dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

### 3. Verify Installation

```bash
python -c "import lemonade, huggingface_hub, typer, mcp, aiohttp; print('✅ All imports successful')"
```

### 4. Configure NPX Path

Find your npx path:

```bash
# Linux/macOS
which npx

# Windows
where npx
```

Update `agent.json` with the correct path:

```json
{
  "model": "user.jan-nano",
  "endpointUrl": "http://localhost:8000/api/",
  "servers": [
    {
      "type": "stdio",
      "config": {
        "command": "/path/to/npx",
        "args": ["-y", "@wonderwhy-er/desktop-commander"]
      }
    }
  ]
}
```

## Next Steps

1. [Configure your model](api.html#model-setup)
2. [Run your first analysis](examples.html)
3. [Troubleshoot issues](troubleshooting.html)

[← Back to Home](index.html) | [Next: API Reference →](api.html)
```