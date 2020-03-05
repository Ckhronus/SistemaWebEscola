package controle;

import java.util.ArrayList;
import modelo.Apostila;
import modelo.ApostilaDAO;

public class ApostilaControle {
	private ApostilaDAO apostDAO;	
	public ApostilaControle(){
	this.apostDAO=new ApostilaDAO();	
	}
	
	public boolean cadastrar(String nome, int quantidade){
		//cria um objeto usuario e chama o cadastrar do DAO
		Apostila apost = new Apostila(nome, quantidade);
		return apostDAO.Cadastrar(apost);
	}
	
	
	public String []consultar (String id){
		//chama o consultar o DAO e descarrega os atributos do objeto usuario 
		//num vetor de String
		Apostila apost = this.apostDAO.Consultar(Integer.parseInt(id));
		if(apost != null){
			String dados[]={apost.getId()+"",
                            apost.getNome(),
                            apost.getQuantidade()+""};
			return dados;
		}
		return null;	
	}
	
	public boolean atualizar(String id, String nome, int quantidade){
		//cria um objeto usuario e chama o atualizar do DAO)
		Apostila user = new Apostila(nome, quantidade);
		return apostDAO.atualizar(user);
	}
	
	public boolean excluir(String codigo){
		//chama o excluir do DAO passando o codigo
		return apostDAO.excluir(Integer.parseInt(codigo));
	}
	
	public String[][]consultarFiltro(String filtro){
		//chama o consultarFiltro do DAO passando o filtro (parte do nome)
		//descarrega o objeto ArrayList numa matriz de String
		
		ArrayList<Apostila> lista=this.apostDAO.consultarFiltro(filtro);
		if(lista==null || lista.isEmpty())
                    return null;
		
		String dados[][]=new String [lista.size()][4];
		for (int i=0; i<lista.size(); i++){
			dados[i][0]=String.valueOf(lista.get(i).getId());
			dados[i][1]=lista.get(i).getNome();
			dados[i][3]=String.valueOf(lista.get(i).getQuantidade());
		}
                return dados;
        }
}
	
	

