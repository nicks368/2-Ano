package prjVeiculos;

public class Moto {
	private String marca;
	private String modelo;
	private String placa;
	
	public Moto () {
		this("","","");
	}
	
	public Moto (String marca, String modelo, String placa) {
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
	
	public void apresentarMoto () {
		System.out.println("Marca: "+ this.getMarca());
		System.out.println("Modelo: "+ this.getModelo());
		System.out.println("Placa: "+ this.getPlaca());
	}
}
