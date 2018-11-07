package saas.crud.crm.sv.dto;

public class SvDto {
	
	private int serviceno;
	private int clino;
	private int custno;
	private int rcvtype;
	private String rcvdate;
	private String rcvtime;
	private String rcvcode;
	private String servicename;
	private String servicedesc;
	private int rcvchannel;
	private int rcvowner;
	private String ractopinion;
	private String ractdate;
	private String racttime;
	private String ractcode;
	private int prcstate;
	private String ractdesc;
	private int ractowner;
	private int isdelete;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int siteid;
	
	public SvDto() {}

	public int getServiceno() {
		return serviceno;
	}

	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
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

	public String getrcvcode() {
		return rcvcode;
	}

	public void setrcvcode(String rcvcode) {
		this.rcvcode = rcvcode;
	}

	public String getServicename() {
		return servicename;
	}

	public void setServicename(String servicename) {
		this.servicename = servicename;
	}

	public String getServicedesc() {
		return servicedesc;
	}

	public void setServicedesc(String servicedesc) {
		this.servicedesc = servicedesc;
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

	public String getRactopinion() {
		return ractopinion;
	}

	public void setRactopinion(String ractopinion) {
		this.ractopinion = ractopinion;
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

	public int getPrcstate() {
		return prcstate;
	}

	public void setPrcstate(int prcstate) {
		this.prcstate = prcstate;
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

	public SvDto(int serviceno, int clino, int custno, int rcvtype, String rcvdate, String rcvtime,
			String rcvcode, String servicename, String servicedesc, int rcvchannel, int rcvowner,
			String ractopinion, String ractdate, String racttime, String ractcode, int prcstate, String ractdesc,
			int ractowner, int isdelete, String regdate, int reguser, String edtdate, int edtuser, int siteid) {
		super();
		this.serviceno = serviceno;
		this.clino = clino;
		this.custno = custno;
		this.rcvtype = rcvtype;
		this.rcvdate = rcvdate;
		this.rcvtime = rcvtime;
		this.rcvcode = rcvcode;
		this.servicename = servicename;
		this.servicedesc = servicedesc;
		this.rcvchannel = rcvchannel;
		this.rcvowner = rcvowner;
		this.ractopinion = ractopinion;
		this.ractdate = ractdate;
		this.racttime = racttime;
		this.ractcode = ractcode;
		this.prcstate = prcstate;
		this.ractdesc = ractdesc;
		this.ractowner = ractowner;
		this.isdelete = isdelete;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.siteid = siteid;
	};
	

}
