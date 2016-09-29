package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

/**
 * word��ȡ
 * 
 * @author chenbin
 * 
 */
public class WordReader {

//	File f = new File("src/myday20");
//	test1(f);
//	System.out.println("------------------");
//	listMyFiles(f);
//	}
//
//	public static void test1(File file) {
//	if (file.isDirectory()) {
//	String[] s = file.list();
//	for (String string : s) {
//	System.out.println(string);
//	}
	
	public static void main(String[] args) {
		
		String direcToryPath="D:/Data";
		File file=new File(direcToryPath);
		if(file.isDirectory()){
			for(String fileName:file.list())
			{
				
			}
		}
		
//		String path = "D:/Data/test1.doc";
//		List<String> infoList = null;
//		try {
//			infoList = docTableReader(path);
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		for (String s : infoList) {
//			System.out.println(s);
//		}
	}
	
    /** 
     * ��ȡ�ļ�����չ�� 
     *  
     * @param filename 
     * @param defExt 
     * @return 
     */  
    public static String getExtension(String fileName) {  
        if ((fileName != null) && (fileName.length() > 0)) {  
            int i = fileName.lastIndexOf('.');  
  
  
            if ((i > -1) && (i < (fileName.length() - 1))) {  
                return fileName.substring(i + 1);  
            }  
        }  
        return null;  
    } 

	/**
	 * ��ȡword�ļ�
	 * @param path
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	public static List<String> wordTableReader(String path)
			throws FileNotFoundException, IOException {

		/** 1. ��ȡWORD������� */
		File file=new File(path);
		FileInputStream fis=new FileInputStream(file);
		List<String> infoList = new ArrayList<>(0);
		//�����doc��ʽ��word�ļ�
		if("doc".equals(getExtension(file.getName())))
		{
			HWPFDocument doc = new HWPFDocument(fis);

			// ����range��Χ�ڵ�table��
			TableIterator tableIter = new TableIterator(doc.getRange());
			Table table;
			TableRow row;
			TableCell cell;
			
			while (tableIter.hasNext()) {
				// ��ȡ��ǰ�ı�����
				table = tableIter.next();
				int rowNum = table.numRows(); // ��ȡ����ж�����
				for (int j = 0; j < rowNum; j++) {
					// ��ȡÿһ�б��
					row = table.getRow(j);
					// ��ȡ���б���еı��Ԫ
					int cellNum = row.numCells();
					for (int k = 0; k < cellNum; k++) {
						cell = row.getCell(k);
						// �����Ԫ����ı�
						if (k % 2 == 1) {
							infoList.add(cell.text().trim());
						}
					}
				}
			}
			
		}else if("docx".equals(getExtension(file.getName()))){
			//�����docx�ļ�
			XWPFDocument docx = new XWPFDocument(fis);

			// ��ȡ�ĵ������еı��
			List<XWPFTable> tables = docx.getTables();
			List<XWPFTableRow> rows;
			List<XWPFTableCell> cells;
			for (XWPFTable table : tables) {
				// ��ȡ����Ӧ����
				rows = table.getRows();
				for (XWPFTableRow row : rows) {
					// ��ȡ�ж�Ӧ�ĵ�Ԫ��
					cells = row.getTableCells();
					for (XWPFTableCell cell : cells) {
						infoList.add(cell.getText().trim());
					}
				}
			}
		}else{
			return null;
		}
		
		//�ر��ļ���
		fis.close();
		return infoList;
	}

//	/**
//	 * ��ȡdocx���ļ���ʽ
//	 * @param path
//	 * @return
//	 * @throws FileNotFoundException
//	 * @throws IOException
//	 */
//	public static List<String> docxTableReader(String path)
//			throws FileNotFoundException, IOException {
//
//		/** 1. ��ȡWORD������� */
//		FileInputStream fis=new FileInputStream(path);
//
//		fis.close();
//		return infoList;
//	}
}
