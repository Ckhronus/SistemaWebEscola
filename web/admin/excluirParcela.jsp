<%@page import="controle.ParcelaControle"%>
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
                if (session.getAttribute("tipo").equals(2)) {
                    response.sendRedirect("../recepcao/inicial.jsp");
                } else if (session.getAttribute("tipo").equals(3)) {
                    response.sendRedirect("../instrutor/inicial.jsp");
                } else if (session.getAttribute("tipo").equals(4)) {
                    response.sendRedirect("../aluno/inicial.jsp");
                }              

            String idParcela = (String) session.getAttribute("idParcela");
            ParcelaControle parcela = new ParcelaControle();
            parcela.excluir(Integer.parseInt(idParcela));
            response.sendRedirect("listarParcelas.jsp");
            }
            
        %>

    </body>
</html>
