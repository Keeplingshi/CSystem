package com.frame;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.util.WordReader;

public class MainFrame extends JFrame{

	JFrame mainFrame=new JFrame();
	JTextField wordpathJtf=null;
	JButton templetJb=null;
	JLabel templetJlb=null;
	JLabel wordpathJlb=null;
	JButton wordPathJb=null;
	JLabel excelJlb=null;
	JTextField excelPathJtf=null;
	JButton excelPathJb=null;
	JButton jb=null;
	
	public static void main(String[] args) {
		new MainFrame();
	}

	public MainFrame()
	{
		mainFrame.setTitle("word��������");
		mainFrame.setSize(600,420);
		//������Ļ����
		mainFrame.setLocationRelativeTo(null);
		
		//�������Panel
		JPanel jp=new JPanel();
		jp.setLayout(null);
		
		templetJb=new JButton("����ģ��");
		templetJlb=new JLabel("ģ��δ���루���ܴ�������");
		wordpathJlb=new JLabel("ѡ��word�ļ�·��");
		wordpathJtf=new JTextField();
		wordPathJb=new JButton("ѡ���ļ���");
		excelJlb=new JLabel("ѡ��excel����·��");
		excelPathJtf=new JTextField();
		excelPathJb=new JButton("ѡ���ļ���");
		jb=new JButton("ȷ��");
		
		templetJb.setBounds(40, 20, 100, 35);
		jp.add(templetJb);
		
		templetJlb.setBounds(150, 20, 180, 35);
		jp.add(templetJlb);
		
		wordpathJlb.setBounds(40, 80, 150, 60);
		jp.add(wordpathJlb);
		
		//�洢word�����ļ���·��
		wordpathJtf.setBounds(40, 140, 300, 32);
		wordpathJtf.setEditable(false);
		jp.add(wordpathJtf);
		
		//���ѡ��word�ļ��У���·���ŵ�wordpathJtf�ı�����
		wordPathJb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
		        JFileChooser jfc=new JFileChooser();  
		        jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY );  
		        int value=jfc.showDialog(new JLabel(), "ѡ��");
		        if(value==JFileChooser.APPROVE_OPTION){
			        File file=jfc.getSelectedFile();  
			        if(file.isDirectory()){
			        	wordpathJtf.setText(file.getAbsolutePath());
			        }
		        }
			}
		});
		wordPathJb.setBounds(360, 140, 120, 35);
		jp.add(wordPathJb);
		
		excelJlb.setBounds(40, 200, 150, 60);
		jp.add(excelJlb);
		
		//���ڴ��excel·��
		excelPathJtf.setBounds(40, 260, 300, 32);
		excelPathJtf.setEditable(false);
		jp.add(excelPathJtf);
		
		//ѡ�񵼳�excel·��
		excelPathJb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				//�ļ�ѡ���
		        JFileChooser jfc=new JFileChooser();  
		        jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);  
		        int value=jfc.showDialog(new JLabel(), "ѡ��");
		        if(value==JFileChooser.APPROVE_OPTION){
			        File file=jfc.getSelectedFile();  
			        if(file.isDirectory()){
			        	excelPathJtf.setText(file.getAbsolutePath()+File.separator+"word����ͳ�Ʊ�.xls");
			        }
		        }
			}
		});
		excelPathJb.setBounds(360, 260, 120, 35);
		jp.add(excelPathJb);
		
		//����
		jb.setBounds(230, 330, 120, 35);
		jb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				String direcToryPath=wordpathJtf.getText();
				String excelPath=excelPathJtf.getText();
				if(direcToryPath==null||"".equals(direcToryPath)){
					JOptionPane.showMessageDialog(null, "��ѡ��word����·��");
					return ;
				}
				if(excelPath==null||"".equals(excelPath)){
					JOptionPane.showMessageDialog(null, "��ѡ��excel����·��");
					return ;
				}
				WordReader.doWordReader(direcToryPath,excelPath);
			}
		});
		jp.add(jb);
		
		mainFrame.add(jp);
		
		mainFrame.setResizable(false);
	    mainFrame.setVisible(true);
	    mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
}
