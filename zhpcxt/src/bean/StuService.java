package bean;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jxl.*;


public class StuService{
//	  InputStream is = new  FileInputStream(sourcefile);      
//	  jxl.Workbook rwb = Workbook.getWorkbook(is); }  
//		catch (Exception e) {  e.printStackTrace(); }

	public void upload(String lujing){ 
		Workbook workbook=null;
		try{
			workbook=Workbook.getWorkbook(new File(lujing));	 
		}catch (Exception e) {
	     e.printStackTrace();
		} 

		Sheet sheet = workbook.getSheet(0);

//		Sheet[] sheetStringArr = workbook.getSheets();
//		System.out.println(sheetStringArr[0].getRow(0));
//		Cell c00=sheet.getCell(0,0);
//		System.out.println("c00µÄÖµ="+c00.getType());	
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		for(int j=1;j<sheet.getRows();j++){
			Cell[] row=sheet.getRow(j);
			String str="'";
			String val="student,xueqi,xf,dl,jds,wl,hb,hb2,yy,dl2,sx";
			for(int i=0;i<row.length;i++){
				if (i==row.length-1){
					str+=row[i].getContents()+"'";
				}
				else{
				str+=row[i].getContents()+"','"; 
				}						
			}
			String sql = "insert into dbo.chengji("+val+") values("+str+")";
			System.out.println("val="+val+"\rstr="+str);
			ib.insertANDupdateANDdel(sql);
		   }
	    }
}