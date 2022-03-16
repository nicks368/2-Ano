package Login;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


public class telaLogin {
	JFrame frame;
	JLabel lblTitulo, lblEmail, lblSenha;
	JPanel panelTitulo;
	JPanel panelCampos;
	JPanel panelBotoes;
	JTextField txtEmail, txtSenha;
	JButton btnEntrar, btnEsqSenha, btnVoltar;
	JCheckBox checkboxLembrar, checkboxMostrar;
	
	Font fonteLblTitulo = new Font("Corbel", Font.BOLD, 25);
	Font fonteLbl = new Font("Corbel", Font.BOLD, 18);
	Font fonteTxt = new Font("Corbel", Font.BOLD, 16);
	Font fonteBox = new Font("Corbel", Font.BOLD, 14);
	Font fonteBtn = new Font("Corbel", Font.BOLD, 13);
	Color corFundo = new Color(176,196,222);
	Color corBtn = new Color(220,220,220);
	
	telaLogin() {
		frame = new JFrame("Login");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(350, 380);
		frame.setLayout(null);
		
		btnEntrar = new JButton("Entrar");
		btnVoltar = new JButton("Voltar");
		btnEsqSenha = new JButton("Esqueci a senha");
		
		//Titulo
		panelTitulo = new JPanel();
		panelTitulo.setBounds(0, 0, 350, 60);
		panelTitulo.setBackground(corFundo);
		panelTitulo.setLayout(null);
		
		lblTitulo = new JLabel("Login");
		lblTitulo.setBounds(135, 10, 250, 50);
		lblTitulo.setFont(fonteLblTitulo);
		
		panelTitulo.add(lblTitulo);
		
		//Campos
		panelCampos = new JPanel();
		panelCampos.setBounds(0, 60, 350, 170);
		panelCampos.setBackground(corFundo);
		panelCampos.setLayout(null);
		
		lblEmail = new JLabel("E-mail:");
		lblEmail.setBounds(5, 0, 250, 50);
		lblEmail.setFont(fonteLbl);
		
		txtEmail = new JTextField();
		txtEmail.setBounds(5, 40, 320, 25);
		txtEmail.setFont(fonteTxt);
		
		lblSenha = new JLabel("Senha:");
		lblSenha.setBounds(5, 60, 250, 50);
		lblSenha.setFont(fonteLbl);
		
		txtSenha = new JPasswordField();
		txtSenha.setBounds(5, 100, 320, 25);
		txtSenha.setFont(fonteTxt);
		
		checkboxLembrar = new JCheckBox("Lembrar de mim");
		checkboxLembrar.setBounds(5, 130, 130, 20);
		checkboxLembrar.setBackground(corFundo);
		checkboxLembrar.setFont(fonteBox);
		checkboxLembrar.setFocusable(false);
		
		checkboxMostrar = new JCheckBox("Mostrar senha");
		checkboxMostrar.setBounds(140, 130, 150, 20);
		checkboxMostrar.setBackground(corFundo);
		checkboxMostrar.setFont(fonteBox);
		checkboxMostrar.setFocusable(false);
		
		checkboxMostrar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(checkboxMostrar.isSelected()) {
					((JPasswordField) txtSenha).setEchoChar((char)0);
				}else {
					((JPasswordField) txtSenha).setEchoChar('*');
				}
			}
		});
		
		panelCampos.add(lblEmail);
		panelCampos.add(txtEmail);
		panelCampos.add(lblSenha);
		panelCampos.add(txtSenha);
		panelCampos.add(checkboxLembrar);
		panelCampos.add(checkboxMostrar);
		
		//Botoes
		panelBotoes = new JPanel();
		panelBotoes.setBounds(0, 230, 350, 170);
		panelBotoes.setBackground(corFundo);
		panelBotoes.setLayout(null);
		
		btnVoltar = new JButton("Voltar");
		btnVoltar.setBounds(5, 0, 100, 35);
		btnVoltar.setBackground(corBtn);
		btnVoltar.setFocusable(false);
		btnVoltar.setFont(fonteBtn);
		
		btnEsqSenha = new JButton("Esqueci Senha");
		btnEsqSenha.setBounds(110, 0, 120, 35);
		btnEsqSenha.setBackground(corBtn);
		btnEsqSenha.setFocusable(false);	
		btnEsqSenha.setFont(fonteBtn);
		
		btnEntrar = new JButton("Entrar");
		btnEntrar.setBounds(235, 0, 95, 35);
		btnEntrar.setBackground(corBtn);
		btnEntrar.setFocusable(false);
		btnEntrar.setFont(fonteBtn);
		
		panelBotoes.add(btnVoltar);
		panelBotoes.add(btnEsqSenha);
		panelBotoes.add(btnEntrar);
		
		frame.add(panelCampos);
		frame.add(panelTitulo);
		frame.add(panelBotoes);
		frame.setVisible(true);
	}

}
