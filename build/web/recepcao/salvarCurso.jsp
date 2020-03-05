<%@page import="java.sql.ResultSet"%>
<%@page import="controle.CursoControle"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Salvar Usuário</title>
    </head>
    <body>
        <%
            String nome2 = (String) session.getAttribute("nome");
            if(session.isNew() || nome2 == null){
                response.sendRedirect("../index.jsp");
            } else { 
                
                if (session.getAttribute("tipo").equals(3)) {
                      response.sendRedirect("../instrutor/inicial.jsp");
                  } else if (session.getAttribute("tipo").equals(4)) {
                      response.sendRedirect("../aluno/inicial.jsp");
                  }
                
                String nome = request.getParameter("nome");
                String quantidade = request.getParameter("quantidade");
                InitialContext contexto = new InitialContext();
                DataSource ds = (DataSource) contexto.lookup("jdbc/escola");
                Connection con = ds.getConnection();
                String sql = "SELECT * FROM curso WHERE nome = ?;";
                PreparedStatement comando = con.prepareStatement(sql);
                comando.setString(1, nome);
                ResultSet res = comando.executeQuery();
                
                if(res.next()){
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Curso já cadastrado! </h2>
                <br>
                <a href="listarCurso.jsp">Voltar</a>
            </div>
        </div>
        <%
} else {
    CursoControle curso = new CursoControle();
if(curso.cadastrar(nome, Integer.parseInt(quantidade))){
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Curso cadastrado com sucesso! </h2>
                <br>
                <a href="listarCurso.jsp">Voltar</a>
            </div>
        </div>

        <%
            
    } else{
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Usuário não cadastrado! </h2>
                <br>
                <a href="listarCurso.jsp">Voltar</a>
            </div>
        </div>
        <%
        }
    }                
}        
        %>   
    </body>
</html>
