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
                    response.sendRedirect("index.jsp");
                } else {
                session.invalidate();
                %>          

                    <div class="wrapper fadeInDown">
                        <div id="formContent">
                            <!-- Tabs Titles -->
                            <h2 class="active"> Sistema Web </h2>

                            <!-- Icon -->
                            <div class="fadeIn first">
                                <h1>Obrigado por utilizar o Sistema Escola</h1>
                                <input type="button" onclick="voltar()" value="Voltar">
                            </div>
                        </div>
                    </div>
                <%

            }
            
            %>
            <script>
                
                function voltar(){
                    window.location.href = "index.jsp";
                }
                
            </script>     
    </body>
</html>

