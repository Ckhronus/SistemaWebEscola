package modelo;

public class Curso {
    private int id;
    private String nome;
    private int qtd_aulas;

    public Curso(String nome, int qtd_aulas) {
        this.id = id;
        this.nome = nome;
        this.qtd_aulas = qtd_aulas;        
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQtd_aulas() {
        return qtd_aulas;
    }

    public void setQtd_aulas(int qtd_aulas) {
        this.qtd_aulas = qtd_aulas;
    }
    
}
