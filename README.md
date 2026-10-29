# Estudos

Repositório de exercícios e projetos de aprendizagem em programação, desenvolvimento web, bases de dados e redes. Os exemplos são independentes e têm objetivos didáticos; este repositório não representa uma única aplicação pronta para produção.

## Conteúdo

- `C/` — exercícios de C/C++ e projetos do Dev-C++; os executáveis e objetos compilados não são necessários para reconstruir os exemplos.
- `Redes/` — materiais e laboratórios de redes, incluindo ficheiros do Cisco Packet Tracer.
- `Redes Sociais/` — exercício de HTML/CSS com páginas demonstrativas de redes sociais.
- `Progeto Cordel/` — página de estudo de HTML/CSS inspirada no projeto Cordel Moderno.
- `bootstrap5/` — exercícios com Bootstrap.
- `clima/` — interface de consulta meteorológica com HTML, CSS e JavaScript.
- `contagem/` — exercício de temporizador em JavaScript.
- `node_api-rest/` — exemplos introdutórios de rotas HTTP com Express.
- `base_de_dados/` — exercícios e exemplos de SQL.

Os exemplos SQL usam agora nomes e contactos fictícios; não devem ser preenchidos com dados pessoais reais.

Os exemplos podem ter níveis de acabamento diferentes. Consulta o README da pasta de cada projeto, quando disponível, antes de o executar.

## Executar alguns exemplos

### Aplicação meteorológica

A partir desta pasta:

```bash
cd clima
python3 -m http.server 8000
```

Abre `http://localhost:8000` no navegador. A aplicação procura a cidade através da API pública de geocodificação e consulta a previsão atual através da API Open-Meteo. Não é necessária uma chave de API para este uso de avaliação não comercial. A aplicação apresenta uma atribuição ao fornecedor dos dados; consulta `clima/README.md` para as condições e os créditos.

### API Node.js

A partir desta pasta:

```bash
cd node_api-rest
npm ci
npm start
```

O servidor de exemplo disponibiliza as rotas definidas no código e escuta na porta `3000`. Ainda não existe uma suite de testes configurada.

## Desenvolvimento

Os diretórios contêm trabalhos de estudo independentes. Antes de uma alteração estrutural maior, preserva os fontes e exercícios associados e confirma se continuam necessários. Dependências instaladas localmente e artefactos compilados são ignorados pelo Git; usa os manifestos e ficheiros de origem para os reconstruir.

## Licenças e créditos

A licença na raiz aplica-se nos termos descritos em `LICENSE`. Verifica os créditos e as licenças dos materiais de terceiros antes de redistribuir imagens, trabalhos de curso, ficheiros de laboratório ou exemplos cuja autoria não seja tua. A pasta `clima/` tem uma nota específica de atribuição e utilização dos dados meteorológicos.
