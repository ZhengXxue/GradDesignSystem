package com.bean;

public class Manager {
	private int ID;
	private String MajorName;
	private String GradYear;
	private String StuNum;
	private String TimeStart;
	private String TimeEnd;
	private String IsPublished;
	private int Maxnum;
	private int radio;
	public int getMaxnum() {
		return Maxnum;
	}
	public void setMaxnum(int maxnum) {
		Maxnum = maxnum;
	}
	public int getRadio() {
		return radio;
	}
	public void setRadio(int radio) {
		this.radio = radio;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getMajorName() {
		return MajorName;
	}
	public void setMajorName(String majorName) {
		MajorName = majorName;
	}
	public String getGradYear() {
		return GradYear;
	}
	public void setGradYear(String gradYear) {
		GradYear = gradYear;
	}
	public String getStuNum() {
		return StuNum;
	}
	public void setStuNum(String stuNum) {
		StuNum = stuNum;
	}
	public String getTimeStart() {
		return TimeStart;
	}
	public void setTimeStart(String timeStart) {
		TimeStart = timeStart;
	}
	public String getTimeEnd() {
		return TimeEnd;
	}
	public void setTimeEnd(String timeEnd) {
		TimeEnd = timeEnd;
	}
	public String getIsPublished() {
		return IsPublished;
	}
	public void setIsPublished(String isPublished) {
		IsPublished = isPublished;
	}
	
}
