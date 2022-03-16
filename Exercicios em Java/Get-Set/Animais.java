package prjExerciciosGetSet;

public class Animais {
	protected String especie;
	protected String peso;
	protected String qtdpatas;
	
	public Animais () {
		this ("","","");
	}
	
	public Animais(String especie, String peso, String qtdpatas) {
		this.especie=especie;
		this.peso=peso;
		this.qtdpatas=qtdpatas;
	}
	
	public String getEspecie() {
		return especie;
	}
	
	public void setEspecie(String especie) {
		this.especie=especie;
	}
	
	public String getPeso() {
		return peso;
	}
	
	public void setPeso(String peso) {
		this.peso=peso;
	}
	
	public String getQtdPatas() {
		return qtdpatas;
	}
	
	public void setQtdPatas(String qtdpatas) {
		this.qtdpatas=qtdpatas;
	}
	
	public void apresentarAnimal() {
		System.out.println("Especie: "+ this.getEspecie());
		System.out.println("Peso: "+ this.getPeso());
		System.out.println("Qtd de patas: "+ this.getQtdPatas());
	}
}
