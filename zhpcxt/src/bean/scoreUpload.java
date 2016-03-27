package bean;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.*;


public class scoreUpload {
//	  InputStream is = new  FileInputStream(sourcefile);      
//	  jxl.Workbook rwb = Workbook.getWorkbook(is); }  
//		catch (Exception e) {  e.printStackTrace(); }

    public void upload(String lujing, String cScoreTableName, String schoolYear, String term) {
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
        for (int j = 2; j < sheet.getRows(); j++) {
            Cell[] row = sheet.getRow(j);
//            String str = "'";
//            String val = "student_id,course_id,school_grades,schoolYear,term,score";
            for (int i = 0; i < row.length; i++) {
                if (j == 2) {
                    if (i > 3) {
                        String[] course = row[i].getContents().split("/");
                        String a = "'";
                        String b = "course_name,level,grades";
                        for (int m = 0; m < course.length; m++) {
                            if (m == course.length - 1) {
                                a += course[m] + "'";
                            } else {
                                a += course[m] + "','";
                            }
                        }
                        String sql = "insert into `course`(" + b + ")" + "values" + "(" + a + ")";
                        System.out.println("val=" + b + "\rstr=" + a);
                        ib.insertANDupdateANDdel(sql);
                    }
                } else {
                    String a1 = "'";
                    String a2 = "";
                    String b1 = "student_id,school_grades,score,course_id,school_year,term";
//                    if (i == 1 || i == 3) {
//                        a2 += row[i].getContents() + "','";
//                    }
                    if (i > 3) {
                        Cell[] row1 = sheet.getRow(2);
                        String[] course = row1[i].getContents().split("/");
                        String course_name = course[0];
                        AllBean array = new AllBean();
                        ArrayList courseQuery = array.getCourseOfName(course_name);
                        ArrayList id = (ArrayList)courseQuery.get(0);
                        String course_id = id.get(0).toString();
                        a2 = row[1].getContents() + "','" + row[3].getContents() + "','";
                        a1 += a2 + row[i].getContents() + "','" + course_id + "','" + schoolYear + "','" + term + "'";
                        String sql = "insert into `" + cScoreTableName + "`(" + b1 + ")" + "values" + "(" + a1 + ")";
                        System.out.println("val=" + b1 + "\rstr=" + a1);
                        ib.insertANDupdateANDdel(sql);
                    }
                }
            }
//            String sql = "insert into `" + cScoreTableName + "`(" + val + ")" + "values" + "(" + str + ")";
//            System.out.println("val=" + val + "\rstr=" + str);
//            ib.insertANDupdateANDdel(sql);
        }
    }
}