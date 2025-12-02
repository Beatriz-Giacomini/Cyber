const express = require('express')
const server = express()
const cors = require('cors')
const mysql = require('mysql2/promise')

const crypto = require('crypto')

server.use(cors())
server.use(express.json())

const pool = require('./db')
const porta = 3000

server.listen(porta, () => {
    console.log(`Servidor rodando em: http://localhost:${porta}`)
})

server.post("/faleconosco", async (req,res) =>{
    try {
        const {nome, email, telefone, assunto, mensagem} = req.body

        if(nome == ""){
            return res.json({"resposta":"Preencha o campo nome corretamenete"})
        }else if(email == ""){
            return res.json({"resposta":"Preencha o campo e-mail corretamenete"})
        }else if(assunto == ""){
            return res.json({"resposta":"Preencha o campo assunto corretamenete"})
        }else if(mensagem == ""){
            return res.json({"resposta":"Preencha o campo mensagem corretamenete"})
        }

        const sql = `insert into fale_conosco (nome, email, telefone, assunto, mensagem) values (?,?,?,?,?)`

        const [resultado] = await pool.query(sql,[nome, email, telefone, assunto, mensagem])

        res.json({"resposta":"Enviado com sucesso"})
    } catch (error) {
        res.json({"resposta":"Erro inesperado"})
    }
})

server.post("/cadastro", async (req, res) => {
    try {
        const { nome, email } = req.body
        let { senha } = req.body

        senha = senha.trim()

        if (senha == "") {
            return res.json({ "resposta": "Preencha o campo" })
        } else if (senha.length < 6) {
            return res.json({ "resposta": "A senha deve conter no mínimo 6 caracteres" })
        } else if (email.length < 6) {
            return res.json({ "resposta": "Preencha o campo e-mail coretamente" })
        } else if (nome.length < 2) {
            return res.send({ "resposta": "Preencha o campo nome corretamente" })
        }

        let sql = `select * from usuarios where email = ?`
        let [resultado] = await pool.query(sql, [email])
        if (resultado.length != 0) {
            return res.json({ "resposta": "E-mail já cadastrado" })
        }

        const hash = crypto.createHash("sha256").update(senha).digest("hex")

        sql = `insert into usuarios (nome, email, senha) values (?,?,?)`

        let [resultadoII] = await pool.query(sql, [nome, email, hash])

        if (resultadoII.affectedRows == 1) {
            return res.json({ "resposta": "Cadastro Realizado" })
        } else {
            return res.json({ "resposta": "Erro no Cadastro" })
        }

    } catch (error) {
        console.log(error)
    }
})

server.post("/login", async (req, res) => {
    try {
        const { email } = req.body
        let { senha } = req.body

        senha = senha.trim()

        if (senha == "") {
            return res.json({ "resposta": "Preencha o campo" })
        } else if (senha.length < 6) {
            return res.json({ "resposta": "A senha deve conter no mínimo 6 caracteres" })
        }

        const hash = crypto.createHash("sha256").update(senha).digest("hex")

        const sql = `select * from usuarios where email = ? and senha = ?`
        const [resultado] = await pool.query(sql, [email, hash])

        if (resultado.length > 0) {
            res.json({ "resposta": "Login realizado com sucesso" })
        } else {
            res.json({ "resposta": "Usuário ou senha inválido" })
        }
    } catch (error) {
        console.log(error)
    }
})