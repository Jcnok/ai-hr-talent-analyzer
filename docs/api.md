---
layout: default
title: API Reference
---

# API Reference

## Available Tools

### read_file
Read content from local files.

**Syntax:**
```text
use tool read_file to read filename.md
```

**Example:**
```text
use only tool read_file to read job_description.md
```

### write_file
Create or update local files.

**Syntax:**
```text
use tool write_file to create filename.md with content
```

**Example:**
```text
use only tool write_file to create invite.md with interview invitation for John Doe
```

## Model Setup

### 1. Start Lemonade Server
```bash
lemonade-server-dev serve
```

### 2. Access Model Management
Open: [http://localhost:8000/#model-management](http://localhost:8000/#model-management)

### 3. Add Model
- **Name**: `user.jan-nano`
- **Checkpoint**: `Menlo/Jan-nano-gguf:jan-nano-4b-Q4_0.gguf`
- **Recipe**: `llamacpp`

## Command Examples

### Basic File Operations

```text
# Read job description
use only tool read_file to read job_description.md

# Read candidate resume
use only tool read_file to read candidates/john_resume.md

# Create interview invite
use only tool write_file to create invite.md with interview invitation
```

### Analysis Queries

```text
# Compatibility check
Does John Doe meet the job requirements? Is he suitable for the position?

# Skills assessment
What skills does the candidate have that match the job requirements?

# Generate summary
Create a compatibility summary for this candidate
```

## Best Practices

1. **Always read files before analysis**
2. **Use specific tool commands**
3. **Ask clear, direct questions**
4. **Verify generated files**

[← Back to Installation](installation.html) | [Next: Examples →](examples.html)
```