package prjAnimalRaquelPNikolasG;

public class Elefante extends Animal {
	public void apresentarCaracteristicas(){
		System.out.println(getNome()+ " correm à " +correr(40)+ "km/h.");
		System.out.println(getNome()+ " se alimentam de " +alimentar("folhas, ervas e raízes."));
		System.out.println(getNome()+ " dormem "+dormir(1)+ " vez por dia.");
		System.out.println("O som que os " +getNome()+ " emitem é " +emitirSom("PRUUUUU."));
	}
}
