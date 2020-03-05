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

          <%

              String email = (String) session.getAttribute("nome");

              if(session.isNew() || email == null){

          %>
          <div class="wrapper fadeInDown">
               <div id="formContent">
                    <!-- Tabs Titles -->
                    <h2 class="active"> Seja Bem Vindo(a)! </h2>

                    <!-- Icon -->
                    <div class="fadeIn first">
                         <img src="img/usericon.png" id="icon" alt="User Icon" />
                    </div>

                    <!-- Login Form -->
                    <form method="POST" action="validarLogin.jsp" autocomplete="off">
                         <input type="text" class="fadeIn second" required="" name="usuario" placeholder="usuario" autocomplete="off">
                         <input type="text" class="fadeIn third" required="" name="senha" placeholder="senha" style="-webkit-text-security: square;" autocomplete="off">
                         <input type="submit" class="fadeIn fourth" value="Entrar">
                    </form>

                    <!-- Remind Passowrd
                    <div id="formFooter">
                        <a class="underlineHover" href="#">Esqueci a Senha.</a>
                    </div>
                    -->
               </div>
          </div>
          <%
          } else {

          if (session.getAttribute("tipo").equals(2)) {
                      response.sendRedirect("recepcao/inicial.jsp");
                  } else if (session.getAttribute("tipo").equals(3)) {
                      response.sendRedirect("instrutor/inicial.jsp");
                  } else if (session.getAttribute("tipo").equals(4)) {
                      response.sendRedirect("aluno/inicial.jsp");
                  } else if (session.getAttribute("tipo").equals(1)) {
                      response.sendRedirect("admin/inicial.jsp");
                  } else {
                    session.invalidate();
                    response.sendRedirect("index.jsp");
                  }
      }

          %>

     </body>
</html>
