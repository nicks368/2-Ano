package prjAnimalRaquelPNikolasG;

public class Cachorro extends Animal {
	
	public void apresentarCaracteristicas(){
		System.out.println(getNome()+ " correm à " +correr(30)+ "km/h.");
		System.out.println(getNome()+ " se alimentam de " +alimentar("ração, frutas e verduras."));
		System.out.println(getNome()+ " dormem "+dormir(3)+ " vezes por dia.");
		System.out.println("O som que os " +getNome()+ " emitem é " +emitirSom("AuAu."));
	}
}
