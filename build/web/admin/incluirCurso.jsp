<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="../assets/css/main.css" />
        <title>Sistema Escola</title>
    </head>
    <body class="is-preload">

        <%
            
            String email = (String) session.getAttribute("nome");
            
            if(session.isNew() || email == null){
                response.sendRedirect("../index.jsp");
                
            } else {

        %>

        <div id="content">

            <article class="box post post-excerpt">
                <header>
                    <h2><a href="#">Bem vindo(a) ao Sistema Escola</a></h2>
                    <p>Projeto criado para Escola de Cursos Profissionalizantes.</p>
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

                <form method="POST" action="salvarCurso.jsp">
                    <div>
                        <span>Curso</span>
                        <input type="text" name="nome" placeholder="nome do curso" required>
                    </div>
                    <div style="margin: 10px; margin-left: 0px;">
                        <span>Quantidade de Aulas</span><br>
                        <input style="margin-left: 8px;" type="number" min="1" name="quantidade" placeholder="quantidade" required>
                    </div>

                    <button type="submit">Enviar</button>

                </form>                    

            </article> 
        </div>

        <div id="sidebar" style="background-color: #1571E9;">
            <h1 id="logo"><a href=index.jsp style="background-color: black;">Sistema Escola</a></h1>
            <nav id="nav">
                <ul>
                    <li style="background-color: black; font-weight: bold; padding-left: 5px;">Blog da Escola</li>
                    <li><a href="../blog/blog.html">Consultar</a></li>
                    <li style="background-color: black; font-weight: bold; padding-left: 5px;">Parcelas</li>
                    <li><a href="listarParcelas.jsp">Consultar</a></li>
                    <li><a href="incluirParcela.jsp">Gerar Mensalidade</a></li>
                    <li><a href="listarParcelasPagas.jsp">Consultar Parcelas Pagas</a></li>
                    <li style="background-color: black; font-weight: bold; padding-left: 5px;">Usuários</li>
                    <li><a href="incluirUsuario.jsp">Cadastrar</a></li>
                    <li><a href="listarUsuario.jsp">Buscar</a></li>
                    <li style="background-color: black; font-weight: bold; padding-left: 5px;">Alunos</li>
                    <li><a href="listarAlunos.jsp">Listar Alunos</a></li>
                    <li><a href="listarFaltas.jsp">Faltas</a></li>
                    <li><a href="lancarFaltas.jsp">Lançar Falta</a></li>
                    <li style="background-color: black; font-weight: bold; padding-left: 5px;">Cursos</li>
                    <li><a href="incluirCurso.jsp">Cadastrar</a></li>
                    <li><a href="listarCurso.jsp">Buscar</a></li>
                    <li style="background-color: black; font-weight: bold; padding-left: 5px;">Apostilas</li>
                    <li><a href="incluirApostila.jsp">Cadastrar</a></li>
                    <li><a href="consultarApostila.jsp">Buscar</a></li>
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
                    <li><a href="#">Financeiro</a></li>
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
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/browser.min.js"></script>
        <script src="assets/js/breakpoints.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

        <%
            }
        %>

    </body>
</html>
