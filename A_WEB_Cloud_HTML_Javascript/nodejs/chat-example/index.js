

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http, {
  transports: ['websocket'],
  serveClient: false,
  // below are engine.IO options
  pingInterval: 10000,
  pingTimeout: 5000,
  cookie: false
});
var port = process.env.PORT || 7000;

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('reconnect_attempt', () => {
  socket.io.opts.transports = ['polling', 'websocket'];
});

io.on('connection', function(socket){
  socket.on('chat message', function(msg){
    	console.log(msg);
	io.emit('chat message', msg);
  });
});

http.listen(port, function(){
  console.log('listening on *:' + port);
});
