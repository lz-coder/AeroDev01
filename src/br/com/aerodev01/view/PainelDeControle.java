/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.aerodev01.view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JPanel;

/**
 *
 * @author luan
 */
public class PainelDeControle {
    JButton btnCadastrar;
            
    public PainelDeControle() {
        Window janela = new Window(false);
        
        JPanel painel = new JPanel();
        painel.setLayout(null);
        
        janela.addLabelTitulo(painel, "Painel de Controle", 200, 230, 20);
        btnCadastrar = janela.addButton(painel, "Novo Cliente", 100,150, 200, 40);
        JButton btnComprar = janela.addButton(painel, "Comprar Passagem", 320, 150, 200, 40);
        JButton btnPasCadastradas = janela.addButton(painel, "Passagens", 100, 210, 200, 40);
        JButton btnCancelarCompra = janela.addButton(painel, "Cancelar Compra", 320, 210, 200, 40);
        
        janela.getContentPane().add(painel);
        
        janela.setVisible(true);
        
        btnCadastrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.println(".actionPerformed()");
                NovoCliente novoCliente = new NovoCliente();
            }
        });
        
    }
}
