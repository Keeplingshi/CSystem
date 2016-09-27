package com.backup;

import java.io.FileInputStream;

import org.apache.poi.hwpf.HWPFDocument;

public class WordTable {  
    
    /** 
     * ת��WORD�еı�����ݵ�EXCEL 
     */  
    public static void wordTable2Excel()  
    {
        String docName = "D:/Data/test1.doc";  
          
        /** 1. ��ȡWORD������� */  
        HWPFDocument doc = null;
          
        try {  
            doc = new HWPFDocument(new FileInputStream(docName));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }   
          
        String text = doc.getRange().text();  
        System.out.println(text);
          
        /** 2. ���÷ָ���:�����ɼ��ַ�ʹ�ÿո�(32)�滻 */  
        char[] charArray = text.toCharArray();  
          
        for(int i = 0; i < charArray.length; i++)  
        {  
            if (charArray[i] <= 31)  
            {  
                charArray[i] = 32;  
            }  
        }  
          
        text = String.valueOf(charArray);  
          
        /** 3. �������ÿո���Ƭ */  
        String[] textArray = text.trim().replaceAll("[ ]+", " ").split(" ");  
          
        /** 4.�����ݼ��ص�WORD���ģ�Ͷ��� */  
        WordTableModel wtm = new WordTableModel();  
          
        for(int i = 0; i < textArray.length; i++)  
        {  
            String s = textArray[i].trim();  
              
            // ���׵�Ԫ������ƥ��  
            if (s.matches("^[a-zA-Z]$") || s.matches("^[0-9]{2}$") || s.matches("^[0-9]{3}$") || s.matches("^[0-9]{4}$"))  
            {  
                // ����   
                wtm.resetMap();  
            }  
              
            // ��������, ÿ�����ݰ�˳����� ����Ӧ��Ԫ��  
            wtm.autoMap(s.trim());  
              
        }  
          
        // ��������  
        wtm.endAutoMap();  
          
        /** 5. ���浽EXCEL�ļ�*/  
        wtm.save2Excel("D:/Data\\test.xls", "sheet1");  
          
    }  
}  
