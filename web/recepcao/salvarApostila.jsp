<%@page import="java.sql.ResultSet"%>
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
                if (session.getAttribute("tipo").equals(3)) {
                      response.sendRedirect("../instrutor/inicial.jsp");
                  } else if (session.getAttribute("tipo").equals(4)) {
                      response.sendRedirect("../aluno/inicial.jsp");
                  }
                
                String nome = request.getParameter("nome");
                String qtdApostila = request.getParameter("quantidade");
                
                
                InitialContext contexto = new InitialContext();
                DataSource ds = (DataSource) contexto.lookup("jdbc/escola");
                Connection con = ds.getConnection();
                String sql = "SELECT * FROM apostila WHERE nome = ?";
                PreparedStatement comando = con.prepareStatement(sql);
                comando.setString(1, nome);
                ResultSet res = comando.executeQuery();
                
                if(res.next()){
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Apostila já cadastrada! </h2>
                <br>
                <a href="incluirApostila.jsp">Voltar</a>
            </div>
        </div>
        <%
} else {
                
                
                ApostilaControle apostila = new ApostilaControle();                
                if(apostila.cadastrar(nome, Integer.parseInt(qtdApostila))){
                    
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
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
                <h3>A Apostila não pode ser cadastrada!</h3>

                <div id="formFooter">
                    <a href="incluirApostila.jsp">Voltar</a>
                </div>
            </div>
        </div>
        <%
    }
}
}
        %>   
    </body>
</html>
