import app from './src/app.js'

const PORT = 3000

// Ouvir ou verificar o que estar a acontecer na porta 3000

app.listen(PORT, () =>{
    console.log(`O servidor esta rodando http://localhost:${PORT}`)
})

