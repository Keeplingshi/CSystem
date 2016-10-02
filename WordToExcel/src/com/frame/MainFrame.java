package com.frame;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.filechooser.FileNameExtensionFilter;

import com.util.Word2Excel;
import com.util.WordTemplet;

public class MainFrame extends JFrame{

	private static final long serialVersionUID = 1L;
	JFrame mainFrame=new JFrame();
	JTextField wordpathJtf=null;
	JButton templetJb=null;
	JTextField templetJtf=null;
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
		mainFrame.setTitle("word批量处理");
		mainFrame.setSize(600,420);
		//设置屏幕居中
		mainFrame.setLocationRelativeTo(null);
		
		//设置面板Panel
		JPanel jp=new JPanel();
		jp.setLayout(null);
		
		templetJb=new JButton("导入模板");
		templetJtf=new JTextField();
		wordpathJlb=new JLabel("选择word文件路径");
		wordpathJtf=new JTextField();
		wordPathJb=new JButton("选择文件夹");
		excelJlb=new JLabel("选择excel导出路径");
		excelPathJtf=new JTextField();
		excelPathJb=new JButton("选择文件夹");
		jb=new JButton("确定");
		
		//导入模板
		templetJb.setBounds(40, 20, 100, 35);
		templetJb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
		        JFileChooser jfc=new JFileChooser();  
		        FileNameExtensionFilter filter = new FileNameExtensionFilter("word文件", "doc", "docx");
		        jfc.setFileFilter(filter);
		        int value=jfc.showDialog(new JLabel(), "选择");
		        if(value==JFileChooser.APPROVE_OPTION){
			        File file=jfc.getSelectedFile();
			        try {
			        	String xmlPath=file.getParent()+File.separator;
			        	//保存模板信息
						if(WordTemplet.templetXmlSave(file.getAbsolutePath(), xmlPath))
						{
							templetJtf.setText(xmlPath+File.separator+WordTemplet.wordPropertiesXmlName);
						}
					} catch (IOException e1) {
						
					}
		        }
				
			}
		});
		jp.add(templetJb);
		
		templetJtf.setBounds(150, 20, 300, 35);
		templetJtf.setEditable(false);
		jp.add(templetJtf);
		
		wordpathJlb.setBounds(40, 80, 150, 60);
		jp.add(wordpathJlb);
		
		//存储word所在文件夹路径
		wordpathJtf.setBounds(40, 140, 300, 32);
		wordpathJtf.setEditable(false);
		jp.add(wordpathJtf);
		
		//点击选择word文件夹，将路径放到wordpathJtf文本框中
		wordPathJb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
		        JFileChooser jfc=new JFileChooser();  
		        jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY );  
		        int value=jfc.showDialog(new JLabel(), "选择");
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
		
		//用于存放excel路径
		excelPathJtf.setBounds(40, 260, 300, 32);
		excelPathJtf.setEditable(false);
		jp.add(excelPathJtf);
		
		//选择导出excel路径
		excelPathJb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				//文件选择框
		        JFileChooser jfc=new JFileChooser();  
		        jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);  
		        int value=jfc.showDialog(new JLabel(), "选择");
		        if(value==JFileChooser.APPROVE_OPTION){
			        File file=jfc.getSelectedFile();  
			        if(file.isDirectory()){
			        	excelPathJtf.setText(file.getAbsolutePath()+File.separator+"word处理统计表.xls");
			        }
		        }
			}
		});
		excelPathJb.setBounds(360, 260, 120, 35);
		jp.add(excelPathJb);
		
		//导出
		jb.setBounds(230, 330, 120, 35);
		jb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				//获取word文档路径和excel导出路径
				String xmlPath=templetJtf.getText();
				String direcToryPath=wordpathJtf.getText();
				String excelPath=excelPathJtf.getText();
				
				if(xmlPath==null||"".equals(xmlPath)){
					JOptionPane.showMessageDialog(null, "请导入模板");
					return ;
				}
				
				if(direcToryPath==null||"".equals(direcToryPath)){
					JOptionPane.showMessageDialog(null, "请选择word所处路径");
					return ;
				}
				if(excelPath==null||"".equals(excelPath)){
					JOptionPane.showMessageDialog(null, "请选择excel导出路径");
					return ;
				}
				//执行读取word操作
				if(Word2Excel.doWord2Excel(xmlPath, direcToryPath, excelPath))
				{
					JOptionPane.showMessageDialog(null, "导出成功");
				}else{
					JOptionPane.showMessageDialog(null, "导出失败");
				}
				
			}
		});
		jp.add(jb);
		
		mainFrame.add(jp);
		
		mainFrame.setResizable(false);
	    mainFrame.setVisible(true);
	    mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
}
