<%@page import="controle.ParcelaControle"%>
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
        <title>Salvar Parcela</title>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("nome");
            if(session.isNew() || email == null){
                response.sendRedirect("../index.jsp");
            } else {
                if (session.getAttribute("tipo").equals(2)) {
                    response.sendRedirect("../recepcao/inicial.jsp");
                } else if (session.getAttribute("tipo").equals(3)) {
                    response.sendRedirect("../instrutor/inicial.jsp");
                } else if (session.getAttribute("tipo").equals(4)) {
                    response.sendRedirect("../aluno/inicial.jsp");
                }
                
                double valor = Double.parseDouble(request.getParameter("valor"));
                String id_aluno = request.getParameter("id_aluno");
                int dia_vencimento = Integer.parseInt(request.getParameter("dia_vencimento"));
                int mes_vencimento = Integer.parseInt(request.getParameter("mes_vencimento"));
                int ano_vencimento = Integer.parseInt(request.getParameter("ano_vencimento"));
                int qtdParcela = Integer.parseInt(request.getParameter("qtdParcela"));
                double valorDividido = (valor / qtdParcela);
                ParcelaControle parcela = new ParcelaControle();
                boolean cadastrado = true;
                

                for(int i = 0; i < qtdParcela; i++){
                    
                    if(mes_vencimento == 12){
                        mes_vencimento = 1;
                        ano_vencimento++;
                    } else {
                        mes_vencimento++;
                    }
                    String dataVencimento = ano_vencimento+"-"+mes_vencimento+"-"+dia_vencimento;                   
                    parcela.cadastrar(valorDividido, dataVencimento, Integer.parseInt(id_aluno));                    
                }
                if(cadastrado){
                      
        %>
                    <div class="wrapper fadeInDown">
                        <div id="formContent">
                            <!-- Tabs Titles -->
                            <h2 class="active"> Parcela lançada com sucesso! </h2>
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
                            <h2 class="active"> Erro ao Lançar parcela! </h2>
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
