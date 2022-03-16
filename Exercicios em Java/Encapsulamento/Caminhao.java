package prjVeiculos;

public class Caminhao {
	String marca;
	String modelo;
	String placa;
	
	public Caminhao () {
		this("","","");
	}
	
	public Caminhao (String marca, String modelo, String placa) {
		this.marca=marca;
		this.modelo=modelo;
		this.placa=placa;
	}
	
	public String getMarca () {
		return marca;
	}
	
	public void setMarca(String marca) {
		this.marca=marca;
	}
	
	public String getModelo () {
		return modelo;
	}
	
	public void setModelo(String modelo) {
		this.modelo=modelo;
	}
	
	public String getPlaca () {
		return placa;
	}
	
	public void setPlaca (String placa) {
		this.placa=placa;
	}
	
	public void apresentarCaminhao () {
		System.out.println("Marca: "+ this.getMarca());
		System.out.println("Modelo: "+ this.getModelo());
		System.out.println("Placa: "+ this.getPlaca());
	}
}
