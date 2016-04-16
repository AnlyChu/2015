package bean;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import java.io.File;
import java.util.ArrayList;


public class rateUpload {

    public void upload(String lujing, String cScoreTableName, String schoolYear) {
        Workbook workbook = null;
        try {
            workbook = Workbook.getWorkbook(new File(lujing));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Sheet sheet = workbook.getSheet(0);

        InsertUpdateDelBean ib = new InsertUpdateDelBean();
        for (int j = 3; j < sheet.getRows(); j++) {
            Cell[] row = sheet.getRow(j);
            String str = "'";
            String val = "student_id,name,daodesuyangBasic,daodesuyangPlus,daodesuyangSub,daodesuyang,studyBasic,studyPlus,studySub,studying,suzhituozhanBasic,suzhituozhanPlus,suzhituozhanSub,suzhituozhan,doPlus,doSub,doPlusOrSub,sum,class_id,school_year";
            for (int i = 1; i < row.length; i++) {
                if (row[i].getContents() == null || row[i].getContents().equals("")) {
                    break;
                } else {
                    if (i == row.length - 1) {
                        str += row[i].getContents() + "','" + cScoreTableName + "','" + schoolYear + "'";
                    } else {
                        str += row[i].getContents() + "','";
                    }
                }
            }
            if (str.equals("'")) {
                break;
            } else {
                String sql = "insert into evaluating (" + val + ")values(" + str + ")";
                System.out.println("sql=" + sql);
                ib.insertANDupdateANDdel(sql);
            }
        }
    }
}