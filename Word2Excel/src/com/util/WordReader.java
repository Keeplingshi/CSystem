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
 * word��ȡ
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

		/** 1. ��ȡWORD������� */
		HWPFDocument doc = null;

		try {
			doc = new HWPFDocument(new FileInputStream(path));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// ����range��Χ�ڵ�table��
		TableIterator tableIter = new TableIterator(doc.getRange());
		Table table;
		TableRow row;
		TableCell cell;
		List<String> infoList=new ArrayList<>(0);
		while (tableIter.hasNext()) {
			// ��ȡ��ǰ�ı�����
			table = tableIter.next();
			int rowNum = table.numRows(); // ��ȡ����ж�����
			for (int j = 0; j < rowNum; j++) {
				//��ȡÿһ�б��
				row = table.getRow(j);
				//��ȡ���б���еı��Ԫ
				int cellNum = row.numCells();
				for (int k = 0; k < cellNum; k++) {
					cell = row.getCell(k);
					// �����Ԫ����ı�
					if(k%2==1){
						infoList.add(cell.text().trim());
					}
				}
			}
		}

		return infoList;
	}

}
