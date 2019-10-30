
var wsUri = "ws://scube.decade.tw:8888/flora2018";
var output;


function init() {    
    console.log("[init]");
    output = document.getElementById("output");
    // websocket = new WebSocket(wsUri);
    websocket = new WebSocket(wsUri);
//     (wsUri, {
//   protocolVersion: 8,
//   origin: wsUri,
//   rejectUnauthorized: false
// });
     console.log(websocket);
    websocket.onopen = function (evt) {
        onOpen(evt)
    };
    websocket.onclose = function (evt) {
        onClose(evt)
    };
    websocket.onmessage = function (evt) {
        onMessage(evt)
    };
    websocket.onerror = function (evt) {
        onError(evt)
    };
}
function onError(evt) {
    // console.log("ERROR:" + evt.data);
}

function onMessage(evt) {
   console.log("[WS][][onMessage]" + evt.data);
    
}
function onOpen(evt) {
    console.log("CONNECTED");
    console.log("WebSocket rocks");
    websocket.send("[From][Browser]WebSocket rocks");
}

function onClose(evt) {
    
    // init();
    
}
window.addEventListener("load", init, false);