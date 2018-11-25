var express = require(`express`);
var app = express();
var bodyParser = require('body-parser');
var mysql = require('./dbcon.js');


// APP CONFIG
//app.set('port', 3000);
app.set('view engine', 'ejs');
app.use(express.static("public"));
app.use(bodyParser.urlencoded({extended: true}));
app.set('port', process.argv[2]);

// HOME
app.get('/', function(req, res, next){
	res.render('home');
});

// Actions
app.get('/actions', function(req, res, next){
	mysql.pool.query("SELECT * FROM Banks_Name", function(err, rows, fields){
	 		if(err) throw err;
	res.render('actions', {context: rows});
	});
});

//Information
app.get('/information', function(req, res, next){
	mysql.pool.query("SELECT * FROM fin_people", function(err, rows, fields){
	 		if(err) throw err;
	res.render('information', {context: rows});
	});
});

// Monthly
app.get('/month', function(req, res, next){
	mysql.pool.query("SELECT * FROM Months", function(err, rows, fields){
	 		if(err) throw err;
	res.render('month', {context: rows});
	});
});

// EDIT Note
app.get('/editNote/:month', function(req, res, next){
	mysql.pool.query("SELECT * FROM Months WHERE month = ' "+req.params.month+"'", function(err, rows, fields){
		if(err) throw err;
		res.render('editNote', { context: rows });
	});
});

// UPDATE Note 
app.post('/updateNote/:note', function(req, res, next){
	mysql.pool.query("UPDATE review SET note=? WHERE month=' "+req.params.month+" '", 
	[req.body.score, req.body.description], function(err, results){
		if(err) throw err;
		return res.redirect('/review');
	});
});


// Login
app.get('/login', function(req, res, next){
	res.render('login');
});

// About
app.get('/about', function(req, res, next){
	res.render('about');
});


app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on flip3.engr.oregonstate.edu:' + app.get('port') + '; press Ctrl-C to terminate.');
});