package prjAnimalRaquelPNikolasG;

public class Cachorro extends Animal {
	
	public void apresentarCaracteristicas(){
		System.out.println(getNome()+ " correm � " +correr(30)+ "km/h.");
		System.out.println(getNome()+ " se alimentam de " +alimentar("ra��o, frutas e verduras."));
		System.out.println(getNome()+ " dormem "+dormir(3)+ " vezes por dia.");
		System.out.println("O som que os " +getNome()+ " emitem � " +emitirSom("AuAu."));
	}
}
