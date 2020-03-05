package controle;

import java.util.ArrayList;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class UsuarioControle {
	private UsuarioDAO userDAO;
	
	public UsuarioControle(){
	this.userDAO=new UsuarioDAO();	
	}
	
	public boolean cadastrar(String nome, String email, String senha, 
			int tipo){
            //cria um objeto usuario e chama o cadastrar do DAO
            Usuario user = new Usuario(nome, email, senha, 
			tipo);
            return userDAO.cadastrar(user);
	}
	
	public String []consultar (String id){
		//chama o consultar o DAO e descarrega os atributos do objeto usuario 
		//num vetor de String
		Usuario user = this.userDAO.consultar(Integer.parseInt(id));
		if(user != null){
			String dados[]={user.getId()+"",
                            user.getNome(),
                                user.getEmail(),
                                user.getSenha(),
                                user.getTipo()+""};
			return dados;
		}
		return null;	
	}
	
	public boolean atualizar(String nome, String email, String senha, 
		       int tipo){
		//cria um objeto usuario e chama o atualizar do DAO)
		Usuario user = new Usuario(nome, email, senha, 
			              tipo);
		return userDAO.atualizar(user);
	}
        
        public boolean atualizarSenha(String senha, String email){
		//cria um objeto usuario e chama o atualizar do DAO)
		Usuario user = new Usuario(senha, email);
		return userDAO.atualizarSenha(user);
	}
	
	public boolean excluir(String codigo){
		//chama o excluir do DAO passando o codigo
		return userDAO.excluir(Integer.parseInt(codigo));
	}
	
	public String[][]consultarFiltro(String filtro){
		//chama o consultarFiltro do DAO passando o filtro (parte do nome)
		//descarrega o objeto ArrayList numa matriz de String
		
		ArrayList<Usuario> lista=this.userDAO.consultarFiltro(filtro);
		if(lista==null || lista.isEmpty())
                    return null;
		
		String dados[][]=new String [lista.size()][4];
		for (int i=0; i<lista.size(); i++){
			dados[i][0]=String.valueOf(lista.get(i).getId());
			dados[i][1]=lista.get(i).getNome();
			dados[i][2]=String.valueOf(lista.get(i).getSenha());
			dados[i][3]=String.valueOf(lista.get(i).getTipo());
		}
                return dados;
        }
}
	
	

