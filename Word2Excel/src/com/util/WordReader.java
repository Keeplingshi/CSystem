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
 * word读取
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
     * 获取文件的扩展名 
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
	 * 读取word文件
	 * @param path
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	public static List<String> wordTableReader(String path)
			throws FileNotFoundException, IOException {

		/** 1. 读取WORD表格内容 */
		File file=new File(path);
		FileInputStream fis=new FileInputStream(file);
		List<String> infoList = new ArrayList<>(0);
		//如果是doc格式的word文件
		if("doc".equals(getExtension(file.getName())))
		{
			HWPFDocument doc = new HWPFDocument(fis);

			// 遍历range范围内的table。
			TableIterator tableIter = new TableIterator(doc.getRange());
			Table table;
			TableRow row;
			TableCell cell;
			
			while (tableIter.hasNext()) {
				// 获取当前的表格对象
				table = tableIter.next();
				int rowNum = table.numRows(); // 获取表格有多少行
				for (int j = 0; j < rowNum; j++) {
					// 获取每一行表格
					row = table.getRow(j);
					// 获取该行表格中的表格单元
					int cellNum = row.numCells();
					for (int k = 0; k < cellNum; k++) {
						cell = row.getCell(k);
						// 输出单元格的文本
						if (k % 2 == 1) {
							infoList.add(cell.text().trim());
						}
					}
				}
			}
			
		}else if("docx".equals(getExtension(file.getName()))){
			//如果是docx文件
			XWPFDocument docx = new XWPFDocument(fis);

			// 获取文档中所有的表格
			List<XWPFTable> tables = docx.getTables();
			List<XWPFTableRow> rows;
			List<XWPFTableCell> cells;
			for (XWPFTable table : tables) {
				// 获取表格对应的行
				rows = table.getRows();
				for (XWPFTableRow row : rows) {
					// 获取行对应的单元格
					cells = row.getTableCells();
					for (XWPFTableCell cell : cells) {
						infoList.add(cell.getText().trim());
					}
				}
			}
		}else{
			return null;
		}
		
		//关闭文件流
		fis.close();
		return infoList;
	}

//	/**
//	 * 读取docx的文件格式
//	 * @param path
//	 * @return
//	 * @throws FileNotFoundException
//	 * @throws IOException
//	 */
//	public static List<String> docxTableReader(String path)
//			throws FileNotFoundException, IOException {
//
//		/** 1. 读取WORD表格内容 */
//		FileInputStream fis=new FileInputStream(path);
//
//		fis.close();
//		return infoList;
//	}
}
