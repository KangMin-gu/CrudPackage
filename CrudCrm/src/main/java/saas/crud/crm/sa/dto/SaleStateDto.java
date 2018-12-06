package saas.crud.crm.sa.dto;

public class SaleStateDto {
	
	private int salestateno;
	private int siteid;
	private String entdate;
	private int state;
	private int modreason;
	private String ssdesc;
	private int prestate;
	private int reguser;
	private String regdate;
	private int edtuser;
	private String edtdate;
	private int salesno;
	private int prob;
	private String preentdate;
	private int duration;
	private int aprvuser;
	private int aprvtype;
	private String returnval;
	
	public SaleStateDto() {}

	public SaleStateDto(int salestateno, int siteid, String entdate, int state, int modreason, String ssdesc,
			int prestate, int reguser, String regdate, int edtuser, String edtdate, int salesno, int prob,
			String preentdate, int duration, int aprvuser, int aprvtype, String returnval) {
		super();
		this.salestateno = salestateno;
		this.siteid = siteid;
		this.entdate = entdate;
		this.state = state;
		this.modreason = modreason;
		this.ssdesc = ssdesc;
		this.prestate = prestate;
		this.reguser = reguser;
		this.regdate = regdate;
		this.edtuser = edtuser;
		this.edtdate = edtdate;
		this.salesno = salesno;
		this.prob = prob;
		this.preentdate = preentdate;
		this.duration = duration;
		this.aprvuser = aprvuser;
		this.aprvtype = aprvtype;
		this.returnval = returnval;
	}

	public int getSalestateno() {
		return salestateno;
	}

	public void setSalestateno(int salestateno) {
		this.salestateno = salestateno;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public String getEntdate() {
		return entdate;
	}

	public void setEntdate(String entdate) {
		this.entdate = entdate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getModreason() {
		return modreason;
	}

	public void setModreason(int modreason) {
		this.modreason = modreason;
	}

	public String getSsdesc() {
		return ssdesc;
	}

	public void setSsdesc(String ssdesc) {
		this.ssdesc = ssdesc;
	}

	public int getPrestate() {
		return prestate;
	}

	public void setPrestate(int prestate) {
		this.prestate = prestate;
	}

	public int getReguser() {
		return reguser;
	}

	public void setReguser(int reguser) {
		this.reguser = reguser;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getEdtuser() {
		return edtuser;
	}

	public void setEdtuser(int edtuser) {
		this.edtuser = edtuser;
	}

	public String getEdtdate() {
		return edtdate;
	}

	public void setEdtdate(String edtdate) {
		this.edtdate = edtdate;
	}

	public int getSalesno() {
		return salesno;
	}

	public void setSalesno(int salesno) {
		this.salesno = salesno;
	}

	public int getProb() {
		return prob;
	}

	public void setProb(int prob) {
		this.prob = prob;
	}

	public String getPreentdate() {
		return preentdate;
	}

	public void setPreentdate(String preentdate) {
		this.preentdate = preentdate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getAprvuser() {
		return aprvuser;
	}

	public void setAprvuser(int aprvuser) {
		this.aprvuser = aprvuser;
	}

	public int getAprvtype() {
		return aprvtype;
	}

	public void setAprvtype(int aprvtype) {
		this.aprvtype = aprvtype;
	}

	public String getReturnval() {
		return returnval;
	}

	public void setReturnval(String returnval) {
		this.returnval = returnval;
	}
	
	
	
}
