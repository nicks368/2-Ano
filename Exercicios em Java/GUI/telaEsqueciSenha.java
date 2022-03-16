package EsqueciSenha;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class telaEsqueciSenha {
	JFrame frame;
	JLabel lblTitulo, lblSenha, lblConfirmSenha;
	JPanel panelTitulo, panelCampos, panelBotoes;
	JTextField txtSenha, txtConfirmSenha;
	JButton btnAlterar, btnVoltar;
	JCheckBox checkboxMostrar;
	
	Font fonteLblTitulo = new Font("Corbel", Font.BOLD, 25);
	Font fonteLbl = new Font("Corbel", Font.BOLD, 18);
	Font fonteTxt = new Font("Corbel", Font.BOLD, 16);
	Font fonteBox = new Font("Corbel", Font.BOLD, 14);
	Font fonteBtn = new Font("Corbel", Font.BOLD, 14);
	Color corFundo = new Color(176,196,222);
	Color corBtn = new Color(220,220,220);
	
	telaEsqueciSenha() {
		frame = new JFrame("Tela Esqueci Senha");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(300, 380);
		frame.setLayout(null);
		
		//Titulo
		panelTitulo = new JPanel();
		panelTitulo.setBounds(0, 0, 300, 60);
		panelTitulo.setBackground(corFundo);
		panelTitulo.setLayout(null);
		
		lblTitulo = new JLabel("Trocar de senha");
		lblTitulo.setBounds(60, 10, 200, 50);
		lblTitulo.setFont(fonteLblTitulo);
		
		panelTitulo.add(lblTitulo);
		
		//Campos
		panelCampos = new JPanel();
		panelCampos.setBounds(0, 60, 300, 140);
		panelCampos.setBackground(corFundo);
		panelCampos.setLayout(null);
		
		lblSenha = new JLabel("Nova Senha:");
		lblSenha.setBounds(5, 0, 200, 20);
		lblSenha.setFont(fonteLbl);
		
		txtSenha = new JPasswordField();
		txtSenha.setBounds(5, 25, 270, 25);
		txtSenha.setFont(fonteTxt);
		
		lblConfirmSenha = new JLabel("Confirmar Senha:");
		lblConfirmSenha.setBounds(5, 55, 250, 20);
		lblConfirmSenha.setFont(fonteLbl);
		
		txtConfirmSenha = new JPasswordField();
		txtConfirmSenha.setBounds(5, 80, 270, 25);
		txtConfirmSenha.setFont(fonteTxt);
		
		checkboxMostrar = new JCheckBox("Mostrar senha");
		checkboxMostrar.setBounds(5, 110, 150, 15);
		checkboxMostrar.setBackground(corFundo);
		checkboxMostrar.setFont(fonteBox);
		checkboxMostrar.setFocusable(false);
		
		checkboxMostrar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(checkboxMostrar.isSelected()) {
					((JPasswordField) txtSenha).setEchoChar((char)0);
					((JPasswordField) txtConfirmSenha).setEchoChar((char)0);
				}else {
					((JPasswordField) txtSenha).setEchoChar('*');
					((JPasswordField) txtConfirmSenha).setEchoChar('*');
				}
			}
		});
		
		panelCampos.add(lblSenha);
		panelCampos.add(txtSenha);
		panelCampos.add(lblConfirmSenha);
		panelCampos.add(txtConfirmSenha);
		panelCampos.add(checkboxMostrar);
		
		//Botoes
		panelBotoes = new JPanel();
		panelBotoes.setBounds(0, 200, 300, 180);
		panelBotoes.setBackground(corFundo);
		panelBotoes.setLayout(null);
		
		btnVoltar = new JButton("Voltar");
		btnVoltar.setBounds(5, 0, 130, 35);
		btnVoltar.setBackground(corBtn);
		btnVoltar.setFocusable(false);
		btnVoltar.setFont(fonteBtn);
		
		btnAlterar = new JButton("Alterar Senha");
		btnAlterar.setBounds(140, 0, 140, 35);
		btnAlterar.setBackground(corBtn);
		btnAlterar.setFocusable(false);
		btnAlterar.setFont(fonteBtn);
		
		panelBotoes.add(btnVoltar);
		panelBotoes.add(btnAlterar);
		
		frame.add(panelCampos);
		frame.add(panelTitulo);
		frame.add(panelBotoes);
		frame.setVisible(true);
	}

}
