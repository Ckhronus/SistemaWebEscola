package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CursoDAO extends DAO{      
    private Curso curso;
    
    public boolean cadastrar(Curso curso){
        if(!this.conectar()) 
            return false;
        
        String insert = "insert into curso(nome, qtd_aulas) values (?,?);";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(insert);
            psd.setString(1, curso.getNome());
            psd.setInt(2, curso.getQtd_aulas()); 
            
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        this.desconectar();
        return true;
    }
    
    public boolean atualizar(Curso curso){
        if (!this.conectar()) {
            return false;
        }
        String update = "update curso set nome=?, qtd_aulas=?, where id=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);            
            psd.setString(1, curso.getNome());
            psd.setInt(2, curso.getQtd_aulas());
            psd.setInt(5, curso.getId());            
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        this.desconectar();
        return true;
    }

    public boolean excluir(int codigo) {
        if (!this.conectar()) {
            return false;
        }
        String delete = "delete from curso where codigo=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(delete);
            psd.setInt(1, codigo);
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        this.desconectar();
        return true;
    }    
    
    
    public Curso consultar(int id) {
        if (!conectar()) {
            return null;
        }
        this.curso = null;
        String select = "select * from usuario where codigo = ?;";
        try {
            PreparedStatement pst = this.conexao().prepareStatement(select);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                this.curso = new Curso(rs.getString("nome"),
                        rs.getInt("qtd_aulas"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        this.desconectar();
        return this.curso;
    }
    
    
    public ArrayList<Curso> consultarFiltro(String filtro) {
        ArrayList<Curso> listaCurso = new ArrayList<Curso>();
        if (!this.conectar()) {
            return null; //"Falha na conexão com o banco de dados!";
        }
        try {
            PreparedStatement psd = this.conexao().prepareStatement("Select * from usuario where nome like '%" + filtro + "%'");
            ResultSet rs = psd.executeQuery();
            while (rs.next()) {
                Curso curso = new Curso(rs.getString("nome"),
                        rs.getInt("qtd_aulas"));
                listaCurso.add(curso);
            }
            return listaCurso;
        } catch (SQLException e) {
            return null;
        } finally {
            this.desconectar();
        }

    }
}
