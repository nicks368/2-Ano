package prjExerciciosSobrecarga;
import java.util.Scanner;

public class principal_1 {

	public static void main(String[] args) {
		exerc_1 validar = new exerc_1();
		Scanner in= new Scanner (System.in);
        int n[] = new int[10];    
         
        for (int i = 0; i < n.length; i++) {    
        	System.out.println("Digite o " + (1 + i) + "� numero");
        	n[i] = in.nextInt();    
        }
         
        for (int i = 0; i < n.length; i++) {
            if( validar.parOuImpar(n[i]))
                System.out.println(n[i] + " � impar.");
            
            else System.out.println(n[i] + " � par.");
        }   
    }

}


