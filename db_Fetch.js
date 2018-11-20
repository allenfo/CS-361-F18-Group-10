var express = require('express');
var router = express.Router();
var sql = require ('mssql');


router.get('/', function(req, res, next) {
    sql.connect(config).then(() => {
        return sql.query`select Project_Type_Desc from Project_Type`
    }).then(result => {
        console.log(result)
        // Pass the DB result to the template
        res.render('newProject', {dropdownVals: result})
    }).catch(err => {
        console.log(err)
    })
});


const config = {
    user: 'sa',
    password: 'password',
    server: 'localhost\\SQLEXPRESS', // You can use 'localhost\\instance' to connect to named instance
    database: 'pcgdb',

    options: {
        encrypt: false // Use this if you're on Windows Azure
    }
};


sql.connect(config).then(() => {
    return sql.query`select Project_Type_Desc from Project_Type`
}).then(result => {
    console.log(result)
}).catch(err => {
    console.log(err)
})



module.exports = router;