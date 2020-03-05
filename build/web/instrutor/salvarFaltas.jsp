<%@page import="controle.FaltasControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Salvar Faltas</title>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("nome");

            if(session.isNew() || email == null){
                response.sendRedirect("../index.jsp");

            } else {
                  if (session.getAttribute("tipo").equals(2)) {
                     response.sendRedirect("../recepcao/inicial.jsp");
                  } else if (session.getAttribute("tipo").equals(4)) {
                      response.sendRedirect("../aluno/inicial.jsp");
                  }
                
                             
                int matricula = Integer.parseInt(request.getParameter("matricula"));
                int faltas = Integer.parseInt(request.getParameter("faltas"));
                
          
                FaltasControle falta = new FaltasControle();
                if(falta.cadastrar(faltas, matricula)){
                %>
                <div class="wrapper fadeInDown">
                    <div id="formContent">
                        <!-- Tabs Titles -->
                        <h2 class="active"> Faltas lançadas com sucesso! </h2>
                        <br>
                        <a href="lancarFaltas.jsp">Voltar</a>
                    </div>
                </div>

                <%

            } else{
                %>
                <div class="wrapper fadeInDown">
                    <div id="formContent">
                        <!-- Tabs Titles -->
                        <h2 class="active"> Erro ao lançar faltas! </h2>
                        <br>
                        <%
                            out.println("ID do Aluno: "+
                            matricula+" <br>Faltas: "+
                            faltas);
                        %>
                        <br>
                        <a href="lancarFaltas.jsp">Voltar</a>
                    </div>
                </div>
                <%
                }

        }        
        %>   
    </body>
</html>
