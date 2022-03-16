package prjAbstratoVeiculo;

public class Principal {

	public static void main(String[] args) {
		
		Carro Palio = new Carro();
		Palio.setModelo("Palio");
		Palio.setValorTabela(30000);
		Palio.setCor("Vermelho");
		Palio.setCombustivel("Flex");
		Palio.setIpva(Palio.calculaIpva());
		Palio.imprimeFicha();
		
		Carro HB20 = new Carro();
		HB20.setModelo("HB20");
		HB20.setValorTabela(59290);
		HB20.setCor("Preto");
		HB20.setCombustivel("Gasolina");
		HB20.setIpva(HB20.calculaIpva());
		HB20.imprimeFicha();
		
		Moto Biz = new Moto();
		Biz.setModelo("Biz");
		Biz.setValorTabela(11760);
		Biz.setCor("Prata");
		Biz.setCombustivel("Flex");
		Biz.setIpva(Biz.calculaIpva());
		Biz.imprimeFicha();
		
		Moto F800 = new Moto();
		F800.setModelo("F800");
		F800.setValorTabela(45900);
		F800.setCor("Branca");
		F800.setCombustivel("Gasolina");
		F800.setIpva(F800.calculaIpva());
		F800.imprimeFicha();
	}
}

