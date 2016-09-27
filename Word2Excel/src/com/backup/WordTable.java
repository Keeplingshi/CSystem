package com.backup;

import java.io.FileInputStream;

import org.apache.poi.hwpf.HWPFDocument;

public class WordTable {  
    
    /** 
     * 转换WORD中的表格内容到EXCEL 
     */  
    public static void wordTable2Excel()  
    {
        String docName = "D:/Data/test1.doc";  
          
        /** 1. 读取WORD表格内容 */  
        HWPFDocument doc = null;
          
        try {  
            doc = new HWPFDocument(new FileInputStream(docName));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }   
          
        String text = doc.getRange().text();  
        System.out.println(text);
          
        /** 2. 放置分隔符:将不可见字符使用空格(32)替换 */  
        char[] charArray = text.toCharArray();  
          
        for(int i = 0; i < charArray.length; i++)  
        {  
            if (charArray[i] <= 31)  
            {  
                charArray[i] = 32;  
            }  
        }  
          
        text = String.valueOf(charArray);  
          
        /** 3. 将内容用空格切片 */  
        String[] textArray = text.trim().replaceAll("[ ]+", " ").split(" ");  
          
        /** 4.将数据加载到WORD表格模型对象 */  
        WordTableModel wtm = new WordTableModel();  
          
        for(int i = 0; i < textArray.length; i++)  
        {  
            String s = textArray[i].trim();  
              
            // 行首单元格正则匹配  
            if (s.matches("^[a-zA-Z]$") || s.matches("^[0-9]{2}$") || s.matches("^[0-9]{3}$") || s.matches("^[0-9]{4}$"))  
            {  
                // 换行   
                wtm.resetMap();  
            }  
              
            // 加载数据, 每行内容按顺序加载 到相应单元格  
            wtm.autoMap(s.trim());  
              
        }  
          
        // 结束加载  
        wtm.endAutoMap();  
          
        /** 5. 保存到EXCEL文件*/  
        wtm.save2Excel("D:/Data\\test.xls", "sheet1");  
          
    }  
}  
