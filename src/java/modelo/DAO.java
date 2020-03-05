package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DAO {
    private Connection conexao;
    private String user, password;
    private String driver;
    private String URL;

    public DAO(){
            this.URL="jdbc:mysql://localhost:3306/escola";
            this.user="root";
            this.password="";
            this.driver="com.mysql.jdbc.Driver";
    }
    public boolean conectar(){
        /*
        try{
            Class.forName(this.driver);
        } catch(ClassNotFoundException e){ 
            return false;
        }

        */
        try{            
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource)contexto.lookup("jdbc/escola");
            this.conexao = ds.getConnection();

           // this.conexao=DriverManager.getConnection(this.URL, this.user, this.password);
        }catch(Exception e){
            return false;
        }
        return true;
    }
    public Connection conexao(){
        return this.conexao;
    }
    public void desconectar(){
        try{
            this.conexao.close();
        }catch(SQLException e){ }
    }
}
