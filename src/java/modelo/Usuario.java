package modelo;

public class Usuario {

    private int id, tipo;
    private String nome, Email, senha;

    public Usuario(String nome, String email, String senha, int tipo) {
        this.nome = nome;
        this.Email = email;
        this.senha = senha;
        this.tipo = tipo;
    }
    
    public Usuario(String senha, String email) {
        this.Email = email;
        this.senha = senha;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getEmail() {
        return Email;
    }    

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
}
