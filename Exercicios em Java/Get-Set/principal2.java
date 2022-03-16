package prjExerciciosGetSet;
import java.util.Scanner;

public class principal2 {


	public static void main(String[] args) {
		Scanner in= new Scanner (System.in);
		Produto produto = new Produto();
		
		System.out.println("Digite o nome do produto");
		produto.setNome(in.next());
		
		System.out.println("Digite o preco de custo do produto");
		produto.setPrecoCusto(in.nextDouble());
		
		System.out.println("Digite o preco de venda do produto");
		produto.setPrecoVenda(in.nextDouble());
		
		produto.apresentarProduto();
		produto.calcularMargemLucro();
		produto.getMargemLucroPorcentagem();
	}

}
