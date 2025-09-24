---
layout: default
title: Troubleshooting
---

# Troubleshooting Guide

## Common Issues

### 1. NPX Command Not Found

**Problem:** `npx: command not found`

**Solutions:**

1. **Install Node.js**
   - Download: [https://nodejs.org/](https://nodejs.org/)
   - Verify: `node --version`

2. **Find npx path**
   ```bash
   # Linux/macOS
   which npx
   
   # Windows
   where npx
   ```

3. **Update agent.json**
   ```json
   {
     "model": "user.jan-nano",
     "endpointUrl": "http://localhost:8000/api/",
     "servers": [
       {
         "type": "stdio",
         "config": {
           "command": "/full/path/to/npx",
           "args": ["-y", "@wonderwhy-er/desktop-commander"]
         }
       }
     ]
   }
   ```

### 2. Python Version Issues

**Problem:** `Python 3.11+ required`

**Solutions:**

1. **Using pyenv (recommended)**
   ```bash
   pyenv install 3.11.0
   pyenv local 3.11.0
   ```

2. **Using conda**
   ```bash
   conda create -n ai-hr python=3.11
   conda activate ai-hr
   ```

3. **Direct installation**
   - Download from [python.org](https://python.org)

### 3. Model Loading Issues

**Problem:** Model fails to load in Lemonade

**Solutions:**

1. **Check RAM** (4GB+ recommended)
2. **Try smaller models**: jan-nano, qwen3-4b
3. **Restart Lemonade server**
4. **Clear model cache**

### 4. Permission Issues (Windows)

**Problem:** Script execution blocked

**Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 5. Tool Commands Not Working

**Problem:** Agent doesn't execute commands

**Solutions:**

1. **Use specific syntax**
   ```text
   ❌ write file invite.md
   ✅ use only tool write_file to create invite.md
   ```

2. **Read files before analysis**
   ```text
   use tool read_file to read job_description.md
   use tool read_file to read candidates/john_resume.md
   Does the candidate match the job requirements?
   ```

## Getting Help

### Check Logs

1. **Lemonade Server Logs**
   - Check terminal where `lemonade-server-dev serve` is running

2. **Agent Logs**
   - Check terminal where `tiny-agents run agent.json` is running

### Report Issues

1. **GitHub Issues**: [Report a bug](https://github.com/Jcnok/ai-hr-talent-analyzer/issues/new)

2. **Include in report**:
   - Operating System
   - Python version (`python --version`)
   - Node.js version (`node --version`)
   - Error messages
   - Steps to reproduce

### Community Support

- [GitHub Discussions](https://github.com/Jcnok/ai-hr-talent-analyzer/discussions)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/mcp+python)

[← Back to Examples](examples.html) | [Back to Home →](index.html)