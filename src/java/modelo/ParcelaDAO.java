package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ParcelaDAO extends DAO{
	private Parcela parcela;
	
    public boolean Cadastrar(Parcela parcela){
        if(!this.conectar())
            return false;
        
        String insert = "insert into parcela(valor, vencimento, id_aluno_parcela) values (?,?,?);";
        String update2 = "update qtd_parcelas_abertas set total = total + 1;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(insert);
            psd.setDouble(1, parcela.getValor()); 
            psd.setString(2, parcela.getVencimento());
            psd.setInt(3, parcela.getId_aluno_parcela()); 
            
            if (psd.executeUpdate() <= 0) {
                return false;
            } else {
                PreparedStatement psd2 = this.conexao().prepareStatement(update2);
                psd2.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace();           
            return false;
        }
        this.desconectar();
        return true;
    }
    
    public boolean atualizar(Parcela parcela){
        if(!this.conectar())
            return false;
        String update = "update parcela set pago = true, data_pagamento = ? where id = ?;";
        String update2 = "update qtd_parcelas_abertas set total = total - 1;";

        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);
            psd.setString(1, parcela.getData_pagamento());
            psd.setInt(2, parcela.getId());
            if (psd.executeUpdate() <= 0) {
                return false;
            } else {
                PreparedStatement psd2 = this.conexao().prepareStatement(update2);    
                psd2.execute();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelaDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        this.desconectar();
        return true;
    }

    public boolean excluir(int codigo) {
        if (!this.conectar()) {
            return false;
        }
        String delete = "delete from parcela where id = ?;";
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
        
    public ArrayList<Parcela> consultarFiltro(String filtro) {
        ArrayList<Parcela> listaParcela = new ArrayList<>();
        if (!this.conectar()) {
            return null; //"Falha na conexão com o banco de dados!";
        }
        try {
            PreparedStatement psd = this.conexao().prepareStatement("Select * from parcela where nome like '%" + filtro + "%'");
            ResultSet rs = psd.executeQuery();
            while (rs.next()) {
                Parcela parcela = new Parcela(rs.getDouble("valor"),
                        rs.getString("vencimento"),
                        rs.getInt("id_aluno_parcela"));
                listaParcela.add(parcela);
            }
            return listaParcela;
        } catch (SQLException e) {
            return null;
        } finally {
            this.desconectar();
        }

    }
    
    public Parcela Consultar(int id) {
        
        if (!conectar()) {
            return null;
        }
        
        this.parcela = null;
        String select = "select * from usuario where codigo = ?;";
        try {
            PreparedStatement pst = this.conexao().prepareStatement(select);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                this.parcela = new Parcela(rs.getDouble("valor"),
                        rs.getString("vencimento"),
                        rs.getInt("id_aluno_parcela"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        this.desconectar();
        return this.parcela;
        
    }
	
   
}