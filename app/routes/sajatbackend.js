const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  
  var connection
  function dbconn(){
    var mysql = require('mysql')

    connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 's55_db'
    })
    
    connection.connect()
  }
    

  
  
  app.get('/film', (req, res) => {

    dbconn()
      connection.query('SELECT * from film', function (err, rows, fields) {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      
      connection.end()
   })
  
   app.get('/etel', (req, res) => {
    dbconn()
     
     connection.query('SELECT * from etel', function (err, rows, fields) {
       if (err) throw err
     
       console.log(rows)
       res.send(rows)
     })
     
     connection.end()
 
   })

   app.get('/tipus', (req, res) => {
    dbconn()
        connection.query('SELECT * from tipus', function (err, rows, fields) {
          if (err) throw err
        
          console.log(rows)
          res.send(rows)
        })
        
        connection.end()
    
      })

      app.get('/receptek', (req, res) => {
        dbconn()
         
         connection.query('SELECT * from receptek', function (err, rows, fields) {
           if (err) throw err
         
           console.log(rows)
           res.send(rows)
         })
         
         connection.end()
     
       })

       app.post('/keres', (req, res) => {
        dbconn()
         
         let parancs='SELECT * from etel WHERE etel_nev LIKE "%'+req.body.bevitel1+ '%"'
         connection.query(parancs, function (err, rows, fields) {
           if (err) throw err
         
           console.log(rows)
           res.send(rows)
         })
         
         connection.end()
       })
     
       app.post('/feltoltes', (req, res) => {
        dbconn()
         
         let parancs="INSERT INTO etel  VALUES (NULL, '"+req.body.bevitel1+"',"+req.body.bevitel2+","+req.body.bevitel3+","+req.body.bevitel4+", '"+req.body.bevitel5+"')"
         connection.query(parancs, function (err, rows, fields) {
           if (err)
               console.log(err)
             else
               res.send("Sikeres feltöltés!")
         })
         
         connection.end()
       })


       app.get('/tipus2', (req, res) => {
        dbconn()
         
         connection.query('SELECT * from tipus', function (err, rows, fields) {
           if (err) throw err
         
           console.log(rows)
           res.send(rows)
         })
         
         connection.end()
     
       })

       app.get('/receptek', (req, res) => {
        dbconn()
         
         connection.query('SELECT * from receptek', function (err, rows, fields) {
           if (err) throw err
         
           console.log(rows)
           res.send(rows)
         })
         
         connection.end()
     
       })

       app.post('/Receptfeltoltes', (req, res) => {
        dbconn()
         
         let parancs="INSERT INTO receptek  VALUES (NULL, '"+req.body.bevitel1+"','"+req.body.bevitel2+"','"+req.body.bevitel3+"',"+req.body.bevitel4+", "+req.body.bevitel5+",'"+req.body.bevitel6+"')"
         connection.query(parancs, function (err, rows, fields) {
           if (err)
               console.log(err)
             else
               res.send("Sikeres feltöltés!")
         })
         
         connection.end()
       })

       app.delete('/torles_etel', (req, res) => {
        dbconn()
         
         let parancs="delete from etel where etel_id="+req.body.bevitel1
         connection.query(parancs, function (err, rows, fields) {
           if (err)
               console.log(err)
             else
               res.send("Sikeres törlés!")
         })
         
         connection.end()
       })
       app.delete('/torles_recept', (req, res) => {
        dbconn()
         
         let parancs="delete from receptek where recept_id="+req.body.bevitel1
         connection.query(parancs, function (err, rows, fields) {
           if (err)
               console.log(err)
             else
               res.send("Sikeres törlés!")
         })
         
         connection.end()
       })

};
