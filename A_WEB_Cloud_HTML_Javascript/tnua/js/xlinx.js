$(document).ready(function() {
	console.log("[E]$(document).ready]");
	window.setInterval(timeInterval1000, 1000);
    // $("#sync1").click(function(){ $(this).css('animation-name') == "G2R_keyframe"; });
window.chartColors = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    blue: 'rgb(54, 162, 235)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(201, 203, 207)'
};

var config = {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: '#A',
            data: [0],
            backgroundColor: window.chartColors.red,
            borderColor: window.chartColors.red,
            fill: false,
            borderWidth: 1
        },
        {
            label: '#B',
            data: [0],
            backgroundColor: window.chartColors.orange,
            borderColor: window.chartColors.orange,
            fill: false,
            borderWidth: 1
        },
        {
            label: '#C',
            data: [0],
            backgroundColor: window.chartColors.blue,
            borderColor: window.chartColors.blue,
            fill: false,
            borderWidth: 1
        }]
    },

    options: {
        elements: {
            line: {
                tension: 0, // disables bezier curves
            }
        },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:false
                    
                }
            }]
        }
    }
};

var configOK=initConfig(config);
var ctx = document.getElementById("myChart").getContext('2d');
window.myLine = new Chart(ctx, configOK);


    // CSV1();
	// parseData(new URL("http://huanglin.decade.tw/CSV/rpt_001312_20170810_00.csv"),doStuff);
});
function initConfig(configx){
    
    for(var i=0;i<29;i++){
        configx.data.labels.push("3/"+(i+1));
        
    }
    for(var dsIndex=0;dsIndex<=2;dsIndex++){
        for(var i=0;i<29;i++){
            if(configx.data.datasets[dsIndex].data[i]==null){
                configx.data.datasets[dsIndex].data.push(0);

            }
        }
    }
    console.log(configx);
    return configx;
}
function doStuff(data) {
    console.log(data);
}

function parseData(url, callBack) {
    Papa.parse(url, {
        download: true,
        dynamicTyping: true,
        complete: function(results) {
            callBack(results.data);
        }
    });
}
window.onload = function() {
            console.log("[window.onload]");
        };
$(function() {
	console.log("[E]$(function)]");
});
$(window).load(function() {
	console.log("[E]$(window).load]");
	
});
function timeInterval1000() {
	// console.log("[INFO][timeInterval1000XXX]");
    // var text=$("#textareaX").val();
    // console.log("[DEBUG] textareaX="+ text);
    // doSendWS("from_mobile",text);
	// $("#output").append(" [T]"+new Date().getMilliseconds());
    // window.ctx.update();
	// $("#sync1").css("animation-name") == "G2R_keyframe";
  // $("#sync1").toggle();
}