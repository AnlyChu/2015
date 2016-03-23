package bean;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jxl.*;


public class studentInfoUpload {
//	  InputStream is = new  FileInputStream(sourcefile);      
//	  jxl.Workbook rwb = Workbook.getWorkbook(is); }  
//		catch (Exception e) {  e.printStackTrace(); }

    public void upload(String lujing, String class_id) {
        Workbook workbook = null;
        try {
            workbook = Workbook.getWorkbook(new File(lujing));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Sheet sheet = workbook.getSheet(0);

//		Sheet[] sheetStringArr = workbook.getSheets();
//		System.out.println(sheetStringArr[0].getRow(0));
//		Cell c00=sheet.getCell(0,0);
//		System.out.println("c00��ֵ="+c00.getType());	
        InsertUpdateDelBean ib = new InsertUpdateDelBean();
        for (int j = 1; j < sheet.getRows(); j++) {
            Cell[] row = sheet.getRow(j);
            String str = "'";
            String val = "student_id,name,sex,IDCard,dept,pro,address,class_id";
            for (int i = 0; i < row.length; i++) {
                if (row[i].getContents() == null || row[i].getContents().equals("")) {
                    break;
                } else {
                    if (i == row.length - 1) {
                        str += row[i].getContents() + "'" + ",'" + class_id + "'";
                    } else {
                        str += row[i].getContents() + "','";
                    }
                }
            }
            if (str.equals("'")) {
                break;
            } else {
                String sql = "insert into student (" + val + ")values(" + str + ")";
                System.out.println("sql=" + sql);
                ib.insertANDupdateANDdel(sql);
            }
        }
    }
}