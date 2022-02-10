const express = require('express');
const app = express();
const router = express.Router();
const bodyParser = require('body-parser');
const cors = require('cors');
const developers = require('./developers');
let Developer = require('./developerSchema');
require('dotenv').config();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
  res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
  next();
});

app.listen(process.env.PORT, () => {
  console.log(`Estamos escuchando en el puerto ${process.env.PORT}`)
})

app.use('/api', router);

//Ruta que devuelve todos los developers
router.route('/developers').get((req, res) => {
  developers.getDevelopers().then(result => {
    res.json(result)
  })
})

//Ruta que devuelve un developer por su ID
router.route('/developers/:id').get((req, res) => {
  developers.getDeveloperFromID(req.params.id).then(result => {
    res.json(result)
  })
})

//Ruta para agregar un nuevo developer
router.route('/developers/add').post((req, res) => {
  let developer = { ...req.body }
  developers.insertDeveloper(developer).then(result => {
    res.json(result)
  })
})

//Ruta para editar un developer
router.route('/developers/edit').post((req, res) => {
  let developer = { ...req.body }
  developers.editDeveloper(developer).then(result => {
    res.json(result)
  })
})

//Ruta para eliminar un developer
router.route('/developers/delete/:id').post((req, res) => {
  developers.deleteDeveloper(req.params.id).then(result => {
    res.json(result)
  })
})

