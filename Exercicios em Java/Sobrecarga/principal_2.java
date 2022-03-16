package prjExerciciosSobrecarga;
import java.util.Scanner;

public class principal_2 {

	public static void main(String[] args) {
		exerc_2 validar = new exerc_2();
		Scanner in= new Scanner (System.in);
        int n[] = new int[10];    
         
        for (int i = 0; i < n.length; i++) {    
        	System.out.println("Digite o " + (1 + i) + "º numero");
        	n[i] = in.nextInt();    
        }
         
        for (int i = 0; i < n.length; i++) {
            if( validar.validarPrimo(n[i]))
                System.out.println(n[i] + " é primo.");
            
            else System.out.println(n[i] + " não é primo.");
        }   
    }

}


