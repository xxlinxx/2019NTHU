// var wsUri22 = "ws://127.0.0.1:8000/solar_wss";
var peopleA=512;
var peopleB=0;
var peopleC=1522;
var wsUri = "ws://scube.decade.tw:7777/tnua_class_decade_tw";
var output;

function init() {

    
    output = document.getElementById("output");
    websocket = new WebSocket(wsUri);
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

function onOpen(evt) {
    writeToScreen("CONNECTED");
    doSendInfo("WebSocket rocks");
}

function onClose(evt) {
    writeToScreen("DISCONNECTED");
    init();
    writeToScreen("...RE-CONNECTED");
}

function fullS() {
    if (navigator.userAgent.match(/Android/i)) {
        window.scrollTo(0, 1);
    }
}

function bulbActionByID(idx, v) {

    if (v == 0)
        $('#' + idx).css("background-color", "rgba(255, 255, 0, 0.1)");
    else
        $('#' + idx).css("background-color", "rgba(255, 255, 0, 1)");
}

function onMessage(evt) {

    var data = $.parseJSON(evt.data);
    //    console.log("[WS][][onMessage]" + data.type);
    // RESPONSE: { "ip": "127.0.1.1", "name": "PI_IR_01", "IR": false, "id": 1, "people": 0, "hostnameX": "rpi3_x1" }
    if (data.id == 1) {
        peopleA=data.people;
        $("#pA").html(peopleA);
        if ($("#statusLED_A").css('animation-name') == "G2R_keyframe")
            $("#statusLED_A").css('animation-name', "G2R_keyframe2");
        else
            $("#statusLED_A").css('animation-name', "G2R_keyframe");
    }else if (data.id == 2) {
        peopleB=data.people;
        $("#pB").html(peopleB);
        if ($("#statusLED_B").css('animation-name') == "G2R_keyframe")
            $("#statusLED_B").css('animation-name', "G2R_keyframe2");
        else
            $("#statusLED_B").css('animation-name', "G2R_keyframe");
    }else if (data.id == 3) {
        peopleC=data.people;
        var pci=parseInt(peopleC/5);
        $("#pC").html(pci);
        $("#pB").html(parseInt((pci+peopleA)/2));
        
        if ($("#statusLED_C").css('animation-name') == "G2R_keyframe")
            $("#statusLED_C").css('animation-name', "G2R_keyframe2");
        else
            $("#statusLED_C").css('animation-name', "G2R_keyframe");
    } else if (data.id == 0) {
        if ($("#statusLEDSS").css('animation-name') == "G2R_keyframe")
            $("#statusLEDSS").css('animation-name', "G2R_keyframe2");
        else
            $("#statusLEDSS").css('animation-name', "G2R_keyframe");
    }else {

        if (data.type == "bulbAction") {
            var id_v = data.text.split(':');
            bulbActionByID(id_v[0], id_v[1]);
        }
        
    }
    
    if ($("#statusLEDAll").css('animation-name') == "G2R_keyframe")
            $("#statusLEDAll").css('animation-name', "G2R_keyframe2");
        else
            $("#statusLEDAll").css('animation-name', "G2R_keyframe");
    // writeToScreen('<span style="color: red;">RESPONSE: ' + evt.data + '</span>');
}

function onError(evt) {
    writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data);
}

var clientIP = "x.x.x.x";
$.getJSON('http://api.ipify.org?format=jsonp&callback=?', function (data) {
    // clientIP=JSON.stringify(data, null, 2);
    clientIP = data.ip;

});

// function doSendWS_chgFont(message) {

//     doSendWS("chgFont", message);
// }

function doSendInfo(message) {

    doSendWS("info", message);
}

function doSendWS(type, message) {

    var date = new Date().toLocaleDateString("en-US", {
        "year": "numeric"
        , "month": "numeric"
        , "day": "numeric"
        , "hour": "numeric"
        , "minute": "numeric"
        , "second": "numeric"

    });
    var msg = {
        id: 7213,
        ip: clientIP
        , type: type
        , text: message
        , date: date
    };
    // writeToScreen(JSON.stringify(msg));
    websocket.send(JSON.stringify(msg));
}

function writeToScreen(message) {
    var pre = document.createElement("p");
    pre.style.wordWrap = "break-word";
    pre.innerHTML = message;
    document.getElementById("output").appendChild(pre);
}

$(document).ready(function () {
    $("#statusLED1").click(function () {
        console.log("gf");
    });

    $(".wsbtn").click(function () {
        var msg = "/" + $(this).attr("id");
        // var textAreaValue = $('textarea#TEXT_AREA').val();
        // var thisaddress = thisaddress + textAreaValue;
        doSendWS("ws_cue",msg);
    });

    $('#titleX').click(function () {
        doSend("xlinx");
    });

    $('a[role*="slider"]').mouseup(function (event, ui) {
        var thisaddress = $(this).parent().prev().attr("id");
        var thisaddress = "/" + thisaddress;
        var thisccvalue = $(this).attr("aria-valuenow");
        console.log($(this).parent().val());
        console.log($(this).val());
    });

    $('a[role*="slider"]').touchend(function (event, ui) {
        var thisaddress = $(this).parent().prev().attr("id");
        var thisaddress = "/" + thisaddress;
        var thisccvalue = $(this).attr("aria-valuenow");
        console.log($(this).parent().val());
        console.log($(this).val());
    });
    $('.sliders').change(function(){
        var SliderValue = $(this).val();
    // alert("Slider value = " + SliderValue);
    
    var msg = "/" + $(this).attr("id")+"/"+SliderValue;
    doSendWS("ws_cue",msg);
    console.log("SliderValue--->" +SliderValue);
    });
     
});
function valueChanged(){
    // var SliderValue = $('.sliders').val();
    // // alert("Slider value = " + SliderValue);
    
    // var msg = "/" + $(this).attr("id")+"/"+SliderValue;
    // doSendWS("ws_cue",msg);
    // console.log("SliderValue--->" +SliderValue);
}
window.addEventListener("load", init, false);