package bean;

import java.util.ArrayList;

public class AllBean {
	SelectBean sb = new SelectBean();
	ArrayList al = null;
	
	public ArrayList getAllAdmin(String user_id){
		String sql = "select * from user where id!=1 and user_id!="+user_id+" and status='辅导员' " + "order by id desc";
		String args[] = {"user_id","name","pwd","status"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getAllCounsellor(){
		String sql = "select * from user where status='辅导员' ";
		String args[] = {"user_id","name","pwd","status"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getCounsellor(){
		String sql = "select distinct(name) from user where status='辅导员' ";
		String args[] = {"name"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getAllCounsellor(String user_id){
		String sql = "select * from user where user_id="+user_id;
		String args[] = {"user_id","name","pwd","status"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getBjs(){
		String sql = "select distinct(nj) from bj ";
		String args[] = {"nj"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getMgrClass(String name){
		String sql = "select * from class where mgr='"+name+"'";
		String args[] = {"class_id","grade","dept","pro","class","mgr"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getVerify(){
		String sql = "select * from verify order by id desc";
		String args[] = {"id","student","name","addsubtract","score","reason","dates","evaluating","state"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getVerify(String id){
		String sql = "select * from verify where id="+id;
		String args[] = {"id","student","name","addsubtract","score","reason","dates","evaluating","state"};
		al = sb.selectRow(args, sql);
		return al;
	}
	
	public ArrayList getSportsgrade(){
		String sql = "select * from sportsgrade order by id desc";
		String args[] = {"id","student","grade","dates","evaluating","state"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getSportsgradeOne(String id){
		String sql = "select * from sportsgrade where id="+id;
		String args[] = {"id","student","grade","dates","evaluating","state"};
		al = sb.selectRow(args, sql);
		return al;
	}
	
	public ArrayList getIntellectualgrade(){
		String sql = "select * from intellectualgrade order by id desc";
		String args[] = {"id","student","term","name","grade","dates","evaluating","state"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getIntellectualgradeOne(String id){
		String sql = "select * from intellectualgrade where id="+id;
		String args[] = {"id","student","term","name","grade","dates","evaluating","state"};
		al = sb.selectRow(args, sql);
		return al;
	}
	
	public ArrayList getVerify(String type,String student){
		String sql = "select * from verify where name='"+type+"' and student="+student;
		String args[] = {"id","student","name","addsubtract","score","reason","dates","evaluating","state"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getSportsgrade(String student){
		String sql = "select * from sportsgrade where student="+student;
		String args[] = {"id","student","grade","dates","evaluating","state"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getIntellectualgrade(String student){
		String sql = "select * from intellectualgrade where student="+student;
		String args[] = {"id","student","term","name","grade","dates","evaluating","state"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getMyTest(String student){
		String sql="select * from yuanjingjihua where student="+student+"order by xueqi asc";
		String args[]={"student","xueqi","text"};
		al=sb.select(sql,args);
		return al;
	}
	public ArrayList getClassScore(String class_id){
		String sql = "select * from "+class_id;
		String args[] = {"student_id","sName","class_score_table","term","course_id","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getMyScore(){
		String sql = "select * from score1 ";
		String args[] = {"student_id","sName","class_score_table","term","course_id","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getStuScoreTableName(String class_id){
		String sql = "select class_score_table from class where class_id="+class_id;
		String args[] = {"class_score_table"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getStuScore(String student_id,String class_score_table){
		String sql = "select * from `" + class_score_table + "` where student_id="+student_id;
		String args[] = {"student_id","school_year","term","course_id","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getStuScoreOfSchoolYear(String student_id,String class_score_table,String school_year){
		String sql = "select * from `" + class_score_table + "` where student_id="+student_id + " and school_year = '" + school_year + "'";
		String args[] = {"student_id","school_year","term","course_id","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getStuScoreOfTerm(String student_id,String class_score_table,String school_year,String term){
		String sql = "select * from `" + class_score_table + "` where student_id="+student_id + " and school_year = '" + school_year + "' and term ='" + term + "'";
		String args[] = {"student_id","school_year","term","course_id","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getStuScoreOfclassId(String student_id,String class_score_table,String school_year,String term){
		String sql = "select * from `" + class_score_table + "` where student_id="+student_id + " and school_year = '" + school_year + "' and term ='" + term + "'";
		String args[] = {"student_id","school_year","term","course_id","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getStuScoreOfcourseId(String student_id,String course_id,String class_score_table){
		String sql = "select score from `" + class_score_table + "` where student_id="+student_id + " and course_id="+course_id;
		String args[] = {"score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getCourse(String course_id){
		String sql = "select * from course where id="+course_id;
		String args[] = {"id","course_name","level","grades"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getAllCourse(String tableName){
		String sql = "select distinct(course_id) from `" + tableName + "`";
		String args[] = {"course_id"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getAllCourseSchoolYear(String tableName){
		String sql = "select distinct(school_year) from `" + tableName + "`";
		String args[] = {"school_year"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getAllCourseForSchoolYear(String tableName,String schoolYear){
		String sql = "select distinct(course_id) from `" + tableName + "` where school_year='" + schoolYear + "'";
		String args[] = {"course_id"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getAllCourseForTerm(String tableName,String schoolYear,String term){
		String sql = "select distinct(course_id) from `" + tableName + "` where term='" + term + "' and school_year = '" + schoolYear + "'";
		String args[] = {"course_id"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getCourseName(String course_id){
		String sql = "select distinct(course_name) from course where id="+course_id;
		String args[] = {"course_name"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getCourse(){
		String sql = "select * from course ";
		String args[] = {"course_id","courseName"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getCourseOfName(String name){
		String sql = "select id from course where course_name = '" + name + "'";
		String args[] = {"id"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getCourseScore(String course_id,String class_id){
		String sql = "select * from `"+ class_id + "` where course_id = '" + course_id + "'";
		String args[] = {"student_id","course_id","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getAllBj(){
		String sql = "select distinct class_id,grade,dept,pro,class,mgr from class ";
		String args[] = {"class_id","grade","dept","pro","class","mgr"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getBjofPro(String pro){
		String sql = "select * from class where pro='"+pro+"'";
		String args[] = {"class_id","grade","dept","pro","class","mgr"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getBjofPro(){
		String sql = "select distinct(pro) from class ";
		String args[] = {"pro"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getBjofGrade(String grade){
		String sql = "select * from class where grade='"+grade+"'";
		String args[] = {"class_id","grade","dept","pro","class","mgr"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getBjofGrade(){
		String sql = "select distinct(grade)  from class";
		String args[] = {"grade"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getBj(String class_id){
		String sql = "select distinct(mgr) from class where class_id='"+class_id+"'";
		String args[] = {"mgr"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getBjInfo(String class_id){
		String sql = "select * from class where class_id='"+class_id+"'";
		String args[] = {"class_id","grade","dept","pro","class","mgr"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getSzcp(String student){
		String sql = "select * from szcp where student="+student;
		String args[] = {"student","dd","xx","sz","zj","zf"};
		al = sb.select(sql,args);
		return al;
	}
	
	public ArrayList getClassesScore(String classes,String score){
		String sql = "select a.*,cast(cast(a.moral as float)*0.35+cast(a.intellectual as float)*0.5+cast(a.sports as float)*0.05+cast(a.ability as float)*0.1 as decimal(20,2)) as zhonghe,b.truename as name from score a,student b where a.student=b.id and b.classes='"+classes+"' order by "+score+" desc";
		String args[] = {"id","student","moral","intellectual","sports","ability","zhonghe","name"};
		al = sb.select(sql, args);
		return al;
	}
	

	public ArrayList getSchYear(String class_id){
		String sql = "select distinct(school_year) from `" + class_id + "`";
		String args[] = {"school_year"};
		al = sb.select(sql,args);
		return al;
	}

	public ArrayList getScoreOfSchYear(String SchYear,String tableName,String student_id){
		String sql = "select * from `" + tableName + "` where school_year='"+SchYear+"' and student_id = " + student_id;
		String args[] = {"student_id","course_id","school_grades","school_year","term","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getTerm(String class_id){
		String sql = "select distinct(term) from `" + class_id + "`";
		String args[] = {"term"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getScoreOfTerm(String term,String SchYear,String tableName){
		String sql = "select * from `" + tableName + "` where term=" + term + " and school_year='"+SchYear+"'";
		String args[] = {"student_id","course_id","school_grades","school_year","term","score"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getClassStudent(String class_id){
		String sql = "select * from student where class_id="+class_id;
		String args[] = {"student_id","name","sex","class_id","IDCard","dept","pro","address"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getStudentId(String class_id,String SchYear){
		String sql = "select distinct(student_id) from `" + class_id + "` where school_year='"+SchYear+"'";
		String args[] = {"student_id"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getStudentId(String class_id,String SchYear,String term){
		String sql = "select distinct(student_id) from `" + class_id + "` where school_year='"+SchYear+"' and term = '" + term +"'";
		String args[] = {"student_id"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getStudent(){
		String sql = "select * from student";
		String args[] = {"student_id","name","sex","class_id","IDCard","dept","pro","address"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getStudent(String student_id){
		String sql = "select * from student where student_id="+student_id;
		String args[] = {"student_id","name","sex","class_id","IDCard","dept","pro","address"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getStudentOfKeys(String keys){
		String sql = "select * from student where student_id like '%" + keys + "%' or name like '%" + keys + "%'";
		String args[] = {"student_id","name","sex","class_id","IDCard","dept","pro","address"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getEvaluating(String student_id,String school_year,String tableName){
		String sql = "select distinct(school_year) from evaluating where school_year='" + school_year + "' and class_id = '" + tableName + "' and student_id =" + student_id;
		String args[] = {"school_year"};
		al = sb.selectRow(args, sql);
		return al;
	}
	
	public ArrayList getEvaluating(String class_id){
		String sql = "select * from evaluating where class_id='" + class_id + "' order by sum desc";
		String args[] = {"student_id","school_year","daodesuyang","studying","suzhituozhan","doPlusOrSub","sum"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getAllclassId(){
		String sql = "select distinct(class_id) from student";
		String args[] = {"class_id"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getAllSchoolYear(String class_id){
		String sql = "select distinct(school_year) from `" + class_id + "`";
		String args[] = {"school_year"};
		al = sb.select(sql, args);
		return al;
	}
}
