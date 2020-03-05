package controle;

import java.util.ArrayList;
import modelo.Curso;
import modelo.CursoDAO;

public class CursoControle {
	private CursoDAO cursoDAO;	
	public CursoControle(){
	this.cursoDAO = new CursoDAO();	
	}
	
	public boolean cadastrar(String nome, int qtd_aulas){
		//cria um objeto usuario e chama o cadastrar do DAO
		Curso curso = new Curso( nome, qtd_aulas);
		return cursoDAO.cadastrar(curso);
	}
        
        
	
	
	public String []consultar (String id){
		//chama o consultar o DAO e descarrega os atributos do objeto usuario 
		//num vetor de String
		Curso curso = this.cursoDAO.consultar(Integer.parseInt(id));
		if(curso != null){
			String dados[]={curso.getId()+"",
                            curso.getNome(),
                            curso.getQtd_aulas()+""};
			return dados;
		}
		return null;	
	}
	
	public boolean atualizar(String id, String nome, int qtd_aulas, boolean finalizado ,int id_aluno_aula){
		//cria um objeto usuario e chama o atualizar do DAO)
		Curso curso = new Curso(nome, qtd_aulas);
		return cursoDAO.atualizar(curso);
	}
	
	public boolean excluir(String codigo){
		//chama o excluir do DAO passando o codigo
		return cursoDAO.excluir(Integer.parseInt(codigo));
	}
	
	public String[][]consultarFiltro(String filtro){
		//chama o consultarFiltro do DAO passando o filtro (parte do nome)
		//descarrega o objeto ArrayList numa matriz de String
		
		ArrayList<Curso> lista=this.cursoDAO.consultarFiltro(filtro);
		if(lista==null || lista.isEmpty())
                    return null;
		
		String dados[][]=new String [lista.size()][4];
		for (int i=0; i<lista.size(); i++){
			dados[i][0]=String.valueOf(lista.get(i).getId());
			dados[i][1]=lista.get(i).getNome();
		}
                return dados;
        }
}
	
	

