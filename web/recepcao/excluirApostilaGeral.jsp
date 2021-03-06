<%@page import="java.sql.ResultSet"%>
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
        <link rel="stylesheet" href="../css/estilos.css">
    </head>
    <body>

        <%

            String email = (String) session.getAttribute("nome");

            if (session.isNew() || email == null) {
                response.sendRedirect("index.jsp");
            } else {
                if (session.getAttribute("tipo").equals(3)) {
                    response.sendRedirect("../instrutor/inicial.jsp");
                } else if (session.getAttribute("tipo").equals(4)) {
                    response.sendRedirect("../aluno/inicial.jsp");
                }

            String id = request.getParameter("id");
            String qtd = request.getParameter("quantidade");
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource)contexto.lookup("jdbc/escola");
            Connection con = ds.getConnection();

            String sql = "DELETE FROM apostila WHERE id = ?;";
            
            PreparedStatement comando = con.prepareStatement(sql);
            comando.setInt(1, Integer.parseInt(id));

            if(comando.executeUpdate() > 0){
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Apostila excluída com sucesso! </h2>
                <br>
                <a href="consultarApostila.jsp">Voltar</a>
            </div>
        </div>
        <%
        }else{
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active" style="color: red;"> Apostila não foi excluído! </h2>
                <br>
                <a href="consultarApostila.jsp">Voltar</a>
            </div>
        </div>
        <%
        }
        con.close();
}

        %>

    </body>
</html>
