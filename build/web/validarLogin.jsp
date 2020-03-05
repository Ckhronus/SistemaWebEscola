<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styles.css" type="text/css">    
        <link rel="stylesheet" href="css/estilos.css" type="text/css">
        <title>Sistema Escola</title>
    </head>
    <body>                    
        <%-- CONTEUDO --%> 
        
        <%
            String usuarioForm = request.getParameter("usuario");
            String senhaForm = request.getParameter("senha");

            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource)contexto.lookup("jdbc/escola");
            Connection conexao = ds.getConnection();

            String sql = "SELECT * FROM usuario WHERE nome = ? AND AES_DECRYPT(senha, 'PSINAEBEOB39URMCN75830XMK0') = ?;";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, usuarioForm);
            comando.setString(2, senhaForm);            
            ResultSet resultado = comando.executeQuery();

            if (resultado.next()){                
                session.setAttribute("nome", resultado.getString("nome"));
                session.setAttribute("tipo", resultado.getInt("tipo"));
                if(resultado.getInt("tipo") == 1){
                    response.sendRedirect("admin/inicial.jsp");
                } else if(resultado.getInt("tipo") == 2){
                    response.sendRedirect("recepcao/inicial.jsp");
                } else if(resultado.getInt("tipo") == 3){
                    response.sendRedirect("instrutor/inicial.jsp");
                } else {
                response.sendRedirect("aluno/inicial.jsp");
                }
            } else {
        %>
            <div class="wrapper fadeInDown">
                        <div id="formContent">
                            <!-- Tabs Titles -->
                            <h2 class="active"> Sistema Web Informa:</h2>

                            <!-- Icon -->
                            <div class="fadeIn first">
                                <h1 style="color: red">Usuário e/ou senha incorretos!</h1>
                                <input type="button" onclick="voltar()" value="Voltar">
                            </div>
                        </div>
                    </div>
            <script>
                
                function voltar(){
                    window.location.href = "index.jsp";
                }
                
            </script>   
        <%
               
            }
            conexao.close();
        %>
    </body>
</html>
