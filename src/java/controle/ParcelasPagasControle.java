package controle;

import java.util.ArrayList;
import modelo.ParcelasPagas;
import modelo.ParcelasPagasDAO;

public class ParcelasPagasControle {
	private ParcelasPagasDAO parcelasPagasDAO;	
	public ParcelasPagasControle(){
	this.parcelasPagasDAO = new ParcelasPagasDAO();	
	}
	
	public boolean cadastrar(int id_parcela, int id_aluno_parcelas_pagas, double valor, String data_pagamento, String vencimento){
		//cria um objeto usuario e chama o cadastrar do DAO
		ParcelasPagas parcelas = new ParcelasPagas(id_parcela, id_aluno_parcelas_pagas, 
                    valor, data_pagamento, vencimento);
		return parcelasPagasDAO.Cadastrar(parcelas);
	}
	
	
	public String []consultar (String id){
		//chama o consultar o DAO e descarrega os atributos do objeto usuario 
		//num vetor de String
		ParcelasPagas parcelas = this.parcelasPagasDAO.Consultar(Integer.parseInt(id));
		if(parcelas != null){
			String dados[]={parcelas.getId()+"",
					        parcelas.getId_aluno_parcela_paga()+"",
					        parcelas.getValor()+"",
					        parcelas.getData_Pagamento()+"",
					        parcelas.getVencimento()+""};
			return dados;
		}
		return null;	
	}
	
	public boolean atualizar(int id_parcela, int id_aluno_parcelas_pagas, double valor, String data_pagamento, String vencimento){
		//cria um objeto usuario e chama o atualizar do DAO)
		ParcelasPagas parcelas = new ParcelasPagas(id_parcela, id_aluno_parcelas_pagas, 
                    valor, data_pagamento, vencimento);
		return parcelasPagasDAO.atualizar(parcelas);
	}
	
	public boolean excluir(String codigo){
		//chama o excluir do DAO passando o codigo
		return parcelasPagasDAO.excluir(Integer.parseInt(codigo));
	}
	
	public String[][]consultarFiltro(String filtro){
		//chama o consultarFiltro do DAO passando o filtro (parte do nome)
		//descarrega o objeto ArrayList numa matriz de String
		
		ArrayList<ParcelasPagas> lista=this.parcelasPagasDAO.consultarFiltro(filtro);
		if(lista==null || lista.isEmpty())
                    return null;
		
		String dados[][]=new String [lista.size()][4];
		for (int i=0; i<lista.size(); i++){
			dados[i][0]=String.valueOf(lista.get(i).getId());
			dados[i][1]=lista.get(i).getId_aluno_parcela_paga()+"";
			dados[i][2]=String.valueOf(lista.get(i).getValor());
			dados[i][3]=String.valueOf(lista.get(i).getData_Pagamento());
                        dados[i][3]=String.valueOf(lista.get(i).getVencimento());
		}
                return dados;
        }
}
	
	

