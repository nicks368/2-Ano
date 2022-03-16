package Cadastro;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class telaCadastro {
	JFrame frame;
	JLabel lblTitulo, lblNome, lblDataNasc, lblCpf, lblCidade, lblBairro, lblComplemento, lblRua, 
	lblEstado, lblTelefone1, lblTelefone2, lblEmail, lblSenha, lblConfirmSenha;
	JPanel panelTitulo, panelCampos, panelBotoes;
	JTextField txtNome, txtDataNasc, txtCpf, txtCidade, txtBairro, txtComplemento, txtRua, 
	txtEstado, txtTelefone1, txtTelefone2, txtEmail, txtSenha, txtConfirmSenha;
	JButton btnCadastrar, btnVoltar;
	JComboBox cboEstado;
	JCheckBox checkboxMostrar;
	
	
	Font fonteLblTitulo = new Font("Corbel", Font.BOLD, 25);
	Font fonteLbl = new Font("Corbel", Font.BOLD, 18);
	Font fonteTxt = new Font("Corbel", Font.BOLD, 16);
	Font fonteBox = new Font("Corbel", Font.BOLD, 14);
	Font fonteBtn = new Font("Corbel", Font.BOLD, 16);
	Color corFundo = new Color(176,196,222);
	Color corBtn = new Color(220,220,220);
	String [] estado = {"AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"};
	
	telaCadastro() {
		frame = new JFrame("Tela de Cadastro");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(450, 600);
		frame.setLayout(null);
		
		//Titulo
		panelTitulo = new JPanel();
		panelTitulo.setBounds(0, 0, 450, 60);
		panelTitulo.setBackground(corFundo);
		panelTitulo.setLayout(null);
				
		lblTitulo = new JLabel("Cadastrar-se");
		lblTitulo.setBounds(140, 10, 200, 50);
		lblTitulo.setFont(fonteLblTitulo);
				
		panelTitulo.add(lblTitulo);
		
		//Campos
		panelCampos = new JPanel();
		panelCampos.setBounds(0, 60, 450, 400);
		panelCampos.setBackground(corFundo);
		panelCampos.setLayout(null);
		
		lblNome = new JLabel("Nome Completo:");
		lblNome.setBounds(5, 10, 200, 20);
		lblNome.setFont(fonteLbl);
		
		txtNome = new JTextField();
		txtNome.setBounds(5, 35, 210, 25);
		txtNome.setFont(fonteTxt);

		lblCpf = new JLabel("Cpf:");
		lblCpf.setBounds(220, 10, 200, 20);
		lblCpf.setFont(fonteLbl);
		
		txtCpf = new JTextField();
		txtCpf.setBounds(220, 35, 210, 25);
		txtCpf.setFont(fonteTxt);
		
		lblCidade = new JLabel("Cidade:");
		lblCidade.setBounds(5, 70, 180, 20);
		lblCidade.setFont(fonteLbl);
		
		txtCidade = new JTextField();
		txtCidade.setBounds(5, 95, 210, 25);
		txtCidade.setFont(fonteTxt);
		
		lblBairro = new JLabel("Bairro:");
		lblBairro.setBounds(220, 70, 180, 20);
		lblBairro.setFont(fonteLbl);
		
		txtBairro = new JTextField();
		txtBairro.setBounds(220, 95, 210, 25);
		txtBairro.setFont(fonteTxt);
		
		lblRua = new JLabel("Rua:");
		lblRua.setBounds(5, 130, 180, 20);
		lblRua.setFont(fonteLbl);
		
		txtRua = new JTextField();
		txtRua.setBounds(5, 155, 165, 25);
		txtRua.setFont(fonteTxt);
		
		lblComplemento = new JLabel("Compl:");
		lblComplemento.setBounds(175, 130, 130, 20);
		lblComplemento.setFont(fonteLbl);
		
		txtComplemento = new JTextField();
		txtComplemento.setBounds(175, 155, 130, 25);
		txtComplemento.setFont(fonteTxt);

		lblEstado = new JLabel("Estado:");
		lblEstado.setBounds(310, 130, 130, 20);
		lblEstado.setFont(fonteLbl);
		
		cboEstado = new JComboBox(estado);
		cboEstado.setBounds(310, 155, 120, 25);
		cboEstado.setFont(fonteTxt);
		cboEstado.setFocusable(false);
		
		lblTelefone1 = new JLabel("Telefone (1):");
		lblTelefone1.setBounds(5, 190, 130, 20);
		lblTelefone1.setFont(fonteLbl);
		
		txtTelefone1 = new JTextField();
		txtTelefone1.setBounds(5, 215, 210, 25);
		txtTelefone1.setFont(fonteTxt);
		
		lblTelefone2 = new JLabel("Telefone (2):");
		lblTelefone2.setBounds(220, 190, 130, 20);
		lblTelefone2.setFont(fonteLbl);
		
		txtTelefone2 = new JTextField();
		txtTelefone2.setBounds(220, 215, 210, 25);
		txtTelefone2.setFont(fonteTxt);
		
		lblEmail = new JLabel("E-mail:");
		lblEmail.setBounds(5, 250, 130, 20);
		lblEmail.setFont(fonteLbl);
		
		txtEmail = new JTextField();
		txtEmail.setBounds(5, 275, 210, 25);
		txtEmail.setFont(fonteTxt);
		
		lblDataNasc = new JLabel("Data de Nasc:");
		lblDataNasc.setBounds(220, 250, 130, 20);
		lblDataNasc.setFont(fonteLbl);
		
		txtDataNasc = new JTextField();
		txtDataNasc.setBounds(220, 275, 210, 25);
		txtDataNasc.setFont(fonteTxt);
		
		lblSenha = new JLabel("Senha:");
		lblSenha.setBounds(5, 305, 130, 20);
		lblSenha.setFont(fonteLbl);
		
		txtSenha = new JPasswordField();
		txtSenha.setBounds(5, 330, 210, 25);
		txtSenha.setFont(fonteTxt);
		
		lblConfirmSenha = new JLabel("Confirmar Senha:");
		lblConfirmSenha.setBounds(220, 305, 150, 20);
		lblConfirmSenha.setFont(fonteLbl);
		
		txtConfirmSenha = new JPasswordField();
		txtConfirmSenha.setBounds(220, 330, 210, 25);
		txtConfirmSenha.setFont(fonteTxt);
		
		checkboxMostrar = new JCheckBox("Mostrar senha");
		checkboxMostrar.setBounds(5, 360, 200, 20);
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
		
		panelCampos.add(lblNome);
		panelCampos.add(txtNome);
		panelCampos.add(lblCpf);
		panelCampos.add(txtCpf);
		panelCampos.add(lblCidade);
		panelCampos.add(txtCidade);
		panelCampos.add(lblBairro);
		panelCampos.add(txtBairro);
		panelCampos.add(lblRua);
		panelCampos.add(txtRua);
		panelCampos.add(lblComplemento);
		panelCampos.add(txtComplemento);
		panelCampos.add(lblEstado);
		panelCampos.add(cboEstado);
		panelCampos.add(lblTelefone1);
		panelCampos.add(txtTelefone1);
		panelCampos.add(lblTelefone2);
		panelCampos.add(txtTelefone2);
		panelCampos.add(lblEmail);
		panelCampos.add(txtEmail);
		panelCampos.add(lblDataNasc);
		panelCampos.add(txtDataNasc);
		panelCampos.add(lblSenha);
		panelCampos.add(txtSenha);
		panelCampos.add(lblConfirmSenha);
		panelCampos.add(txtConfirmSenha);
		panelCampos.add(checkboxMostrar);
		
		//Botoes
		panelBotoes = new JPanel();
		panelBotoes.setBounds(0, 460, 450, 140);
		panelBotoes.setBackground(corFundo);
		panelBotoes.setLayout(null);
		
		btnVoltar = new JButton("Voltar");
		btnVoltar.setBounds(40, 0, 170, 40);
		btnVoltar.setBackground(corBtn);
		btnVoltar.setFocusable(false);
		btnVoltar.setFont(fonteBtn);
		
		btnCadastrar = new JButton("Cadastrar");
		btnCadastrar.setBounds(215, 0, 170, 40);
		btnCadastrar.setBackground(corBtn);
		btnCadastrar.setFocusable(false);
		btnCadastrar.setFont(fonteBtn);
		
		panelBotoes.add(btnVoltar);
		panelBotoes.add(btnCadastrar);
		
		frame.add(panelBotoes);
		frame.add(panelCampos);
		frame.add(panelTitulo);
		frame.setVisible(true);
	}

}
