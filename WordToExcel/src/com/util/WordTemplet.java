package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class WordTemplet {
	
	private static final String templetFlag="read";
	public static final String wordPropertiesXmlName="wordProperties.xml";

	/**
	 * 模板信息保存
	 * @param wordPath word模板路径
	 * @param xmlSavePath xml的保存路径
	 * @throws IOException 
	 */
	@SuppressWarnings("resource")
	public static boolean templetXmlSave(String wordPath,String xmlSavePath) throws IOException {

		boolean isSuccess=true;
		
		//读取word内容，写入xml中
		/** 1. 读取WORD表格内容 */
		File file=new File(wordPath);
		FileInputStream fis=new FileInputStream(file);
		
		Document doc = DocumentHelper.createDocument();
		Element root = doc.addElement("root");
		
		//如果是doc格式的word文件
		if("doc".equals(FileUtil.getExtension(file.getName())))
		{
			HWPFDocument hwpfDocument = new HWPFDocument(fis);

			// 遍历range范围内的table。
			TableIterator tableIter = new TableIterator(hwpfDocument.getRange());
			Table table;
			TableRow row;
			TableCell cell;
			
			while (tableIter.hasNext()) {
				Element tableElement = root.addElement("table");
				int index=0;
				// 获取当前的表格对象
				table = tableIter.next();
				int rowNum = table.numRows(); // 获取表格有多少行
				for (int j = 0; j < rowNum; j++) {
					// 获取每一行表格
					row = table.getRow(j);
					// 获取该行表格中的表格单元
					int cellNum = row.numCells();
					//获取每一格内容
					for (int k = 0; k < cellNum; k++) 
					{
						cell = row.getCell(k);
						//如果需要记录
						if(templetFlag.equals(cell.text().trim()))
						{
							Element tdElement = tableElement.addElement("td");
							tdElement.setText(String.valueOf(index));
						}
						index++;
					}
				}
			}
			//关闭文件流
			fis.close();
		}else if("docx".equals(FileUtil.getExtension(file.getName()))){
			//如果是docx文件
			XWPFDocument xwpfDocument = new XWPFDocument(fis);
			
			// 获取文档中所有的表格
			List<XWPFTable> tables = xwpfDocument.getTables();
			List<XWPFTableRow> rows;
			List<XWPFTableCell> cells;
			
			for (XWPFTable table : tables) {
				Element tableElement = root.addElement("table");
				int index=0;
				// 获取表格对应的行
				rows = table.getRows();
				for (XWPFTableRow row : rows) 
				{
					//获取行对应的单元格
					cells = row.getTableCells();
					for (XWPFTableCell cell : cells) 
					{
						//如果需要记录
						if(templetFlag.equals(cell.getText().trim()))
						{
							Element tdElement = tableElement.addElement("td");
							tdElement.setText(String.valueOf(index));
						}
						index++;
					}
				}
			}
			//关闭文件流
			fis.close();
		}else{
			isSuccess=false;
		}
		
		//保存word表格信息
		if(isSuccess){
			isSuccess=saveDocumentToFile(doc, xmlSavePath, wordPropertiesXmlName);
		}

		return isSuccess;
	}

	/**
	 * 保存xml
	 * @param document
	 * @param xmlFilePath 路径
	 * @param xmlFileName 保存文件名
	 */
	private static boolean saveDocumentToFile(Document document,
			String xmlFilePath, String xmlFileName) {
		
		if (document == null || xmlFilePath == null || "".equals(xmlFileName)) {
			return false;
		}

		boolean isSuccess=true;
		
		File file = new File(xmlFilePath);
		// 判断路径是否存在，不存在创建
		if (!file.exists()) {
			file.mkdirs();
		}
		// 保存文件
		OutputFormat format = null;
		format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");

		try {
			XMLWriter xmlWriter = new XMLWriter(
					new FileOutputStream(xmlFilePath + xmlFileName), format);
			xmlWriter.write(document);
			xmlWriter.close();
		} catch (IOException e) {
			isSuccess=false;
		}

		return isSuccess;
	}

	/**
	 * 读取xml文件内容
	 * 
	 * @param xmlPath
	 * @return
	 */
	public static HashMap<Integer, List<String>> readTempletXML(String xmlPath) {

		boolean isSuccess = true;
		// 存放xml文件内容
		HashMap<Integer, List<String>> map = new HashMap<Integer, List<String>>();

		SAXReader saxReader = new SAXReader();// 获取读取xml的对象。

		try {
			File xmlFile = new File(xmlPath);
			Document document = saxReader.read(xmlFile);
			// 向外取数据，获取xml的根节点。
			Element root = document.getRootElement();
			// 从根节点下依次遍历，获取根节点下所有子节点
			Iterator<?> iterator = root.elementIterator();

			// 遍历子节点
			int index = 0;
			while (iterator.hasNext()) {

				// 获取table节点
				Element table_root = (Element) iterator.next();
				// 遍历table节点子元素
				Iterator<?> td_root = table_root.elementIterator();
				List<String> list = new ArrayList<>();
				while (td_root.hasNext()) {
					Element td = (Element) td_root.next();
					list.add(td.getData().toString());
				}
				// 放入map中
				map.put(index, list);
				index++;
			}

		} catch (DocumentException e) {
			isSuccess = false;
		}

		return isSuccess ? map : null;
	}

}
