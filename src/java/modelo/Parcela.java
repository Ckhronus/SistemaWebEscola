package modelo;

public class Parcela {
    
	private int id;
	private double valor;
        private String vencimento;
        private String data_pagamento;
        private boolean pago = false;
        private int id_aluno_parcela;
       
        
    public Parcela(double valor, String vencimento, int id_aluno_parcela) {
        this.valor = valor;
        this.vencimento = vencimento;
        this.id_aluno_parcela = id_aluno_parcela;
    }
    
    public Parcela(String data_pagamento, int id){
        this.data_pagamento = data_pagamento;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getData_pagamento() {
        return data_pagamento;
    }

    public void setData_pagamento(String data_pagamento) {
        this.data_pagamento = data_pagamento;
    }

    public int getId_aluno_parcela() {
        return id_aluno_parcela;
    }

    public void setId_aluno_parcela(int id_aluno_parcela) {
        this.id_aluno_parcela = id_aluno_parcela;
    }   
    
    public boolean isPago() {
        return pago;
    }
    
    public void setPago(boolean pago) {
        this.pago = pago;
    }
}
