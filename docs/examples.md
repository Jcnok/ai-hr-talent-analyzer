---
layout: default
title: Usage Examples
---

# Usage Examples

## Complete Workflow Example

### Step 1: Start Services

```bash
# Terminal 1: Start Lemonade Server
lemonade-server-dev serve

# Terminal 2: Run Agent
tiny-agents run agent.json
```

### Step 2: Load Data

```text
use only tool read_file to read job_description.md
```

```text
use only tool read_file to read candidates/john_resume.md
```

### Step 3: Perform Analysis

```text
Does John Doe meet the job requirements? Is he suitable for the position?
```

### Step 4: Generate Documents

```text
use only tool write_file to create invite.md with interview invitation for John Doe
```

### Step 5: Verify Results

```text
use only tool read_file to read invite.md
```

## Sample Data Files

### job_description.md
```markdown
# Vaga: Desenvolvedor Python Sênior

## Empresa
TechCorp Solutions

## Requisitos Obrigatórios
- 5+ anos de experiência com Python
- Conhecimento em FastAPI, Django ou Flask
- Experiência com bancos de dados (PostgreSQL, MongoDB)
- Inglês intermediário

## Salário
R$ 12.000 - R$ 18.000
```

### candidates/john_resume.md
```markdown
# John Doe - Desenvolvedor Python

## Experiência Profissional
### Desenvolvedor Python Sênior | TechStart Solutions
**Período**: Jan 2021 - Presente (3 anos)
- Desenvolvimento de APIs REST usando FastAPI
- Deploy de aplicações em AWS usando Docker

## Habilidades Técnicas
- **Linguagens**: Python, JavaScript, SQL
- **Frameworks**: FastAPI, Django, Flask
- **Bancos**: PostgreSQL, MongoDB

## Idiomas
- **Inglês**: Avançado
```

## Expected Output

### Analysis Response
```text
✅ **COMPATIBILIDADE: ALTA**

John Doe atende aos requisitos principais da vaga:
- ✅ 6 anos de experiência com Python (requisito: 5+)
- ✅ Conhecimento em FastAPI e Django
- ✅ Experiência com PostgreSQL e MongoDB
- ✅ Inglês avançado (requisito: intermediário)

**Recomendação**: Candidato altamente qualificado para a posição.
```

### Generated Invite
```markdown
# Convite para Entrevista - John Doe

Prezado John Doe,

Ficamos impressionados com seu perfil e gostaríamos de convidá-lo para uma entrevista para a vaga de Desenvolvedor Python Sênior na TechCorp Solutions.

## Detalhes da Entrevista
- **Data**: A confirmar
- **Modalidade**: Online (Google Meet)
- **Duração**: 1 hora

Aguardamos seu retorno.

Atenciosamente,
Equipe de Recrutamento
```

[← Back to API](api.html) | [Next: Troubleshooting →](troubleshooting.html)
```