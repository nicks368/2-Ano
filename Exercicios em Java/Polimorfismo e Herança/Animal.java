package prjAnimalRaquelPNikolasG;

public class Animal {
	private String nome;
	private String cor;
	private double tamanho;
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCor() {
		return this.cor;
	}
	
	public void setCor(String cor) {
		this.cor = cor;
	}
	
	public void setTamanho(double tamanho) {
		this.tamanho = tamanho;
	}
	
	public double getTamanho() {
		return this.tamanho;
	}
	
	public double correr(double correr){
		return correr;
	}
	
	public String alimentar(String alimentar){
		return alimentar;
	}
	
	public int dormir(int dormir){
		return dormir;
	}
	
	public String emitirSom(String emitirSom){
		return emitirSom;
	}
	
	public void apresentarCaracteristicas(){
		System.out.println(getNome()+ " corre a " +correr(50)+ "km/h");
		System.out.println(getNome()+ " se alimenta de " +alimentar("Frutas"));
		System.out.println(getNome()+ " dorme "+dormir(3)+ " por dia");
		System.out.println("O som que " +getNome()+ " emite é " +emitirSom("AAAA"));
	}
}
