<%@page import="java.sql.ResultSet"%>
<%@page import="controle.ParcelasPagasControle"%>
<%@page import="controle.ParcelaControle"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Salvar Parcela Paga</title>
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

                 
                 String data = request.getParameter("data");
                 String vencimento = request.getParameter("vencimento");
                 String idParcela = request.getParameter("idParcela");
                 String valor = request.getParameter("valor");
                 boolean pago = true;
                 


                ParcelaControle parcela = new ParcelaControle();
                 if(parcela.atualizar(data, Integer.parseInt(idParcela))){
                %>

                <div class="wrapper fadeInDown">
                    <div id="formContent">
                        <!-- Tabs Titles -->
                        <h2 class="active"> Parcela paga com sucesso! </h2>
                        <br>
                        <a href="listarParcelas.jsp">Voltar</a>
                    </div>
                </div>

                <%
                    } else{
                %>
                <div class="wrapper fadeInDown">
                    <div id="formContent">
                        <!-- Tabs Titles -->

                <%
                     out.println("ID da Parcela: "+idParcela+" <br>Pago: "+
                      pago+" <br>Valor: "+
                      valor+" <br>Data Lançamento: "+
                      vencimento+" <br>Data do Pagamento: "+
                      data);
                %>
                <h2 class="active"> Erro ao pagar parcela! </h2>
                <br>
                <a href="listarParcelas.jsp">Voltar</a>
            </div>
        </div>
        <%
        }
}
        %>
    </body>
</html>
