<%@page import="java.sql.ResultSet"%>
<%@page import="controle.UsuarioControle"%>
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
                
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                String aux = request.getParameter("tipo");
                int tipo;

                if(aux.equals("aluno")){
                    tipo = 4;
                } else if(aux.equals("instrutor")){
                    tipo = 3;
                }else if(aux.equals("administrador")){
                    tipo = 2;
                } else {
                    tipo = 1;
                }
                
                String emailUsuario = request.getParameter("email");
                InitialContext contexto = new InitialContext();
                DataSource ds = (DataSource) contexto.lookup("jdbc/escola");
                Connection con = ds.getConnection();
                String sql = "SELECT * FROM usuario WHERE email = ?";
                PreparedStatement comando = con.prepareStatement(sql);
                comando.setString(1, emailUsuario);
                ResultSet res = comando.executeQuery();
                
                if(res.next()){
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <img alt="atencao" src="../images/icons/atencao.png" style="max-height: 60px; max-width: 60px;">
                <br>
                <h2 class="active" style="color: red; margin: 0px"> Usuário já cadastrado! </h2>
                <br>
                <a href="listarUsuario.jsp">Voltar</a>
            </div>
        </div>
        <%
} else {
    UsuarioControle usuario = new UsuarioControle();
if(usuario.cadastrar(nome, email, senha, tipo)){
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Usuário cadastrado com sucesso! </h2>
                <br>
                <a href="incluirUsuario.jsp">Voltar</a>
            </div>
        </div>

        <%
            
    } else{
        %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <img alt="atencao" src="../images/icons/atencao.png" style="max-height: 60px; max-width: 60px;">
                <br>
                <h2 class="active" style="color: red; margin: 0px"> Usuário não cadastrado! </h2>
                <br>
                <a href="listarUsuario.jsp">Voltar</a>
            </div>
        </div>
        <%
        }
    }                
}        
        %>   
    </body>
</html>
