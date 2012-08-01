// derived from:
// https://github.com/addyosmani/backbone-boilerplates/blob/master/option2/app.js


var application_root = __dirname,
  express = require("express"),
  path = require("path"),
  jsdom = require('jsdom'),
  request = require('request'),
  mongoose = require('mongoose'),
  connection_string = require('./connection_string');

var app = express.createServer();

// model
mongoose.connect(connection_string);

var Link = mongoose.model('Link', new mongoose.Schema({
  name: String,
  url: String,
  tags: String
}));

var Tag = mongoose.model('Tag', new mongoose.Schema({
  name: String
}));


app.configure(function(){
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(application_root));
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.get('/', function(req, res){
    res.sendfile(__dirname + '/index.html');
});


// *** RESTful API section ***

// Get all

app.get('/api/tags', function(req, res){
  return Tag.find(function(err, data) {
    return res.send(data);
  });
});

app.get('/api/links', function(req, res){
  return Link.find(function(err, data) {
    return res.send(data);
  });
});

// Get by id

app.get('/api/tag/:id', function(req, res){
  return Tag.findById(req.params.id, function(err, tag) {
    if (!err) {
      return res.send(tag);
    }
  });
});

app.get('/api/link/:id', function(req, res){
  return Link.findById(req.params.id, function(err, link) {
    if (!err) {
      return res.send(link);
    }
  });
});

// Save (post)

app.post('/api/tag', function(req, res){
  var tag;
  tag = new Tag({
    name: req.body.name
  });
  tag.save(function(err) {
    if (!err) {
      return console.log("created");
    }
  });
  return res.send(tag);
});

app.post('/api/link', function(req, res){
  var link;

  var nodeio = require('node.io'), options = {timeout: 10, url: req.body.url};
  
  var job = new nodeio.Job(options, {
    input: false,
    run: function () {
      this.getHtml(options.url, function (err, $) {
        var result = $('title').text;

          link = new Link({
            name: result,
            url: req.body.url,
            tags: req.body.tags
          });
          link.save(function(err) {
            if (!err) {
              return console.log("created");
            }
          });
          return res.send(link);
          //this.emit(result);
        });
      }
  });
  job.run();



  //console.log(app.getTitle(req.body.url), 'xxxxxx');
  //console.log('dsdsdsd', app.getTitle(req.body.url) );
  //link = new Link({
  //  //name: app.getTitle(req.body.url),
  //  url: req.body.url,
  //  tags: req.body.tags
  //});
  //link.save(function(err) {
  //  if (!err) {
  //    return console.log("created");
  //  }
  //});
  
});


// TODO: put, delete

//app.put('/api/todos/:id', function(req, res){
//  return Todo.findById(req.params.id, function(err, todo) {
//    todo.text = req.body.text;
//    todo.done = req.body.done;
//    todo.order = req.body.order;
//    return todo.save(function(err) {
//      if (!err) {
//        console.log("updated");
//      }
//      return res.send(todo);
//    });
//  });
//});
//




app.listen(3000);