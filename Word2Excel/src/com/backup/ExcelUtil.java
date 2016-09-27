package com.backup;


import java.io.FileNotFoundException;  
import java.io.FileOutputStream;  
import java.io.IOException;  
 
import org.apache.poi.hssf.usermodel.HSSFWorkbook;  
import org.apache.poi.ss.usermodel.Sheet;  
import org.apache.poi.ss.usermodel.Workbook;  
 
public class ExcelUtil {  
     
   public static Sheet createSheet(String fileName, String sheetName)  
   {  
       Workbook wb = new HSSFWorkbook();  
       FileOutputStream fileOut = null;  
       Sheet sheet = null;  
         
       try {  
           fileOut = new FileOutputStream(fileName);  
           sheet = wb.createSheet(sheetName);  
           wb.write(fileOut);  
           fileOut.close();  
       } catch (FileNotFoundException e1) {  
           e1.printStackTrace();  
       } catch (IOException e) {  
           e.printStackTrace();  
       }  
         
       return sheet;  
   }  
     
   public static void saveSheet(String fileName, Sheet sheet)  
   {  
       FileOutputStream fileOut = null;  
         
       try {  
           fileOut = new FileOutputStream(fileName);  
           sheet.getWorkbook().write(fileOut);  
           fileOut.close();  
       } catch (FileNotFoundException e) {  
           e.printStackTrace();  
       } catch (IOException e) {  
           e.printStackTrace();  
       }  
   }  
}  