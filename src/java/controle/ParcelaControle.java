package controle;

import java.util.ArrayList;
import modelo.Parcela;
import modelo.ParcelaDAO;

    public class ParcelaControle {
	private ParcelaDAO parcelaDAO;	
	public ParcelaControle(){
	this.parcelaDAO = new ParcelaDAO();	
	}
	
	public boolean cadastrar(double valor, String vencimento, int id_aluno_parcela){
		//cria um objeto usuario e chama o cadastrar do DAO
		Parcela parcela = new Parcela(valor, vencimento, id_aluno_parcela);
		return parcelaDAO.Cadastrar(parcela);
	}
	
	
	public String []consultar (String id){
		//chama o consultar o DAO e descarrega os atributos do objeto usuario 
		//num vetor de String
		Parcela parcela = this.parcelaDAO.Consultar(Integer.parseInt(id));
		if(parcela != null){
			String dados[]={parcela.getId()+"",
                            parcela.getValor()+"",
                            parcela.getVencimento()+"",
                            parcela.getId_aluno_parcela()+""};
			return dados;
		}
		return null;	
	}
	
	public boolean atualizar(String data_pagamento, int id_aluno_parcela){
            //cria um objeto usuario e chama o atualizar do DAO)
            Parcela parcela = new Parcela(data_pagamento, id_aluno_parcela);
            return parcelaDAO.atualizar(parcela);
	}
	
	public boolean excluir(int codigo){
		//chama o excluir do DAO passando o codigo
		return parcelaDAO.excluir(codigo);
	}
	
	public String[][]consultarFiltro(String filtro){
		//chama o consultarFiltro do DAO passando o filtro (parte do nome)
		//descarrega o objeto ArrayList numa matriz de String
		
		ArrayList<Parcela> lista=this.parcelaDAO.consultarFiltro(filtro);
		if(lista==null || lista.isEmpty())
                    return null;
		
		String dados[][]=new String [lista.size()][6];
		for (int i=0; i<lista.size(); i++){
			dados[i][0]=String.valueOf(lista.get(i).getId());
			dados[i][1]=lista.get(i).getValor()+"";
			dados[i][2]=String.valueOf(lista.get(i).getVencimento());
                        dados[i][3]=String.valueOf(lista.get(i).getId_aluno_parcela());
		}
                return dados;
        }
}
	
	

