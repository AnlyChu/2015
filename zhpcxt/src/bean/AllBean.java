package bean;

import java.util.ArrayList;

public class AllBean {
	SelectBean sb = new SelectBean();
	ArrayList al = null;
	
	public ArrayList getAllAdmin(String id){
		String sql = "select * from admin where id!=1 and id!="+id+" and status='¸¨µ¼Ô±' order by id desc";
		String args[] = {"id","name","pwd","status"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getBjs(){
		String sql = "select distinct(nj) from bj ";
		String args[] = {"nj"};
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
	public ArrayList getMyScore(String student){
		String sql = "select * from chengji where student="+student+"order by xueqi asc";
		String args[] = {"student","xueqi","xf","dl","jds","wl","hb","hb2","yy","dl2","sx"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getMyScore(){
		String sql = "select * from chengji ";
		String args[] = {"student","xueqi","xf","dl","jds","wl","hb","hb2","yy","dl2","sx"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getAllBj(){
		String sql = "select * from bj ";
		String args[] = {"id","bj","rs","fdy","bjg"};
		al = sb.select(sql,args);
		return al;
	}
	
	public ArrayList getBj(String nj){
		String sql = "select * from bj where nj="+nj;
		String args[] = {"id","bj","rs","fdy","bjg"};
		al = sb.select(sql,args);
		return al;
	}
	public ArrayList getBj1(String fdy){
		String sql = "select * from bj where fdy='"+fdy+"'";
		String args[] = {"id","bj","rs","fdy","bjg"};
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
	
	public ArrayList getStudent(String id){
		String sql = "select * from student where id="+id;
		String args[] = {"id","xh","ksh","truename","sex","xszh","cc","sfzh","xy","zy","dz"};
		al = sb.selectRow(args, sql);
		return al;
	}
	
	public ArrayList getStudent(){
		String sql = "select * from student1 order by studentId desc";
		String args[] = {"studentId","name","sex","class","IDCard","dept","pro","address"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getEvaluating(String id){
		String sql = "select * from evaluating where id="+id;
		String args[] = {"id","name","pwd","truename","positions","sex","birthday","phone","address","postalcode","email"};
		al = sb.selectRow(args, sql);
		return al;
	}
	
	public ArrayList getEvaluating(){
		String sql = "select * from evaluating order by id desc";
		String args[] = {"id","name","pwd","truename","positions","sex","birthday","phone","address","postalcode","email"};
		al = sb.select(sql, args);
		return al;
	}
}
