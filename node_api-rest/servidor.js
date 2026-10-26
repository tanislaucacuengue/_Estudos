import app from './src/treino.js'

const porta = 3000

app.listen(porta, ()=>{
    console.log(`O servidor está a rodar no endereço http://localhost:${porta}`)
})