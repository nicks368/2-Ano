package prjAnimalRaquelPNikolasG;

public class Elefante extends Animal {
	public void apresentarCaracteristicas(){
		System.out.println(getNome()+ " correm � " +correr(40)+ "km/h.");
		System.out.println(getNome()+ " se alimentam de " +alimentar("folhas, ervas e ra�zes."));
		System.out.println(getNome()+ " dormem "+dormir(1)+ " vez por dia.");
		System.out.println("O som que os " +getNome()+ " emitem � " +emitirSom("PRUUUUU."));
	}
}
