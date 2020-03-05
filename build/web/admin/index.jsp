<%-- 
    Document   : index
    Created on : 03/11/2019, 15:54:26
    Author     : Ismayk Marques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 String email = (String) session.getAttribute("nome");

            if (session.isNew() || email == null) {
                response.sendRedirect("../index.jsp");

            } else {
                if (session.getAttribute("tipo").equals(1)) {
                    response.sendRedirect("inicial.jsp");
                } else if (session.getAttribute("tipo").equals(3)) {
                    response.sendRedirect("../instrutor/inicial.jsp");
                } else if (session.getAttribute("tipo").equals(4)) {
                    response.sendRedirect("../aluno/inicial.jsp");
                } else {
                    response.sendRedirect("../recepcao/inicial.jsp");
                }
            }
%>