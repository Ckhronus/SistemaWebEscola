package controle;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import modelo.Faltas;
import modelo.FaltasDAO;

public class FaltasControle {

    private FaltasDAO faltasDAO;

    public FaltasControle() {
        this.faltasDAO = new FaltasDAO();
    }

    Date mydate = new Date();
    SimpleDateFormat format = new SimpleDateFormat("dd/MM/YYYY");
    String b = format.format(mydate);

    public boolean cadastrar(int faltas, int id_aluno_faltas) {
        //cria um objeto usuario e chama o cadastrar do DAO
        Faltas apost = new Faltas(b, faltas, id_aluno_faltas);
        return faltasDAO.Cadastrar(apost);
    }

    public String[] consultar(String id) {
        //chama o consultar o DAO e descarrega os atributos do objeto usuario 
        //num vetor de String
        Faltas faltas = this.faltasDAO.Consultar(Integer.parseInt(id));
        if (faltas != null) {
            String dados[] = {faltas.getId() + "",
                faltas.getFaltas() + "",
                faltas.getId_aluno_faltas() + ""};
            return dados;
        }
        return null;
    }

    public boolean atualizar(String data, int faltas, int id_usuario_faltas) {
        //cria um objeto usuario e chama o atualizar do DAO)
        Faltas user = new Faltas(data, faltas, id_usuario_faltas);
        return faltasDAO.atualizar(user);
    }

    public boolean excluir(String codigo) {
        //chama o excluir do DAO passando o codigo
        return faltasDAO.excluir(Integer.parseInt(codigo));
    }

    public String[][] consultarFiltro(String filtro) {
        //chama o consultarFiltro do DAO passando o filtro (parte do nome)
        //descarrega o objeto ArrayList numa matriz de String

        ArrayList<Faltas> lista = this.faltasDAO.consultarFiltro(filtro);
        if (lista == null || lista.isEmpty()) {
            return null;
        }

        String dados[][] = new String[lista.size()][4];
        for (int i = 0; i < lista.size(); i++) {
            dados[i][0] = String.valueOf(lista.get(i).getId());
            dados[i][2] = String.valueOf(lista.get(i).getFaltas());
            dados[i][3] = String.valueOf(lista.get(i).getId_aluno_faltas());
        }
        return dados;
    }
}
