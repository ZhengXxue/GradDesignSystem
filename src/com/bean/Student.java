package com.bean;

public class Student {
	private String Sname;
	private String Sno;
	private String Spwd;
	public String getSpwd() {
		return Spwd;
	}
	public void setSpwd(String spwd) {
		Spwd = spwd;
	}
	private String Smajor;  //专业
	private String Sclass;    //年级
	private String Semail;
	private String Stel;
	private float GPA;
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getSno() {
		return Sno;
	}
	public void setSno(String sno) {
		Sno = sno;
	}
	public String getSmajor() {
		return Smajor;
	}
	public void setSmajor(String smajor) {
		Smajor = smajor;
	}
	public String getSclass() {
		return Sclass;
	}
	public void setSclass(String sclass) {
		Sclass = sclass;
	}
	public String getSemail() {
		return Semail;
	}
	public void setSemail(String semail) {
		Semail = semail;
	}
	public String getStel() {
		return Stel;
	}
	public void setStel(String stel) {
		Stel = stel;
	}
	public float getGPA() {
		return GPA;
	}
	public void setGPA(float gPA) {
		GPA = gPA;
	}
}
