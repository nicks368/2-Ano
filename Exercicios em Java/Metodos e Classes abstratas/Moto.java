package prjAbstratoVeiculo;

public class Moto extends Veiculo {

	@Override
	public double calculaIpva(){
		return super.getValorTabela() * 0.02;
	}
}
