package Inicio;
import javax.swing.*;
import java.awt.*;

public class telaInicio {
	JFrame frame;
	JLabel label;
	JButton btnLogin, btnCadastro, btnSair;
	JPanel panel;
	
	Font fonteLbl = new Font("Corbel", Font.BOLD, 25);
	Font fonteBtn = new Font("Corbel", Font.BOLD, 18);
	Color corFundo = new Color(176,196,222);
	Color corBtn = new Color(220,220,220);
	
	telaInicio(){
		
		frame = new JFrame("REDISP");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(350, 400);
		frame.setLayout(null);
		
		btnLogin = new JButton("Login");
		btnCadastro = new JButton("Cadastrar-se");
		btnSair = new JButton("Sair");
		
		
		panel = new JPanel();
		panel.setBounds(0, 0, 350, 400);
		panel.setBackground(corFundo);
		panel.setLayout(null);
		
		label = new JLabel("Bem Vindo");
		label.setBounds(110, 15, 250, 50);
		label.setFont(fonteLbl);
		
		btnLogin.setBounds(90, 100, 160, 40);
		btnLogin.setFont(fonteBtn);
		btnLogin.setBackground(corBtn);
		btnLogin.setFocusable(false);
	
		btnCadastro.setBounds(90, 150, 160, 40);
		btnCadastro.setFont(fonteBtn);
		btnCadastro.setBackground(corBtn);
		btnCadastro.setFocusable(false);
		
		btnSair.setBounds(90, 200, 160, 40);
		btnSair.setFont(fonteBtn);
		btnSair.setBackground(corBtn);
		btnSair.setFocusable(false);
		
		panel.add(label);
		panel.add(btnLogin);
		panel.add(btnCadastro);
		panel.add(btnSair);
		
		frame.add(panel);
		frame.setVisible(true);
	}

}
