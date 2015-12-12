package bean;

import java.awt.Label;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.*;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import bean.AllBean;
public class shuchu{
//	  InputStream is = new  FileInputStream(sourcefile);      
//	  jxl.Workbook rwb = Workbook.getWorkbook(is); }  
//		catch (Exception e) {  e.printStackTrace(); }


	public void shuchu(String student) throws IOException, RowsExceededException, WriteException{ 
		String[] title={"学生号","学期","获得学分","电路与模拟电子技术实验/必修课/1","中国近现代史纲要/必修课/2","大学物理A1/必修课/3.25","汇编语言课程设计/必修课/1","汇编语言/必修课/3","大学英语A2/必修课/4","电路与模拟电子技术/选修课/4","高等数学A2/必修课/5"};
		String path="D:/输出成绩.xls";
		WritableWorkbook wwb;   
        // 新建立一个jxl文件,即在d盘下生成testJXL.xls   
       OutputStream os = new FileOutputStream(path);   
       wwb=Workbook.createWorkbook(os); 
       WritableSheet sheet = wwb.createSheet("学生成绩", 0);
       ArrayList myscore = null;
       AllBean array=new AllBean();
      // myscore = array.getMyScore(student);
       for(int i=0;i<title.length;i++){    	   
    		   jxl.write.Label label=new jxl.write.Label(i,0,title[i]);   
    	   	   sheet.addCell(label);
       }       
       for(int i=0;i<myscore.size();i++){
    	   ArrayList myscore1 = (ArrayList)myscore.get(i);
    	   for(int j=0;j<title.length;j++){    		  
    		   System.out.println(myscore1.get(j).toString());
    		   jxl.write.Label label=new jxl.write.Label(j,i+1,myscore1.get(j).toString());   		  
    	   	   sheet.addCell(label);
    	   }
       } 
       wwb.write();   
       // 关闭文件   
       wwb.close(); 
	}

}