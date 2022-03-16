package prjAbstratoVeiculo;

public abstract class Veiculo {
	private String modelo;
	private double valorTabela;
	private String cor;
	private String combustivel;
	private double ipva;
	
	public String getModelo() {
		return modelo;
	}
	
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	
	public double getValorTabela() {
		return valorTabela;
	}
	
	public void setValorTabela(double valorTabela) {
		this.valorTabela = valorTabela;
	}
	
	public String getCor() {
		return cor;
	}
	
	public void setCor(String cor) {
		this.cor = cor;
	}
	
	public String getCombustivel() {
		return combustivel;
	}
	
	public void setCombustivel(String combustivel) {
		this.combustivel = combustivel;
	}
	
	public double getIpva() {
		return ipva;
	}
	
	public void setIpva(double ipva) {
		this.ipva = ipva;
	}
	
	public abstract double calculaIpva();
	
	public void imprimeFicha(){
		System.out.println("Modelo do ve�culo: "+ getModelo());
		System.out.println("Valor do ve�culo: R$"+ getValorTabela());
		System.out.println("Cor do ve�culo: "+ getCor());
		System.out.println("Tipo de combust�vel do ve�culo: "+ getCombustivel());
		System.out.println("Valor do IPVA: R$"+ calculaIpva());
		System.out.println("--------------------------------");
		
	}
}
