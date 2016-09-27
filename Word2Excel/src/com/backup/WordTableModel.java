package com.backup;

import org.apache.poi.ss.usermodel.Cell;  
import org.apache.poi.ss.usermodel.Row;  
import org.apache.poi.ss.usermodel.Sheet;
  
public class WordTableModel {  
  
    public static  String SINGLE_WORD = "^[a-z][A-Z]$";  
    public static  String SINGLE_NUMBER = "^[0-9]$";  
    public static  String SINGLE_VAR = "^[0-9a-zA-Z_]$";  
    public static  String PSTN = "^[0-9]{4}[- ]?[0-9]{7}$"; // �̶�����  
    public static  String MSISDN = "^1[0-9]{10}$"; // �ƶ�����  
    public static  String IDCARD = "(^\\d{15}$)|(^\\d{17}([0-9]|[Xx])$)"; //���֤  
    public static  String EMAIL = "^\\w{3,}@\\w.{3,}\\w{2,}$"; // �����ʼ�  
      
    private String[][] table = new String[100000][1000];  
    private int curColumn = 0;  
    private int curRow = 0;  
  
    public void autoMap(String value)  
    {  
        table[curRow][curColumn] = value;  
        curColumn++;  
    }  
      
    public void resetMap()  
    {  
        curColumn = 0;  
        curRow++;  
    }  
      
    public void endAutoMap()  
    {  
        curRow++;  
    }  
      
    /** 
     * @param fileName 
     */  
    public void save2Excel(String fileName, String sheetName)  
    {  
        Sheet sheet = ExcelUtil.createSheet(fileName, sheetName);  
          
        for(int i = 0; i < curRow; i++)  
        {  
            Row row = sheet.createRow(i);  
              
            for(int j = 0; j < curColumn; j++)  
            {  
                Cell cell = row.createCell(j);  
                cell.setCellValue(table[i][j]);  
            }  
        }  
          
        ExcelUtil.saveSheet(fileName, sheet);  
    }  
      
}  
