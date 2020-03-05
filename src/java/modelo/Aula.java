package modelo;

public class Aula {
    private int id, id_curso, id_aluno_aula;

    public Aula(int id, int id_curso, int id_aluno_aula) {
        this.id = id;
        this.id_curso = id_curso;
        this.id_aluno_aula = id_aluno_aula;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_curso() {
        return id_curso;
    }

    public void setId_curso(int id_curso) {
        this.id_curso = id_curso;
    }

    public int getId_aluno_aula() {
        return id_aluno_aula;
    }

    public void setId_aluno_aula(int id_aluno_aula) {
        this.id_aluno_aula = id_aluno_aula;
    }
    
}
