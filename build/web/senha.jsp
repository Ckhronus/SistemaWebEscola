<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Sistema Escola</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilos.css" type="text/css">
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Olá, Seja Bem Vindo(a)! </h2>

                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="img/" id="icon2" alt="User Icon" />
                </div>

                <!-- Login Form -->
                <form method="POST" action="alteraSenha.jsp" autocomplete="off">
                    <input type="text" class="fadeIn second" required="" name="email" placeholder="digite seu email" autocomplete="off">
                    <input type="text" class="fadeIn second" required="" name="novaSenha" placeholder="nova senha" style="-webkit-text-security: square;" autocomplete="off">
                    <input type="text" class="fadeIn second" required="" name="novaSenha2" placeholder="repita a senha" style="-webkit-text-security: square;" autocomplete="off">
                    <input type="submit" class="fadeIn fourth" value="Alterar">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="inicial.jsp">Home</a>
                </div>
            </div>
        </div>


    </body>
</html>
