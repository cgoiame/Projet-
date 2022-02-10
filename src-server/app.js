const createError = require('http-errors');
const express = require('express');
const path = require('path');
const logger = require('morgan');
const DB = require('./db');
const apiPosts = require('./routes/api/posts');

module.exports = async () => {
  const app = express();

  // view engine setup
  app.set('views', path.join(__dirname, 'views'));
  app.set('view engine', 'ejs');

  app.use(logger('dev'));
  app.use(express.json());
  app.use(express.urlencoded({ extended: false }));

  const { db } = await DB();
  app.set('db', db);

  app.use(express.static(path.join(__dirname, '../public')));

  // Enable CORS
  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
    res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS');
    next();
  });

  app.get('/', (req, res) => res.json({ status: 'ok' }));
  app.use('/api', apiPosts(app));

  // catch 404 and forward to error handler
  app.use((req, res, next) => {
    next(createError(404));
  });

  // error handler
  app.use((err, req, res) => {
    // send the error response
    res.status(err.status || 500);
    if (err.status === 401) res.send('<!DOCTYPE html><html><head><meta http-equiv="refresh" content="0; url=/auth"></head></html>');
    else res.send(err.message);
  });

  return app;
};
