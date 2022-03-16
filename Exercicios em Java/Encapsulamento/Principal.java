package prjVeiculos;

public class Principal {

	public static void main(String[] args) {
		Caminhao caminhao = new Caminhao("Mercedes","Accelo","DAS-3828");
		System.out.println("Caminhão");
		caminhao.apresentarCaminhao();
		System.out.println();
		
		Carro carro = new Carro("Chevrolet","Corsa","GKS-'1899");
		System.out.println("Carro");
		carro.apresentarCarro();
		System.out.println();
		
		Moto moto = new Moto("Honda","CG","LQP-9182");
		System.out.println("Moto");
		moto.apresentarMoto();

	}

}
