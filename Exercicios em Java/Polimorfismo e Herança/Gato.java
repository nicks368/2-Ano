package prjAnimalRaquelPNikolasG;

public class Gato extends Animal {
	public void apresentarCaracteristicas(){
		System.out.println(getNome()+ " correm � " +correr(97)+ "km/h.");
		System.out.println(getNome()+ " se alimentam de " +alimentar("ra��o, frutas e carnes."));
		System.out.println(getNome()+ " dormem "+dormir(4)+ " vezes por dia.");
		System.out.println("O som que os " +getNome()+ " emitem � " +emitirSom("Meow."));
	}
}
