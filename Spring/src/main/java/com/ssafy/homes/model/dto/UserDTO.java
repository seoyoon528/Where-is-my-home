package com.ssafy.homes.model.dto;

public class UserDTO {
	
	private int unum;
	private String uid;
	private String upw;
	private String uname;
	private String uaddr;
	private String utype;
	private String utoken;
	private String dongCode;
	private String sidoName;
	private String gugunName;
	private String dongName;
	
	///////////////////////////////////////////////
	
	public UserDTO() {}
	

	public UserDTO(String upw, String uname, String uaddr) {
		super();
		this.upw = upw;
		this.uname = uname;
		this.uaddr = uaddr;
	}


	public UserDTO(int unum, String uid, String upw, String uname, String uaddr, String utype, String utoken, String dongCode, String sidoName, String gugunName, String dongName) {
		
		this.unum = unum;
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.uaddr = uaddr;
		this.utype = utype;
		this.utoken = utoken;
		this.dongCode = dongCode;
		this.sidoName = sidoName;
		this.gugunName = gugunName;
		this.dongName = dongName;
	}
	
	public String getDongCode() {
		return dongCode;
	}


	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}


	public String getSidoName() {
		return sidoName;
	}


	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}


	public String getGugunName() {
		return gugunName;
	}


	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}


	public String getDongName() {
		return dongName;
	}


	public void setDongName(String dongName) {
		this.dongName = dongName;
	}


	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUaddr() {
		return uaddr;
	}

	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}

	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

	public String getUtoken() {
		return utoken;
	}


	public void setUtoken(String utoken) {
		this.utoken = utoken;
	}


	@Override
	public String toString() {
		return "UserDTO [unum=" + unum + ", uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uaddr=" + uaddr
				+ ", utype=" + utype + ", utoken=" + utoken + ", dongCode=" + dongCode + ", sidoName=" + sidoName
				+ ", gugunName=" + gugunName + ", dongName=" + dongName + "]";
	}


	
	
	
	
	

}
