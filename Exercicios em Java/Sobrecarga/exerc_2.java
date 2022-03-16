package prjExerciciosSobrecarga;

public class exerc_2 {
	 public boolean validarPrimo(int numero) {
	        for (int j = 2; j < numero; j++) {
	            if (numero % j == 0)
	                return false;   
	        }
	        return true;
	    }
}

