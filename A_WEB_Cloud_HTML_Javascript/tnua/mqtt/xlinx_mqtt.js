
$(function(){
  // var clientIP = "x.x.x.x";
  // $.getJSON('http://api.ipify.org?format=jsonp&callback=?', function (data) {
  //   // clientIP=JSON.stringify(data, null, 2);
  //   clientIP = data.ip;
  // });
  window.setInterval(timeInterval1000, 1000);
  var MURL='mqtt://newmedia:tnuapassword@broker.shiftr.io';
  // var MURL='mqtt://scube.decade.tw';
  //mosquitto_pub -h broker.shiftr.io -u newmedia -P tnuapassword -t /cloud/aws/ -m "from cloud AWS"
  var client = mqtt.connect(MURL, {
    clientId: 'im_javascript'
  });

  client.on('connect', function(){
    console.log('client has connected!');
  });

  client.on('message', function(topic, message) {
    console.log('new message:', topic, message.toString());
  });

  $('#buttonX').click(function(){
    client.publish('/web/buttonX/', 'from web');
  })
  $('#textareaX').click(function(){
    client.publish('test', '[from web][BTN clicked]');
  })
  function timeInterval1000() {
  var text=$("#textareaX").val();
  console.log("[DEBUG] textareaX="+ text);
  client.publish('/name/YSL/', "textarea="+text);
  // client.publish('/web/heartbeat/'+clientIP, "[from web]"+clientIP);
}
})
