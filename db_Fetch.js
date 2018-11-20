var express = require('express');
var router = express.Router();
var sql = require ('mysql');

var pool = mysql.createPool(
{
  connectionLimit: 10,
  host  : 'localhost',
  user  : 'student',
  password: 'default',
  database: 'student'
});

router.get('/', function(req, res, next) 
{
    sql.connect(pool).then(() => {
        return sql.query 'select Name from Banks_Name'
    }).then(result => {
        console.log(result)
        res.render('db_Fetch', {listVals: result})
    }).catch(err => {
        console.log(err)
    })
});



module.exports = router;