import express from 'express'

const app = express()

//Indica o express ler conteudos do tipo Json dentro do corpo da página
app.use(express.json())

const dados_pessoais = [
    {id: 1, nome: 'Benjamim Cacuengue', idade: 21},
    {id: 2, nome: 'Jeremias Zangui Zua', idade: 21},
    {id: 3, nome: 'Zenilda Muhongo', idade: 21}
]

app.get('/', (req, res)=>{

    res.send('Olá, Mundo!!')
})

app.get('/dados', (req, res)=>{

    res.send(dados_pessoais)
})

app.post('/dados', (req, res) =>{
    dados_pessoais.push(req.body)
    res.status(201).send('Dados cadastrado com sucesso!!!')
})

export default app