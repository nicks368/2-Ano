package prjExerciciosGetSet;

public class Produto {
	private String nome;
	private double precoCusto;
	private double precoVenda;
	private double margemLucro;
	private double lucroPorcentagem;
	
	public Produto () {
		
	}
	
	public Produto(String nome, double precoCusto, double precoVenda, double margemLucro) {
		this.nome=nome;
		this.precoCusto=precoCusto;
		this.precoVenda=precoVenda;
		this.margemLucro=margemLucro;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome=nome;
	}
	
	public double getPrecoCusto() {
		return precoCusto;
	}
	
	public void setPrecoCusto(double precoCusto) {
		this.precoCusto=precoCusto;
	}
	
	public double getPrecoVenda() {
		return precoVenda;
	}
	
	public void setPrecoVenda(double precoVenda) {
		if (precoVenda<precoCusto)
			System.out.println("O pre�o de venda � menor do que o pre�o de custo, voc� nao tera lucro!");
		else this.precoVenda=precoVenda;
	}
	
	public void calcularMargemLucro() {
		margemLucro = precoVenda - precoCusto;
		System.out.println("Margem do lucro: R$"+ margemLucro);
	}
	
	public void getMargemLucroPorcentagem() {
		lucroPorcentagem = (100*margemLucro)/precoCusto;
		System.out.println("Percentual da margem de lucro: "+lucroPorcentagem+"%"); 
	}
	
	public double getMargemLucro() {
		return margemLucro;
	}
	
	public void setMargemLucro(double margemLucro) {
		this.margemLucro=margemLucro;
	}
	
	public void apresentarProduto() {
		System.out.println("Nome do produto: "+ this.getNome());
		System.out.println("Pre�o do custo: R$"+ this.getPrecoCusto());
		System.out.println("Pre�o de venda: R$"+ this.getPrecoVenda());
	}
}
