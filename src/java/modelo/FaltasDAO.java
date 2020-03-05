package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FaltasDAO extends DAO{
	private Faltas faltas;
	
    public boolean Cadastrar(Faltas faltas){
        if(!this.conectar())
            return false;
        
        String insert = "insert into faltas(faltas, data_falta, id_aluno_faltas) values(?,?,?);";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(insert);
            psd.setInt(1, faltas.getFaltas());
            psd.setString(2, faltas.getData());            
            psd.setInt(3, faltas.getId_aluno_faltas());         
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
   
    public boolean atualizar(Faltas faltas){
        if(!this.conectar())
            return false;
        String update = "update faltas set faltas=?, where id=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);            
            psd.setInt(1, faltas.getFaltas());
            psd.setInt(5, faltas.getId());            
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FaltasDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        this.desconectar();
        return true;
    }    
    

    public boolean excluir(int codigo) {
        if (!this.conectar()) {
            return false;
        }
        String delete = "delete from apostila where codigo=?;";
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
        
    public ArrayList<Faltas> consultarFiltro(String filtro) {
        ArrayList<Faltas> listaFaltas = new ArrayList<>();
        if (!this.conectar()) {
            return null; //"Falha na conexão com o banco de dados!";
        }
        try {
            PreparedStatement psd = this.conexao().prepareStatement("Select * from faltas where nome like '%" + filtro + "%'");
            ResultSet rs = psd.executeQuery();
            while (rs.next()) {
                Faltas falta = new Faltas(rs.getString("id_aluno_faltas"),                        
                        rs.getInt("data"),
                        rs.getInt("faltas"));
                listaFaltas.add(falta);
            }
            return listaFaltas;
        } catch (SQLException e) {
            return null;
        } finally {
            this.desconectar();
        }

    }
    
    public Faltas Consultar(int id) {
        
        if (!conectar()) {
            return null;
        }
        
        this.faltas = null;
        String select = "select * from usuario where codigo = ?;";
        try {
            PreparedStatement pst = this.conexao().prepareStatement(select);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                this.faltas = new Faltas(rs.getString("data"),                        
                        rs.getInt("quantidade"),
                        rs.getInt("id_usuario_apostila"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        this.desconectar();
        return this.faltas;
        
    }
	
   
}