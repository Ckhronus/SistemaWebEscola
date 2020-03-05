package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ApostilaDAO extends DAO{
	private Apostila apostila;
	
    public boolean Cadastrar(Apostila apost){
        if(!this.conectar())
            return false;
        
        String insert = "insert into apostila(nome, quantidade) values (?,?);";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(insert);
            psd.setString(1, apost.getNome());
            psd.setInt(2, apost.getQuantidade());            
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApostilaDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        this.desconectar();
        return true;
    }  
   
    public boolean atualizar(Apostila apost){
        if(!this.conectar())
            return false;
        String update = "update apostila set nome=?, quantidade=?, where id=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);            
            psd.setString(1, apost.getNome());
            psd.setInt(2, apost.getQuantidade());
            psd.setInt(3, apost.getId());            
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApostilaDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        
    public ArrayList<Apostila> consultarFiltro(String filtro) {
        ArrayList<Apostila> listaApostilas = new ArrayList<>();
        if (!this.conectar()) {
            return null; //"Falha na conexão com o banco de dados!";
        }
        try {
            PreparedStatement psd = this.conexao().prepareStatement("Select * from apostila where nome like '%" + filtro + "%'");
            ResultSet rs = psd.executeQuery();
            while (rs.next()) {
                Apostila apost = new Apostila(rs.getString("nome"),
                        rs.getInt("quantidade"));
                listaApostilas.add(apost);
            }
            return listaApostilas;
        } catch (SQLException e) {
            return null;
        } finally {
            this.desconectar();
        }

    }
    
    public Apostila Consultar(int id) {
        
        if (!conectar()) {
            return null;
        }
        
        this.apostila = null;
        String select = "select * from usuario where codigo = ?;";
        try {
            PreparedStatement pst = this.conexao().prepareStatement(select);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                this.apostila = new Apostila(rs.getString("nome"),
                        rs.getInt("quantidade"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        this.desconectar();
        return this.apostila;
        
    }
	
   
}