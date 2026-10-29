import express from 'express'

const app = express()
app.use(express.json())

// Registos fictícios para demonstração; não incluir dados pessoais reais neste exemplo.
const dados_de_teste = [
    { id: 1, nome: 'Utilizador de exemplo 1', idade: null },
    { id: 2, nome: 'Utilizador de exemplo 2', idade: null },
    { id: 3, nome: 'Utilizador de exemplo 3', idade: null },
]

app.get('/', (req, res) => {
    res.send('Olá, mundo!')
})

app.get('/dados', (req, res) => {
    res.status(200).json(dados_de_teste)
})

app.post('/dados', (req, res) => {
    dados_de_teste.push(req.body)
    res.status(201).send('Registo de demonstração criado.')
})

export default app
