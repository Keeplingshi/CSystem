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
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
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

	public static void main(String[] args) {
		
		String direcToryPath="D:/Data";
		String excelPath="D:/Data/ttt.xls";
		doWordReader(direcToryPath,excelPath);
	}
	
	/**
	 * �ӿڵ��÷�װ
	 * @param direcToryPath word�ļ������ļ���
	 * @param excelPath excel����·��
	 */
	public static void doWordReader(String direcToryPath,String excelPath)
	{
		HashMap<String, List<String>> map=wordDirRead(direcToryPath);
		writeExcel(excelPath,map);
	}
	
	/**
	 * д��excel�ļ�
	 * @param excelPath
	 */
	@SuppressWarnings("resource")
	private static void writeExcel(String excelPath,HashMap<String, List<String>> map)
	{
		String[] headers = { "����", "���ڵ�λ", "ְ��", "ͨ�ŵ�ַ","�Ա�","ְ��","�ʱ�","�ֻ�","�칫�绰","��������","�����","��ע","�ĵ�����","������" };
		int columnNum=headers.length;
		// ����һ��������
		HSSFWorkbook workbook = new HSSFWorkbook();
		// ����һ�����
		HSSFSheet sheet = workbook.createSheet("������");
//		// ���ñ��Ĭ���п��Ϊ15���ֽ�
//		sheet.setDefaultColumnWidth(15);
		
		//�����ʽ
		HSSFCellStyle style = workbook.createCellStyle();
		style.setWrapText(true);
		style.setAlignment(HorizontalAlignment.LEFT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		HSSFFont font  = workbook.createFont();
		//��������
		font.setFontHeightInPoints((short)12);
		font.setFontName("����");
		style.setFont(font);
		
		// ������������
		HSSFRow row = sheet.createRow(0);
		for (int i = 0; i < columnNum; i++) {
			HSSFCell cell = row.createCell(i);
			HSSFRichTextString text = new HSSFRichTextString(headers[i]);
			cell.setCellValue(text);
			cell.setCellStyle(style);
		}
		
		//������ȡ��ǰmap�е�����
		Iterator<Entry<String, List<String>>> iterator=map.entrySet().iterator();
		int index=0;
		while(iterator.hasNext())
		{
			index++;
			Entry<String, List<String>> next = iterator.next();
			HSSFCell[] cells=new HSSFCell[columnNum];
			//����һ�б��
			row = sheet.createRow(index);
			//�����ȡ�������Ϣ
			if(next.getValue()!=null)
			{
				int k=0;
				for(String str:next.getValue())
				{
					//word�ж�ȡ�Ļ��У��س����û��з��滻
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
				cells[13].setCellValue("�ɹ�");
			}else{
				cells[13]=row.createCell(14);
				cells[13].setCellStyle(style);
				cells[13].setCellValue("ʧ��");
			}
			cells[12]=row.createCell(12);
			cells[12].setCellStyle(style);
			cells[12].setCellValue(next.getKey());
		}
		
		//�Զ������п�
		for (int i = 0; i < columnNum; i++) {
			sheet.autoSizeColumn(i);
		}
		
		try {
			//���ȴ����ļ�
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
	 * ��ȡ�ļ���������word����ȡ������������
	 * @param direcToryPath
	 * @return
	 */
	private static HashMap<String, List<String>> wordDirRead(String direcToryPath)
	{
		HashMap<String, List<String>> map=new HashMap<String, List<String>>();
		
		File file=new File(direcToryPath);
		if(file.isDirectory()){
			//�����ļ����������ļ�
			for(String fileName:file.list())
			{
				//�ж�word�ļ�
				if("doc".equals(getExtension(fileName))||"docx".equals(getExtension(fileName)))
				{
					//��ȡword�ļ�����
					List<String> infoList = null;
					try {
						infoList = wordTableReader(direcToryPath+File.separator+fileName);
					} catch (Exception e) {
						
					}finally{
						//���۳ɹ����word�ĵ�ȫ����¼
						map.put(fileName, infoList);
					}
				}
			}
		}
		
		return map;
	}

	/**
	 * ��ȡword�ļ�
	 * @param path �����ļ�·��
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private static List<String> wordTableReader(String path)
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
			//�ر��ļ���
			fis.close();
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
					int k = 0;
					cells = row.getTableCells();
					for (XWPFTableCell cell : cells) 
					{
						if(k%2==1){
							infoList.add(cell.getText().trim());
						}
						k++;
					}
				}
			}
			//�ر��ļ���
			fis.close();
		}else{
			return null;
		}

		return infoList;
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
	 * �����ļ�
	 * @param filename �ļ�����
	 * @return
	 */
	public static boolean createFile(String destFileName){
		
		File file = new File(destFileName); 
		//������ڣ�����true
        if(file.exists()) {  
            return true;  
        }  
        if (destFileName.endsWith(File.separator)) {  
            return false;  
        }
        //�ж�Ŀ���ļ����ڵ�Ŀ¼�Ƿ����  
        if(!file.getParentFile().exists()) {  
            //���Ŀ���ļ����ڵ�Ŀ¼�����ڣ��򴴽���Ŀ¼  
            if(!file.getParentFile().mkdirs()) {  
                return false;  
            }  
        }
        //����Ŀ���ļ�  
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
