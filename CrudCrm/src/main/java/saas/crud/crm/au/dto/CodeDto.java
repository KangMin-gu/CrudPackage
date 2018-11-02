package saas.crud.crm.au.dto;

public class CodeDto {
	
	private int codeno;
	private String codegrp;
	private String codename;
	private String codeval;
	private String uppercode;
	private String regdate;
	private int reguser;
	private String edtdate;
	private String edtuser;
	private int isdelete;
	
	public CodeDto() {};
	
	
	public int getCodeno() {
		return codeno;
	}
	public void setCodeno(int codeno) {
		this.codeno = codeno;
	}
	public String getCodegrp() {
		return codegrp;
	}
	public void setCodegrp(String codegrp) {
		this.codegrp = codegrp;
	}
	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public String getCodeval() {
		return codeval;
	}
	public void setCodeval(String codeval) {
		this.codeval = codeval;
	}
	public String getUppercode() {
		return uppercode;
	}
	public void setUppercode(String uppercode) {
		this.uppercode = uppercode;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReguser() {
		return reguser;
	}
	public void setReguser(int reguser) {
		this.reguser = reguser;
	}
	public String getEdtdate() {
		return edtdate;
	}
	public void setEdtdate(String edtdate) {
		this.edtdate = edtdate;
	}
	public String getEdtuser() {
		return edtuser;
	}
	public void setEdtuser(String edtuser) {
		this.edtuser = edtuser;
	}
	public int getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	public CodeDto(int codeno, String codegrp, String codename, String codeval, String uppercode, String regdate,
			int reguser, String edtdate, String edtuser, int isdelete) {
		super();
		this.codeno = codeno;
		this.codegrp = codegrp;
		this.codename = codename;
		this.codeval = codeval;
		this.uppercode = uppercode;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.isdelete = isdelete;
	}
	

}
