package com.util;

import java.io.File;
import java.io.IOException;

public class FileUtil {

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
