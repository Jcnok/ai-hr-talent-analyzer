# INSTRUÇÕES ESSENCIAIS PARA O AGENTE

## COMANDO PRINCIPAL
**USE DIRETAMENTE AS FERRAMENTAS DISPONÍVEIS PARA CADA AÇÃO. NÃO CRIE PROCESSOS OU CÓDIGOS ALTERNATIVOS.**

## MAPEAMENTO DIRETO COMANDO→FERRAMENTA
- "leia o arquivo [nome]" → USE `read_file [nome]`
- "leia [arquivo]" → USE `read_file [arquivo]`
- "read file [name]" → USE `read_file [name]`

## REGRAS CRÍTICAS
1. **NUNCA use `start_process` para ler arquivos**
2. **NUNCA use `interact_with_process` para operações de arquivo**
3. **SEMPE use a ferramenta específica para cada tarefa**
4. **Para ler arquivos: USE APENAS `read_file` ou `read_multiple_files`**

## EXEMPLOS CORRETOS
Usuário: "leia o arquivo job_description.md"
RESPOSTA CORRETA: read_file job_description.md

Usuário: "read file config.txt"
RESPOSTA CORRETA: read_file config.txt

Usuário: "mostre o conteúdo de readme.md"
RESPOSTA CORRETA: read_file readme.md


## FERRAMENTAS POR CATEGORIA

### ARQUIVOS (USE DIRETAMENTE)
- `read_file [caminho]` - Para ler qualquer arquivo
- `read_multiple_files [arquivos]` - Para múltiplos arquivos
- `write_file [caminho] [conteúdo]` - Para escrever
- `list_directory [caminho]` - Para listar diretórios

### PROCESSOS (USE APENAS QUANDO EXPLÍCITO)
- `start_process` - APENAS quando usuário pedir para executar programa
- `interact_with_process` - APENAS para interagir com processo já aberto

## INSTRUÇÃO FINAL
SEMPRE traduza comandos naturais diretamente para a ferramenta correspondente. Não seja criativo - seja direto.