<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="controle.ApostilaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="../assets/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <link rel="stylesheet" href="../assets/css/main.css">

        <title>Sistema Escola</title>
    </head>
    <body class="is-preload">

        <%

            String email = (String) session.getAttribute("nome");

            if (session.isNew() || email == null) {
                response.sendRedirect("../index.jsp");

            } else {
                if (session.getAttribute("tipo").equals(2)) {
                    response.sendRedirect("../recepcao/inicial.jsp");
                } else if (session.getAttribute("tipo").equals(4)) {
                    response.sendRedirect("../aluno/inicial.jsp");
                }

        %>
        <div id="content">

            <article class="box post">
                <header>
                    <h1><a href="inicial.jsp">Olá <% out.print(email);%></a></h1>
                </header>
                <div class="info">
                    <span>Social</span>
                    <ul class="stats">
                        <li><a href="#" class="icon fa-comment">16</a></li>
                        <li><a href="#" class="icon fa-heart">32</a></li>
                        <li><a href="#" class="icon fa-twitter">64</a></li>
                        <li><a href="#" class="icon fa-facebook">128</a></li>
                    </ul>
                </div>
                <%               
                String nomeUsuario = request.getParameter("nomeUsuario");
                InitialContext contexto = new InitialContext();
                DataSource ds = (DataSource) contexto.lookup("jdbc/escola");
                Connection con = ds.getConnection();

                String sql = "SELECT f.id, f.faltas, f.data_falta, u.nome, u.id, u.tipo "
                        + "FROM faltas f "
                        + "INNER JOIN usuario u "
                        + "ON f.id_aluno_faltas = u.id "
                        + "WHERE u.tipo = 4;";
                PreparedStatement comando = con.prepareStatement(sql);
                ResultSet res = comando.executeQuery();
                %>

                <div style="background-color: #80bdff; font-weight: bolder;">

                    <table id="minhaTabela" style="border: 1px solid black;">
                        <thead>
                            <tr>
                                <th>ID Aluno</th><th>Aluno</th><th>Faltas</th><th>Data</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                while (res.next()) {
                                    out.println("<tr style='border: solid 1px black;'>");
                                    out.println("<td>" + res.getInt("u.id") + "</td>");
                                    out.println("<td>" + res.getString("u.nome") + "</td>");
                                    out.println("<td>" + res.getInt("f.faltas") + "</td>");
                                    out.println("<td>" + res.getString("f.data_falta") + "</td>");
                                    /*
                                    out.println("<td><a href=excluirUsuario.jsp?id="+ 
                                            res.getInt("id") +"><button type='button' >Excluir</button></a>");
                                    */
                                    out.println("</tr>");
                                }
                                con.close();
                            %>
                        </tbody>
                    </table>
                </div>
        </div>
    </article> 
</div>

<div id="sidebar" style="background-color: #1571E9;">
    <h1 id="logo"><a href="index.jsp" style="background-color: black;">Sistema Escola</a></h1>
    <nav id="nav">
        <ul>
            <li style="background-color: black; font-weight: bold; padding-left: 5px;">Blog da Escola</li>
            <li><a href="../blog/blog.html">Consultar</a></li>
            <li style="background-color: black; font-weight: bold; padding-left: 5px;">Faltas</li>
            <li><a href="lancarFaltas.jsp">Lançar</a></li>
            <li><a href="listarFaltas.jsp">Listar Faltas</a></li>
            <li style="background-color: black; font-weight: bold; padding-left: 5px;">Alunos</li>
            <li><a href="listarAlunos.jsp">Buscar</a></li>
            <li style="background-color: black; font-weight: bold; padding-left: 5px;">Cursos</li>
            <li><a href="listarCurso.jsp">Listar Cursos</a></li>
            <li style="background-color: black; font-weight: bold; padding-left: 5px;">Apostilas</li>
            <li><a href="consultarApostila.jsp">Listar Apostilas</a></li>
        </ul>
    </nav>            

    <section class="box recent-posts">
        <header>
            <h2>Links Úteis</h2>
        </header>
        <ul>
            <li><a href="https://www.facebook.com">Facebook</a></li>
            <li><a href="https://www.instagram.com">Instagram</a></li>
            <li><a href="https://www.twitter.com">Twitter</a></li>
            <li><a href="https://www.gmail.com">Gmail</a></li>
            <li><a href="https://www.youtube.com/">Youtube</a></li>
        </ul>
    </section>
    <section class="box recent-comments">
        <header>
            <h2>Relatórios</h2>
        </header>
        <ul>
            <li><a href="#">Aluno</a></li>
            <li><a href="#">Curso</a></li>
        </ul>
    </section>
    <section class="box calendar">
        <div class="inner">
            <table>
                <caption>July 2014</caption>
                <thead>
                    <tr>
                        <th scope="col" title="Monday">M</th>
                        <th scope="col" title="Tuesday">T</th>
                        <th scope="col" title="Wednesday">W</th>
                        <th scope="col" title="Thursday">T</th>
                        <th scope="col" title="Friday">F</th>
                        <th scope="col" title="Saturday">S</th>
                        <th scope="col" title="Sunday">S</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="4" class="pad"><span>&nbsp;</span></td>
                        <td><span>1</span></td>
                        <td><span>2</span></td>
                        <td><span>3</span></td>
                    </tr>
                    <tr>
                        <td><span>4</span></td>
                        <td><span>5</span></td>
                        <td><a href="#">6</a></td>
                        <td><span>7</span></td>
                        <td><span>8</span></td>
                        <td><span>9</span></td>
                        <td><a href="#">10</a></td>
                    </tr>
                    <tr>
                        <td><span>11</span></td>
                        <td><span>12</span></td>
                        <td><span>13</span></td>
                        <td class="today"><a href="#">14</a></td>
                        <td><span>15</span></td>
                        <td><span>16</span></td>
                        <td><span>17</span></td>
                    </tr>
                    <tr>
                        <td><span>18</span></td>
                        <td><span>19</span></td>
                        <td><span>20</span></td>
                        <td><span>21</span></td>
                        <td><span>22</span></td>
                        <td><a href="#">23</a></td>
                        <td><span>24</span></td>
                    </tr>
                    <tr>
                        <td><a href="#">25</a></td>
                        <td><span>26</span></td>
                        <td><span>27</span></td>
                        <td><span>28</span></td>
                        <td class="pad" colspan="3"><span>&nbsp;</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <ul id="copyright">
        <li><a href="../senha.jsp">Alterar Senha.</a></li>
        <li><a href="../logoff.jsp">Sair</a></li>
        <li>&copy; Sistema Escola.</li>
    </ul>
</div>
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/datatables.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>


<script>
    $(document).ready(function () {
        $('#minhaTabela').DataTable({
            "language": {
                "lengthMenu": "Mostrando _MENU_ registros por página",
                "zeroRecords": "Nada encontrado",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível",
                "infoFiltered": "(filtrado de _MAX_ registros no total)"
            }
        });
    });
</script>
<%           
    }
%>
</body>
</html>

