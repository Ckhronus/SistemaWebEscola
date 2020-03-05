package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDAO extends DAO {

    private Usuario usuario;
    
    

    public boolean cadastrar(Usuario user) {
        if (!this.conectar()) {
            return false;
        }

        String insert = "insert into usuario(nome, email, senha, tipo) values (?,?,AES_ENCRYPT(?, 'PSINAEBEOB39URMCN75830XMK0'),?);";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(insert);
            psd.setString(1, user.getNome());
            psd.setString(2, user.getEmail());
            psd.setString(3, user.getSenha());
            psd.setInt(4, user.getTipo());
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

    public Usuario consultar(int id) {
        if (!conectar()) {
            return null;
        }
        this.usuario = null;
        String select = "select * from usuario where codigo = ?;";
        try {
            PreparedStatement pst = this.conexao().prepareStatement(select);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                this.usuario = new Usuario(rs.getString("nome"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getInt("tipo"));
            }
            this.desconectar();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        this.desconectar();
        return this.usuario;
    }
    
    

    public boolean atualizar(Usuario user) {
        if (!this.conectar()) {
            return false;
        }
        String update = "update usuario set nome=?, email=?, senha=?, tipo=?, where id=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);
            psd.setString(1, user.getNome());
            psd.setString(2, user.getEmail());
            psd.setString(3, user.getSenha());
            psd.setInt(4, user.getTipo());
            psd.setInt(5, user.getId());
            if (psd.executeUpdate() <= 0) {
                return false;
            }
            this.desconectar();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        this.desconectar();
        return true;
    }

    public boolean atualizarSenha(Usuario user) {
        if (!this.conectar()) {
            return false;
        }
        String update = "UPDATE usuario SET senha = AES_ENCRYPT(?, 'PSINAEBEOB39URMCN75830XMK0') WHERE email = ?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(update);
            psd.setString(1, user.getSenha());
            psd.setString(2, user.getEmail());
            
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
        String delete = "delete from usuario where codigo=?;";
        try {
            PreparedStatement psd = this.conexao().prepareStatement(delete);
            psd.setInt(1, codigo);
            if (psd.executeUpdate() <= 0) {
                return false;
            }
            this.desconectar();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        this.desconectar();
        return true;
    }

    public ArrayList<Usuario> consultarFiltro(String filtro) {
        ArrayList<Usuario> listaClientes = new ArrayList<>();
        if (!this.conectar()) {
            return null; //"Falha na conexão com o banco de dados!";
        }
        try {
            PreparedStatement psd = this.conexao().prepareStatement("Select * from usuario where nome like '%" + filtro + "%'");
            ResultSet rs = psd.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario(rs.getString("nome"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getInt("tipo"));
                listaClientes.add(user);
            }
            this.desconectar();
            return listaClientes;
        } catch (SQLException e) {
            return null;
        } finally {
            this.desconectar();
        }

    }

}
