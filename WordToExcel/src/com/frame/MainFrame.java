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
import javax.swing.filechooser.FileSystemView;

import com.util.Word2Excel;
import com.util.WordTemplet;


//提高使用效率：
//1.选取文件夹从桌面开始或者从上次打开的文件夹开始，现在起始的文件夹比较麻烦；
//
//2.导出时候，如果已经之前生成了一个文件，第二次又导出没有提示已经存在是否覆盖，有时候误操作比较麻烦；
//
//3.对整个文件夹里word进行判断，错误或者导入失败得提示；
//
//非必要改功能：
//
//1.上传模板提示是否成功，加一个检测功能？--如果麻烦就算了

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
	JLabel templetInfoJlb=null;
	
	//获取桌面路径
	FileSystemView fsv = FileSystemView.getFileSystemView();  //注意了，这里重要的一句  
	File deskTopPathFile=fsv.getHomeDirectory();
	
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
		templetInfoJlb=new JLabel();
		
		//导入模板
		templetJb.setBounds(40, 20, 100, 35);
		templetJb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
		        JFileChooser jfc=new JFileChooser();  
		        //设置默认桌面路径
		        jfc.setCurrentDirectory(deskTopPathFile);
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
							templetInfoJlb.setText("导入成功");
						}
					} catch (IOException e1) {
						templetInfoJlb.setText("导入失败");
					}
		        }
				
			}
		});
		jp.add(templetJb);
		
		templetJtf.setBounds(150, 20, 300, 35);
		templetJtf.setEditable(false);
		jp.add(templetJtf);
		
		templetInfoJlb.setBounds(480, 20, 100, 35);
		templetInfoJlb.setText("未导入");
		jp.add(templetInfoJlb);
		
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
		        //设置默认桌面路径
		        jfc.setCurrentDirectory(deskTopPathFile);
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
		        //设置默认桌面路径
		        jfc.setCurrentDirectory(deskTopPathFile);
		        jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);  
		        int value=jfc.showDialog(new JLabel(), "选择");
		        if(value==JFileChooser.APPROVE_OPTION){
			        File file=jfc.getSelectedFile();  
			        if(file.isDirectory()){
			        	String excelPath=file.getAbsolutePath()+File.separator+"word处理统计表.xls";
			        	//如果存在处理过的文件，提示是否覆盖
			        	File excelFile=new File(excelPath);
			        	if(excelFile.exists()){
							int isExists=JOptionPane.showConfirmDialog(null, "已存在word处理文件，是否覆盖？");
							//如果是
							if(isExists==JOptionPane.YES_OPTION){
								excelPathJtf.setText(excelPath);
							}
			        	}else{
			        		excelPathJtf.setText(excelPath);
			        	}
			        	
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
