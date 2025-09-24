---
layout: default
title: Exemplos de Uso
---

Com o ambiente configurado e o agente em execução, você está pronto para começar a análise. Esta página mostra um fluxo de trabalho completo e detalhado.

## O Conceito de "Contexto" do Agente

Antes de começar, é crucial entender o conceito de **contexto**. O agente, por padrão, não tem conhecimento prévio sobre os seus arquivos locais. Ele só "aprende" sobre um arquivo depois que você o instrui a lê-lo.

- **Memória de Trabalho:** Pense no contexto como a memória de trabalho de curto prazo do agente. Quando você usa o comando `read_file`, o conteúdo daquele arquivo é carregado nesta memória. Todas as perguntas e comandos subsequentes que você der levarão em conta as informações que estão nesta memória.
- **Perda de Contexto:** Esta memória não é permanente. Se você reiniciar o agente (ou o contêiner Docker), o contexto é apagado. Você precisará carregar os arquivos novamente para que ele se "lembre" deles para a nova sessão.

## Fluxo de Análise Completo: Passo a Passo

Vamos simular um caso de uso real: analisar se o candidato "John Doe" é um bom "fit" para a vaga de "Engenheiro de Software Backend".

### Passo 1: Carregar a Descrição da Vaga

O primeiro passo é sempre fornecer o contexto principal. Neste caso, a descrição da vaga.

```text
use only tool read_file to read job_description.md
```
> **Por que `use only tool`?** Para modelos de linguagem menores (como o Jan-Nano), ser explícito ajuda o modelo a evitar ambiguidades e a escolher a ferramenta correta (`read_file`) sem hesitação.
>
> O agente responderá confirmando que leu o arquivo. Agora, os requisitos da vaga estão no contexto.

### Passo 2: Carregar o Currículo do Candidato

Em seguida, adicione o segundo pedaço de informação ao contexto: o currículo do candidato.

```text
use only tool read_file to read candidates/john_resume.md
```
> O contexto do agente agora contém as informações da vaga **e** do candidato. Ele está pronto para a análise.

### Passo 3: Fazer a Pergunta de Análise

Agora que o agente tem todos os dados, você pode fazer a pergunta principal. Para obter uma resposta de alta qualidade, seja o mais específico possível no seu prompt.

```text
Com base nos dois arquivos que você leu, a vaga e o currículo, John Doe atende aos requisitos? Forneça uma análise detalhada, listando os pontos fortes onde ele se alinha com a vaga e os pontos fracos ou requisitos que ele pode não atender.
```
> O LLM irá processar sua pergunta, cruzar as informações dos dois documentos que estão em seu contexto e gerar uma análise inteligente e estruturada.

### Passo 4: Gerar um Artefato (Convite de Entrevista)

Satisfeito com a análise, você pode pedir ao agente para realizar uma ação, como criar um arquivo de convite.

```text
use only a tool write_file to create invite.md with a formal interview invitation for John Doe for the Software Engineer Backend position. Include a placeholder for a scheduling link.
```
> O agente usará a ferramenta `write_file` para criar um novo arquivo chamado `invite.md` com o conteúdo solicitado.

### Passo 5: Verificar o Trabalho do Agente

É sempre uma boa prática de "confiar, mas verificar". Peça ao agente para ler o arquivo que ele acabou de criar para que você possa revisar o resultado.

```text
use tool read_file to read invite.md
```
> O agente exibirá o conteúdo do convite, permitindo que você o revise e confirme que está correto, finalizando o ciclo de trabalho.

Este ciclo de **Ler -> Analisar -> Agir -> Verificar** é a base para interagir de forma eficaz com o seu agente de IA local. Experimente com seus próprios arquivos de vagas e currículos para ver o poder da ferramenta!