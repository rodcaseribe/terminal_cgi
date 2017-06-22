#!/bin/bash

read POST
#IP=$(echo $POST | cut -d '&' -f 1 | cut -d '=' -f 2)
IP=$(echo $POST | cut -d '&' -f 1 | cut -d '=' -f 2 | sed 's/+/ /g')
decoded=$(printf '%b' "${IP//%/\\x}")
echo 'Content-type: text/html ; charset=iso-8859-1'
echo
echo  -e '<html><head><link rel=stylesheet href=http://10.0.0.2/~rcasemiro/css2.css ><link href=https://fonts.googleapis.com/css?family=Lato rel=stylesheet> </head>
<body style=background-color:#26C281>'
echo "<img id=imagem align=right src=http://www.unicep.edu.br/img/logounicepgrande.png></img><div align=center><h1><font color=#798686>Kerberos <br> Terminal</font></h1></div>"
echo -e '
<form method="POST" align=left>
<p>root@kerberos:<input id=myInp type="text" name="ip"></p>
<input type="hidden" name="submit" value="Enviar">
</form>
'
echo '<pre><font color=#ffff00>'
$decoded
echo '</pre></font>'
echo '
</body>
</html>
'
