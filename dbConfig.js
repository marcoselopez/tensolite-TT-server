require('dotenv').config();

const config = {
  user: process.env.USER,
  password: process.env.PASSWORD,
  server: process.env.SERVER,
  database: process.env.DATABASE,
  options:{
    trustedconnection: false,
    enableArithAbort: true,
    encrypt: false
    //instancename: '<Nombre de instancia>' En caso de que hay alguna instancia.
  }
}

module.exports = config;