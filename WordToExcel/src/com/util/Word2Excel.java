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

public class Word2Excel {

//	public static void main(String[] args) {
//		
//		String xmlPath="C:/Users/chen/Desktop/test/wordProperties.xml";
//		String direcToryPath="C:/Users/chen/Desktop/test/templet3";
//		String excelPath="C:/Users/chen/Desktop/test/aaa.xls";
//		
//		doWord2Excel(xmlPath,direcToryPath,excelPath);
//	}
	
	/**
	 * word提取信息到excel
	 * @param xmlPath
	 * @param direcToryPath
	 * @param excelPath
	 */
	public static void doWord2Excel(String xmlPath,String direcToryPath,String excelPath)
	{
		HashMap<Integer, List<String>> templetMap=WordTemplet.readTempletXML(xmlPath);
		
		HashMap<String, List<String>> map=wordDirRead(direcToryPath, templetMap);
		
		writeExcel(excelPath,map);
	}
	
	/**
	 * 将map信息写入excel
	 * @param excelPath
	 * @param map
	 */
	@SuppressWarnings("resource")
	private static void writeExcel(String excelPath,HashMap<String, List<String>> map)
	{
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet("报名表");
		
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
		
		HSSFRow row = sheet.createRow(0);
		
		//迭代获取当前map中的数据
		Iterator<Entry<String, List<String>>> iterator=map.entrySet().iterator();
		//记录excel当前写入的是第多少行数据
		int index=1;
		//记录共多少列数据
		int columnNum=0;
		while(iterator.hasNext())
		{
			Entry<String, List<String>> next = iterator.next();
			row = sheet.createRow(index);
			//如果读取到相关信息
			if(next.getValue()!=null)
			{
				List<String> valueList=next.getValue();
				columnNum=valueList.size()>columnNum?valueList.size():columnNum;
				//后两格用来存储文档名，处理结果
				HSSFCell[] cells=new HSSFCell[columnNum+1];
				
				//创建每一格
				for(int k=0;k<columnNum;k++)
				{
					String str=valueList.get(k);
					//word中读取的换行，回车符用换行符替换
					if(str.contains("\r"))
					{
						str=str.replaceAll ("\\r", "\n");
					}

					cells[k]=row.createCell(k);
					cells[k].setCellStyle(style);
					cells[k].setCellValue(str);
				}
				
				cells[columnNum]=row.createCell(columnNum);
				cells[columnNum].setCellStyle(style);
				cells[columnNum].setCellValue(next.getKey());
				
			}
			
			//切换下一行
			index++;
		}
		
		//自动调整列宽
		for (int i = 0; i < columnNum+1; i++) {
			sheet.autoSizeColumn(i);
		}
		
		try {
			//首先创建文件
			if(FileUtil.createFile(excelPath)){
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
	private static HashMap<String, List<String>> wordDirRead(String direcToryPath, HashMap<Integer, List<String>> templetMap)
	{
		HashMap<String, List<String>> map=new HashMap<String, List<String>>();
		
		File file=new File(direcToryPath);
		if(file.isDirectory()){
			//遍历文件夹下所有文件
			for(String fileName:file.list())
			{
				//判断word文件
				if("doc".equals(FileUtil.getExtension(fileName))||"docx".equals(FileUtil.getExtension(fileName)))
				{
					//获取word文件内容
					List<String> infoList = null;
					try {
						infoList = wordTableReader(direcToryPath+File.separator+fileName,templetMap);
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
	private static List<String> wordTableReader(String path, HashMap<Integer, List<String>> templetMap)
			throws FileNotFoundException, IOException {

		/** 1. 读取WORD表格内容 */
		File file=new File(path);
		FileInputStream fis=new FileInputStream(file);
		List<String> infoList = new ArrayList<>(0);
		//如果是doc格式的word文件
		if("doc".equals(FileUtil.getExtension(file.getName())))
		{
			HWPFDocument doc = new HWPFDocument(fis);

			// 遍历range范围内的table。
			TableIterator tableIter = new TableIterator(doc.getRange());
			Table table;
			TableRow row;
			TableCell cell;
			//表格计数，是第几个表格
			int index=0;	
			
			while (tableIter.hasNext()) {
				// 获取当前的表格对象
				table = tableIter.next();
				//获得需要获取的格子编号
				List<String> list=templetMap.get(index);
				int t=0;
				int rowNum = table.numRows(); // 获取表格有多少行
				for (int j = 0; j < rowNum; j++) {
					// 获取每一行表格
					row = table.getRow(j);
					// 获取该行表格中的表格单元
					int cellNum = row.numCells();
					for (int k = 0; k < cellNum; k++) {
						cell = row.getCell(k);
						//如果是需要获取的格子
						if(list.contains(String.valueOf(t)))
						{
							infoList.add(TableCell.stripFields(cell.text()).trim());
						}
						t++;
					}
				}
				//下一个表格
				index++;
			}
			//关闭文件流
			fis.close();
		}else if("docx".equals(FileUtil.getExtension(file.getName()))){
			//如果是docx文件
			XWPFDocument docx = new XWPFDocument(fis);
			
			// 获取文档中所有的表格
			List<XWPFTable> tables = docx.getTables();
			List<XWPFTableRow> rows;
			List<XWPFTableCell> cells;
			
			//表格计数，是第几个表格
			int index=0;	
			
			for (XWPFTable table : tables) {
				
				//获得需要获取的格子编号
				List<String> list=templetMap.get(index);
				int k = 0;
				// 获取表格对应的行
				rows = table.getRows();
				
				for (XWPFTableRow row : rows) {
					// 获取行对应的单元格
					
					cells = row.getTableCells();
					for (XWPFTableCell cell : cells) 
					{
						//如果是需要获取的格子
						if(list.contains(String.valueOf(k)))
						{
							List<XWPFParagraph> paragraphs = cell.getParagraphs();
							//处理docx文件中的换行问题
							String s="";
							for(XWPFParagraph xwpfParagraph:paragraphs){
								if("".equals(s)){
									s=s+xwpfParagraph.getParagraphText();
								}else{
									s=s+"\n"+xwpfParagraph.getParagraphText();
								}
							}
							infoList.add(s);
						}
						k++;
					}
				}
				
				//下一个表格
				index++;
			}
			//关闭文件流
			fis.close();
		}else{
			return null;
		}

		return infoList;
	}
	

}
