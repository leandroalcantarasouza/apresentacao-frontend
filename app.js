var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const proxy = require('http-proxy-middleware');

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
console.log("variavel de ambiente uri"+ process.env.BACKEND_URI);
console.log("variavel de ambiente porta"+ process.env.BACKEND_PORT);
var apiProxy = proxy('/api/*', {target: `http://${process.env.BACKEND_URI}:${process.env.BACKEND_PORT}/`});
app.use(apiProxy);

module.exports = app;
