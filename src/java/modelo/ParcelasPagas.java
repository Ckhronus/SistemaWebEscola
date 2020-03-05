package modelo;

public class ParcelasPagas {
	private int id, id_parcela, id_aluno_parcela_paga;
        private double valor;
        private String vencimento, data_Pagamento;
       
        
    public ParcelasPagas(int id_parcela, int id_aluno_parcela_paga, double valor, String venciemnto, String data_pagamento) {
        this.id_parcela = id_parcela;
        this.id_aluno_parcela_paga = id_aluno_parcela_paga;
        this.valor = valor;
        this.vencimento = venciemnto;
        this.data_Pagamento = data_pagamento;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_aluno_parcela_paga() {
        return id_aluno_parcela_paga;
    }

    public void setId_aluno_parcela_paga(int id_aluno_parcela_paga) {
        this.id_aluno_parcela_paga = id_aluno_parcela_paga;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getVencimento() {
        return vencimento;
    }

    public void setVencimento(String vencimento) {
        this.vencimento = vencimento;
    }

    public String getData_Pagamento() {
        return data_Pagamento;
    }

    public void setData_Pagamento(String data_Pagamento) {
        this.data_Pagamento = data_Pagamento;
    }

    /**
     * @return the id_parcela
     */
    public int getId_parcela() {
        return id_parcela;
    }

    /**
     * @param id_parcela the id_parcela to set
     */
    public void setId_parcela(int id_parcela) {
        this.id_parcela = id_parcela;
    }

    
}
