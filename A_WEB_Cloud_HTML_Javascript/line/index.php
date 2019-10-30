<html>
<head>
    <title>連結到LineNotify</title>
	<meta charset="big-5" />
    <script>
        function oAuth_DECADE() {
            var URL = 'https://notify-bot.line.me/oauth/authorize?';
            URL += 'response_type=code';
            URL += '&client_id=WU8x2vY7asKW0d5u9acVdS';
            URL += '&redirect_uri=http://flora2018.decade.tw/line/index.php';
            URL += '&scope=notify';
            URL += '&state=abcde';
            window.location.href = URL;
        }
    </script>
</head>
<body>
    <button onclick="oAuth_DECADE();">連結到LineNotify按鈕</button>
</body>
</html>