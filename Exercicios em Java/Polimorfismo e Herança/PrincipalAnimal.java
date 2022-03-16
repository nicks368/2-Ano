package prjAnimalRaquelPNikolasG;

public class PrincipalAnimal {

	public static void main(String[] args) {
		Cachorro ViraLata = new Cachorro();
		ViraLata.setNome("Cachorros");
		ViraLata.apresentarCaracteristicas();
		System.out.println();
		
		Gato Garfield = new Gato();
		Garfield.setNome("Gatos");
		Garfield.apresentarCaracteristicas();
		System.out.println();
		
		Elefante Dumbo = new Elefante();
		Dumbo.setNome("Elefantes");
		Dumbo.apresentarCaracteristicas();
	}
}
