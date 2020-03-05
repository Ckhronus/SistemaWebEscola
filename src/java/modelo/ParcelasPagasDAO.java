package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ParcelasPagasDAO extends DAO{
	private ParcelasPagas parcelasPag;
	
    public boolean Cadastrar(ParcelasPagas parcelasPag){
        if(!this.conectar())
            return false;
        
        String insert = "insert into parcelas_pagas(id_parcela, id_aluno, valor, data_pagamento, data_vencimento) values (?,?,?,?,?);";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(insert);
            psd.setInt(1, parcelasPag.getId_parcela());
            psd.setInt(2, parcelasPag.getId_aluno_parcela_paga());
            psd.setDouble(3, parcelasPag.getValor());
            psd.setString(4, parcelasPag.getData_Pagamento());
            psd.setString(5, parcelasPag.getVencimento());            
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelasPagasDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        this.desconectar();
        return true;
    }  
   
    public boolean atualizar(ParcelasPagas parcelasPagas){
        if(!this.conectar())
            return false;
        String update = "update parcelas_pagas set nome=?, liberado=?, id_aluno_apostila=?, quantidade=?, where id=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);            
            psd.setInt(1, parcelasPagas.getId_aluno_parcela_paga());
            psd.setDouble(2, parcelasPagas.getValor());
            psd.setString(3, parcelasPagas.getData_Pagamento());
            psd.setString(4, parcelasPagas.getVencimento());
            psd.setInt(5, parcelasPagas.getId_parcela());            
            if (psd.executeUpdate() <= 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelasPagasDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        this.desconectar();
        return true;
    }    
    

    public boolean excluir(int codigo) {
        if (!this.conectar()) {
            return false;
        }
        String delete = "delete from parcelas_pagas where codigo=?;";
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
        
    public ArrayList<ParcelasPagas> consultarFiltro(String filtro) {
        ArrayList<ParcelasPagas> listaParcelas = new ArrayList<>();
        if (!this.conectar()) {
            return null; //"Falha na conexão com o banco de dados!";
        }
        try {
            PreparedStatement psd = this.conexao().prepareStatement("Select * from parcelas_pagas where nome like '%" + filtro + "%'");
            ResultSet rs = psd.executeQuery();
            while (rs.next()) {
                ParcelasPagas parcelasPagas = new ParcelasPagas(rs.getInt("id_parcelas"),
                        rs.getInt("id_aluno_parcelas_pagas"),
                        rs.getDouble("valor"),
                        rs.getString("data_pagamento"),
                        rs.getString("vencimento"));
                listaParcelas.add(parcelasPagas);
            }
            return listaParcelas;
        } catch (SQLException e) {
            return null;
        } finally {
            this.desconectar();
        }

    }
    
    public ParcelasPagas Consultar(int id) {
        
        if (!conectar()) {
            return null;
        }
        
        this.parcelasPag = null;
        String select = "select * from parcelas_pagas where codigo = ?;";
        try {
            PreparedStatement pst = this.conexao().prepareStatement(select);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                this.parcelasPag = new ParcelasPagas(rs.getInt("id_parcelas"),
                        rs.getInt("id_aluno_parcelas_pagas"),
                        rs.getDouble("valor"),
                        rs.getString("data_pagamento"),
                        rs.getString("vencimento"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        this.desconectar();
        return this.parcelasPag;
        
    }
	
   
}