// -----  REQUIRE  -----
const express = require('express');


// -----  INIT  -----
const app = express();
const PORT = 42069;


// -----  MIDDLEWARE  -----
app.use((req, res, next) => {
	console.log(req.method + ' ' + req.path + ' ' + req.ip);
  next();
});
app.use(express.urlencoded({extended: true}));
app.use(express.json());
app.use(express.static(__dirname + '/public'));


// -----  ROUTE  -----
app.get('/', (req, res) => {
	res.send("YOU ARE HOME");
});


// -----  LISTEN  -----

// --- Error Handler ---
// app.use(function (err, req, res, next) {
//   console.error(err.stack)
//   res.status(500).send('Something broke!')
// });

app.listen(PORT, () => {
	console.log("==================== NEW SCRIPTS RUN =====================");
	console.log("THE SERVER STARTS AT PORT: ", PORT);
});
