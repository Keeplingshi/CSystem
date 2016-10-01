package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
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
	
	public static void main(String[] args) {
		String direcToryPath="C:/Users/chen/Desktop/test";
		String excelPath="C:/Users/chen/Desktop/test/ttt.xls";
		doWordReader(direcToryPath, excelPath);
	}
	
	/**
	 * 接口调用封装
	 * @param direcToryPath word文件所在文件夹
	 * @param excelPath excel输入路径
	 */
	public static void doWordReader(String direcToryPath,String excelPath)
	{
		HashMap<String, List<String>> map=wordDirRead(direcToryPath);
		writeExcel(excelPath,map);
	}
	
	/**
	 * 写入excel文件
	 * @param excelPath
	 */
	@SuppressWarnings("resource")
	private static void writeExcel(String excelPath,HashMap<String, List<String>> map)
	{
		String[] headers = { "姓名", "所在单位", "职务", "通信地址","性别","职称","邮编","手机","办公电话","电子邮箱","获奖情况","备注","文档名称","处理结果" };
		int columnNum=headers.length;
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet("报名表");
//		// 设置表格默认列宽度为15个字节
//		sheet.setDefaultColumnWidth(15);
		
		//表格样式
		HSSFCellStyle style = workbook.createCellStyle();
		style.setWrapText(true);
		style.setAlignment(HorizontalAlignment.LEFT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		HSSFFont font  = workbook.createFont();
		//设置字体
		font.setFontHeightInPoints((short)12);
		font.setFontName("宋体");
		style.setFont(font);
		
		// 产生表格标题行
		HSSFRow row = sheet.createRow(0);
		for (int i = 0; i < columnNum; i++) {
			HSSFCell cell = row.createCell(i);
			HSSFRichTextString text = new HSSFRichTextString(headers[i]);
			cell.setCellValue(text);
			cell.setCellStyle(style);
		}
		
		//迭代获取当前map中的数据
		Iterator<Entry<String, List<String>>> iterator=map.entrySet().iterator();
		int index=0;
		while(iterator.hasNext())
		{
			index++;
			Entry<String, List<String>> next = iterator.next();
			HSSFCell[] cells=new HSSFCell[columnNum];
			//创建一行表格
			row = sheet.createRow(index);
			//如果读取到相关信息
			if(next.getValue()!=null)
			{
				int k=0;
				for(String str:next.getValue())
				{
					//word中读取的换行，回车符用换行符替换
					if(str.contains("\r"))
					{
						str=str.replaceAll ("\\r", "\n");
					}

					cells[k]=row.createCell(k);
					cells[k].setCellStyle(style);
					cells[k].setCellValue(str);
					k++;
				}
				cells[13]=row.createCell(13);
				cells[13].setCellStyle(style);
				cells[13].setCellValue("成功");
			}else{
				cells[13]=row.createCell(14);
				cells[13].setCellStyle(style);
				cells[13].setCellValue("失败");
			}
			cells[12]=row.createCell(12);
			cells[12].setCellStyle(style);
			cells[12].setCellValue(next.getKey());
		}
		
		//自动调整列宽
		for (int i = 0; i < columnNum; i++) {
			sheet.autoSizeColumn(i);
		}
		
		try {
			//首先创建文件
			if(createFile(excelPath)){
				OutputStream out = new FileOutputStream(excelPath);
				workbook.write(out);
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 读取文件夹下所有word，读取所有有用数据
	 * @param direcToryPath
	 * @return
	 */
	private static HashMap<String, List<String>> wordDirRead(String direcToryPath)
	{
		HashMap<String, List<String>> map=new HashMap<String, List<String>>();
		
		File file=new File(direcToryPath);
		if(file.isDirectory()){
			//遍历文件夹下所有文件
			for(String fileName:file.list())
			{
				//判断word文件
				if("doc".equals(getExtension(fileName))||"docx".equals(getExtension(fileName)))
				{
					//获取word文件内容
					List<String> infoList = null;
					try {
						infoList = wordTableReader(direcToryPath+File.separator+fileName);
					} catch (Exception e) {
						
					}finally{
						//无论成功与否，word文档全部记录
						map.put(fileName, infoList);
					}
				}
			}
		}
		
		return map;
	}

	/**
	 * 读取word文件
	 * @param path 输入文件路径
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private static List<String> wordTableReader(String path)
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
			//关闭文件流
			fis.close();
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
					int k = 0;
					cells = row.getTableCells();
					for (XWPFTableCell cell : cells) 
					{
						if(k%2==1){
							List<XWPFParagraph> paragraphs = cell.getParagraphs();
							//处理docx文件中的换行问题
							String s="";
							for(XWPFParagraph xwpfParagraph:paragraphs){
								if("".equals(s)){
									s=s+xwpfParagraph.getParagraphText();
								}else{
									s=s+"\r"+xwpfParagraph.getParagraphText();
								}
							}
							infoList.add(s);
						}
						k++;
					}
				}
			}
			//关闭文件流
			fis.close();
		}else{
			return null;
		}

		return infoList;
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
	 * 创建文件
	 * @param filename 文件名称
	 * @return
	 */
	public static boolean createFile(String destFileName){
		
		File file = new File(destFileName); 
		//如果存在，返回true
        if(file.exists()) {  
            return true;  
        }  
        if (destFileName.endsWith(File.separator)) {  
            return false;  
        }
        //判断目标文件所在的目录是否存在  
        if(!file.getParentFile().exists()) {  
            //如果目标文件所在的目录不存在，则创建父目录  
            if(!file.getParentFile().mkdirs()) {  
                return false;  
            }  
        }
        //创建目标文件  
        try {  
            if (file.createNewFile()) {  
                return true;  
            } else {  
                return false;  
            }  
        } catch (IOException e) {  
            return false;  
        }
	}
}
