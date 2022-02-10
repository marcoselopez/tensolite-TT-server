var config = require('./dbConfig');
const sql = require('mssql');

//Obtener el array de Developers
const getDevelopers = async() => {
  try {
    let pool = await sql.connect(config);
    let developers = await pool.request().query("SP_L_DEVELOPER_01");
    return developers.recordsets;
  } catch (error) {
    console.log(error);
  }
}

//Obtener un developer por ID - IMPLEMENTADO PERO NO UTILIZADO
// const getDeveloperFromID = async(id) => {
//   try {
//     let pool = await sql.connect(config);
//     let developers = await pool.request()
//     .input('input_parameter', sql.Int, id)
//     .execute("SP_L_DEVELOPERXID_01");
//     return developers.recordsets;
//   } catch (error) {
//     console.log(error);
//   }
// }

//Agregar un nuevo developer
const insertDeveloper = async(developer) => {
  try {
    let pool = await sql.connect(config);
    let insertDev = await pool.request()
      .input('id', sql.Int, developer.id)
      .input('nombre', sql.VarChar, developer.nombre)
      .input('profesion', sql.VarChar, developer.profesion)
      .input('puesto', sql.VarChar, developer.puesto)
      .input('tecnologia', sql.VarChar, developer.tecnologia)
      .execute("SP_I_DEVELOPER_01");
    return insertDev.recordsets;
  } catch (error) {
    console.log(error)
  }
}

//Editar un developer
const editDeveloper = async(developer) => {
  try {
    let pool = await sql.connect(config);
    let editDev = await pool.request()
      .input('id', sql.Int, developer.id)
      .input('nombre', sql.VarChar, developer.nombre)
      .input('profesion', sql.VarChar, developer.profesion)
      .input('puesto', sql.VarChar, developer.puesto)
      .input('tecnologia', sql.VarChar, developer.tecnologia)
      .execute("SP_U_DEVELOPER_01");
    return editDev.recordsets;
  } catch (error) {
    console.log(error)
  }
}

//Eliminar un developer
const deleteDeveloper = async(id) => {
  try {
    let pool = await sql.connect(config);
    let deleteDev = await pool.request()
      .input('input_parameter', sql.Int, id)
      .query("DELETE FROM TM_DEVELOPERS WHERE ID= @input_parameter");
    return deleteDev.recordsets;
  } catch (error) {
    console.log(error)
  }
}

module.exports = {
  getDevelopers,
  insertDeveloper,
  editDeveloper,
  deleteDeveloper
}