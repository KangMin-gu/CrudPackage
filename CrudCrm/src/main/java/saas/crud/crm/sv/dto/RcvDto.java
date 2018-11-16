package saas.crud.crm.sv.dto;

public class RcvDto {
	
	private int rcvno;
	private int clino;
	private int custno;
	private int rcvtype;
	private String rcvdate;
	private String rcvtime;
	private String rcvcode;
	private String rcvname;
	private String rcvdesc;
	private int rcvchannel;
	private int rcvowner;
	private String rcvopinion;
	private int prcstate;
	private int isdelete;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int siteid;
	
	public RcvDto() {}

	
	public RcvDto(int rcvno, int clino, int custno, int rcvtype, String rcvdate, String rcvtime, String rcvcode,
			String rcvname, String rcvdesc, int rcvchannel, int rcvowner, String rcvopinion, int prcstate, int isdelete,
			String regdate, int reguser, String edtdate, int edtuser, int siteid) {
		super();
		this.rcvno = rcvno;
		this.clino = clino;
		this.custno = custno;
		this.rcvtype = rcvtype;
		this.rcvdate = rcvdate;
		this.rcvtime = rcvtime;
		this.rcvcode = rcvcode;
		this.rcvname = rcvname;
		this.rcvdesc = rcvdesc;
		this.rcvchannel = rcvchannel;
		this.rcvowner = rcvowner;
		this.rcvopinion = rcvopinion;
		this.prcstate = prcstate;
		this.isdelete = isdelete;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.siteid = siteid;
	}


	public int getRcvno() {
		return rcvno;
	}

	public void setRcvno(int rcvno) {
		this.rcvno = rcvno;
	}

	public int getClino() {
		return clino;
	}

	public void setClino(int clino) {
		this.clino = clino;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public int getRcvtype() {
		return rcvtype;
	}

	public void setRcvtype(int rcvtype) {
		this.rcvtype = rcvtype;
	}

	public String getRcvdate() {
		return rcvdate;
	}

	public void setRcvdate(String rcvdate) {
		this.rcvdate = rcvdate;
	}

	public String getRcvtime() {
		return rcvtime;
	}

	public void setRcvtime(String rcvtime) {
		this.rcvtime = rcvtime;
	}

	public String getRcvcode() {
		return rcvcode;
	}

	public void setRcvcode(String rcvcode) {
		this.rcvcode = rcvcode;
	}

	public String getRcvname() {
		return rcvname;
	}

	public void setRcvname(String rcvname) {
		this.rcvname = rcvname;
	}

	public String getRcvdesc() {
		return rcvdesc;
	}

	public void setRcvdesc(String rcvdesc) {
		this.rcvdesc = rcvdesc;
	}

	public int getRcvchannel() {
		return rcvchannel;
	}

	public void setRcvchannel(int rcvchannel) {
		this.rcvchannel = rcvchannel;
	}

	public int getRcvowner() {
		return rcvowner;
	}

	public void setRcvowner(int rcvowner) {
		this.rcvowner = rcvowner;
	}

	public String getRcvopinion() {
		return rcvopinion;
	}

	public void setRcvopinion(String rcvopinion) {
		this.rcvopinion = rcvopinion;
	}

	public int getPrcstate() {
		return prcstate;
	}

	public void setPrcstate(int prcstate) {
		this.prcstate = prcstate;
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
}
	
	

