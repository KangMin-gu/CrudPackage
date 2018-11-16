package saas.crud.crm.sv.dto;

public class RactDto {
	
	private int ractno;
	private int rcvno;
	private String ractdate;
	private String racttime;
	private String ractcode;
	private String ractdesc;
	private int ractowner;
	private int isdelete;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int siteid;
	
	public RactDto() {}
	
	public int getRactno() {
		return ractno;
	}
	public void setRactno(int ractno) {
		this.ractno = ractno;
	}
	public int getRcvno() {
		return rcvno;
	}
	public void setRcvno(int rcvno) {
		this.rcvno = rcvno;
	}
	public String getRactdate() {
		return ractdate;
	}
	public void setRactdate(String ractdate) {
		this.ractdate = ractdate;
	}
	public String getRacttime() {
		return racttime;
	}
	public void setRacttime(String racttime) {
		this.racttime = racttime;
	}
	public String getRactcode() {
		return ractcode;
	}
	public void setRactcode(String ractcode) {
		this.ractcode = ractcode;
	}
	public String getRactdesc() {
		return ractdesc;
	}
	public void setRactdesc(String ractdesc) {
		this.ractdesc = ractdesc;
	}
	public int getRactowner() {
		return ractowner;
	}
	public void setRactowner(int ractowner) {
		this.ractowner = ractowner;
	}
	public int getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
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
	public int getEdtuser() {
		return edtuser;
	}
	public void setEdtuser(int edtuser) {
		this.edtuser = edtuser;
	}
	public int getSiteid() {
		return siteid;
	}
	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}
	public RactDto(int ractno, int rcvno, String ractdate, String racttime, String ractcode, String ractdesc,
			int ractowner, int isdelete, String regdate, int reguser, String edtdate, int edtuser, int siteid) {
		super();
		this.ractno = ractno;
		this.rcvno = rcvno;
		this.ractdate = ractdate;
		this.racttime = racttime;
		this.ractcode = ractcode;
		this.ractdesc = ractdesc;
		this.ractowner = ractowner;
		this.isdelete = isdelete;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.siteid = siteid;
	}
	
	

}
