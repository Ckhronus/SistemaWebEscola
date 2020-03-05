package modelo;


public class Faltas {
	private int id, faltas;	
        private int id_aluno_faltas; 
        private String data = "";
       
        
    public Faltas(String data, int faltas, int id_aluno_faltas) {
        this.data = data;
        this.faltas = faltas;
        this.id_aluno_faltas = id_aluno_faltas;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFaltas() {
        return faltas;
    }

    public void setFaltas(int faltas) {
        this.faltas = faltas;
    }

    public int getId_aluno_faltas() {
        return id_aluno_faltas;
    }

    public void setId_aluno_faltas(int id_aluno_faltas) {
        this.id_aluno_faltas = id_aluno_faltas;
    }
    
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

}