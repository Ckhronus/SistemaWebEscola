<%@page import="controle.ApostilaControle"%>
<%@page import="modelo.DAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sistema Escola</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/estilos.css" type="text/css">
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("nome");
            if(session.isNew() || email == null){
                response.sendRedirect("../index.jsp");
            } else {
                
                String Nome = request.getParameter("nome");
                String qtdApostila = request.getParameter("quantidade");
                ApostilaControle apostila = new ApostilaControle();
                
                
                
                if(apostila.cadastrar(Nome, Integer.parseInt(qtdApostila))){
                    
                    %>
                        <div class="wrapper fadeInDown">
                            <div id="formContent">

                                <h2 class="active"> Olá, <% out.print(email);%>! </h2>
                                <h3>Apostila salva com sucesso!</h3>

                                <div id="formFooter">
                                    <a href="incluirApostila.jsp">Voltar</a>
                                </div>
                            </div>
                        </div>
                    <%
                    
                } else{
                    %>
                        <div class="wrapper fadeInDown">
                            <div id="formContent">

                                <h2 class="active"> Olá, <% out.print(email);%>! </h2>
                                <h3>A Apostila não pode ser cadastrada!</h3>

                                <div id="formFooter">
                                    <a href="incluirApostila.jsp">Voltar</a>
                                </div>
                            </div>
                        </div>
                    <%
                }
            }
        %>   
    </body>
</html>
