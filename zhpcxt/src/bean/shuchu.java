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
		String[] title={"ѧ����","ѧ��","���ѧ��","��·��ģ����Ӽ���ʵ��/���޿�/1","�й����ִ�ʷ��Ҫ/���޿�/2","��ѧ����A1/���޿�/3.25","������Կγ����/���޿�/1","�������/���޿�/3","��ѧӢ��A2/���޿�/4","��·��ģ����Ӽ���/ѡ�޿�/4","�ߵ���ѧA2/���޿�/5"};
		String path="D:/����ɼ�.xls";
		WritableWorkbook wwb;   
        // �½���һ��jxl�ļ�,����d��������testJXL.xls   
       OutputStream os = new FileOutputStream(path);   
       wwb=Workbook.createWorkbook(os); 
       WritableSheet sheet = wwb.createSheet("ѧ���ɼ�", 0);
       ArrayList myscore = null;
       AllBean array=new AllBean();
       myscore = array.getMyScore(student);
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
       // �ر��ļ�   
       wwb.close(); 
	}

}