<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.UsuarioControle"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Sistema Escola</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilos.css" type="text/css">
    </head>
    <body>

        <%
            String email = request.getParameter("email");
            String novaSenha = request.getParameter("novaSenha");
            String novaSenha2 = request.getParameter("novaSenha2"); 
    
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/escola");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM usuario WHERE email = ?;";
            PreparedStatement comando = con.prepareStatement(sql);
            comando.setString(1, email);
            ResultSet res = comando.executeQuery();
    
            if(res.next()){
                con.close();
                if(novaSenha.equals(novaSenha2)){
        
                UsuarioControle usuario = new UsuarioControle();
        
                if(usuario.atualizarSenha(novaSenha, email)){
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Senha alterada com sucesso! </h2>
                <br>
                <a href="index.jsp">Voltar</a>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Verifique os dados digitados, erro ao alterar senha! </h2>
                <br>
                <%
                    out.println("Email: "+ email);
                %>
                <br>
                <a href="senha.jsp">Voltar</a>
            </div>
        </div>
        <%  
        }

        
        
        } else {
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Verifique os dados digitados, senhas não confere! </h2>
                <br>
                <a href="senha.jsp">Voltar</a>
            </div>
        </div>
        <%    
        }
        } else {
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Verifique o EMAIL digitado, senha não alterada! </h2>
                <br>
                <a href="senha.jsp">Voltar</a>
            </div>
        </div>
        <% 
        }
            con.close();
    
        %>

    </body>
</html>