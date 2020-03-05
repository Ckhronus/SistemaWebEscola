package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AulaDAO extends DAO{  
    
    private Aula aula;
    
    public boolean cadastrar(Aula aula){
        if(!this.conectar()) 
            return false;
        String insert = "insert into curso values (?,?,?);";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(insert);
            psd.setInt(1, aula.getId());
            psd.setInt(2, aula.getId_curso());
            psd.setInt(3, aula.getId_aluno_aula());                       
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
    
    public boolean atualizar(Aula aula){
        if (!this.conectar()) {
            return false;
        }
        String update = "update curso set id_curso=?, id_aluno_aula=?, where id=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);            
            psd.setInt(1, aula.getId_curso());
            psd.setInt(2, aula.getId_aluno_aula());
            psd.setInt(3, aula.getId());            
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
        String delete = "delete from aula where codigo=?;";
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
    
    
    public Aula consultar(int id) {
        if (!conectar()) {
            return null;
        }
        this.aula = null;
        String select = "select * from usuario where codigo = ?;";
        try {
            PreparedStatement pst = this.conexao().prepareStatement(select);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                this.aula = new Aula(id,
                        rs.getInt("id_curso"),
                        rs.getInt("id_aluno_aula"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        this.desconectar();
        return this.aula;
    }
    
    
    public ArrayList<Aula> consultarFiltro(String filtro) {
        ArrayList<Aula> listaCurso = new ArrayList<Aula>();
        if (!this.conectar()) {
            return null; //"Falha na conexão com o banco de dados!";
        }
        try {
            PreparedStatement psd = this.conexao().prepareStatement("Select * from usuario where nome like '%" + filtro + "%'");
            ResultSet rs = psd.executeQuery();
            while (rs.next()) {
                Aula aula = new Aula(rs.getInt("id"),
                        rs.getInt("id_curso"),
                        rs.getInt("id_aluno_aula"));
                listaCurso.add(aula);
            }
            return listaCurso;
        } catch (SQLException e) {
            return null;
        } finally {
            this.desconectar();
        }

    }
}
