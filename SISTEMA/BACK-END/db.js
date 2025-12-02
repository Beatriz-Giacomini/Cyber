const mysql = require('mysql2/promise')

// POOL DE CONEXÃO
const pool = mysql.createPool({
    host:"localhost",
    user:"root",
    password:"",
    port:3306,
    database:"banco_projeto",
    waitForConnections:true,
    connectionLimit:10, 
    queueLimit:0    
})

module.exports = pool