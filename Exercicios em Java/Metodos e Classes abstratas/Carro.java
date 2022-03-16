package prjAbstratoVeiculo;

public class Carro extends Veiculo{
	
	@Override
	public double calculaIpva(){
		return super.getValorTabela() * 0.04;
	}

}
