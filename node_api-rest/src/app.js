import express from 'express'
const app = express()

//Indica o express ler conteudos do tipo Json dentro do corpo da página
app.use(express.json())

// Mock alocação de dados para teste por não haver ainda uma DATA_BASE 

const selecoes = [
    {id: 1, selecao: 'Angola', grupo: 'B'},
    {id: 2, selecao: 'Brazil', grupo: 'B'},
    {id: 3, selecao: 'EUA', grupo: 'B'},
    {id: 4, selecao: 'Argentina', grupo: 'B'},
]

// Criar a rota padrão ou raiz

app.get('/', (req, res) =>{
    res.send('Hello, World!')

})

app.get('/selecoes', (req, res) =>{
    res.status(200).send(selecoes)
})

app.post('/selecoes', (req, res)=>{
    selecoes.push(req.body)
    res.status(201).send('Seleção cadastrada com sucesso!!')
})

export default app

