package com.util;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;

import com.backup.WordTable;

/**
 * word读取
 * 
 * @author chenbin
 * 
 */
public class WordReader {

	public static void main(String[] args) {
		String path="D:/Data/test1.doc";
		List<String> infoList=wordTableReader(path);
		
		for(String s:infoList){
			System.out.println(s);
		}
	}

	public static List<String> wordTableReader(String path) {

		/** 1. 读取WORD表格内容 */
		HWPFDocument doc = null;

		try {
			doc = new HWPFDocument(new FileInputStream(path));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 遍历range范围内的table。
		TableIterator tableIter = new TableIterator(doc.getRange());
		Table table;
		TableRow row;
		TableCell cell;
		List<String> infoList=new ArrayList<>(0);
		while (tableIter.hasNext()) {
			// 获取当前的表格对象
			table = tableIter.next();
			int rowNum = table.numRows(); // 获取表格有多少行
			for (int j = 0; j < rowNum; j++) {
				//获取每一行表格
				row = table.getRow(j);
				//获取该行表格中的表格单元
				int cellNum = row.numCells();
				for (int k = 0; k < cellNum; k++) {
					cell = row.getCell(k);
					// 输出单元格的文本
					if(k%2==1){
						infoList.add(cell.text().trim());
					}
				}
			}
		}

		return infoList;
	}

}
