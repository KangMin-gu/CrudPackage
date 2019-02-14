package saas.crud.crm.sa.dto;

public class SalesDto {

	private int salesno;
	private int siteid;
	private int clino;
	private String salename;
	private String prdname;
	private String need;
	private String custmemo;
	private String solution;
	private int relation;
	private String forddate;
	private String fordamount;
	private String prob;
	private String rorddate;
	private String rordamount;
	private String category;
	private String interest;
	private String statedate;
	private int salestate;
	private int owner;
	private int comreason;
	private int chkcomplete;
	private int priority;
	private int salecd;
	private int contno;
	private String regdate;
	private int reguser;
	private String editdate;
	private int edituser;
	private String refusal;
	private String surmount;
	private String salesmemo;
	private String lastcontactdate;
	private int isdelete;
	
	public SalesDto() {}

	public SalesDto(int salesno, int siteid, int clino, String salename, String prdname, String need, String custmemo,
			String solution, int relation, String forddate, String fordamount, String prob, String rorddate,
			String rordamount, String category, String interest, String statedate, int salestate, int owner,
			int comreason, int chkcomplete, int priority, int salecd, int contno, String regdate, int reguser,
			String editdate, int edituser, String refusal, String surmount, String salesmemo, String lastcontactdate,
			int isdelete) {
		super();
		this.salesno = salesno;
		this.siteid = siteid;
		this.clino = clino;
		this.salename = salename;
		this.prdname = prdname;
		this.need = need;
		this.custmemo = custmemo;
		this.solution = solution;
		this.relation = relation;
		this.forddate = forddate;
		this.fordamount = fordamount;
		this.prob = prob;
		this.rorddate = rorddate;
		this.rordamount = rordamount;
		this.category = category;
		this.interest = interest;
		this.statedate = statedate;
		this.salestate = salestate;
		this.owner = owner;
		this.comreason = comreason;
		this.chkcomplete = chkcomplete;
		this.priority = priority;
		this.salecd = salecd;
		this.contno = contno;
		this.regdate = regdate;
		this.reguser = reguser;
		this.editdate = editdate;
		this.edituser = edituser;
		this.refusal = refusal;
		this.surmount = surmount;
		this.salesmemo = salesmemo;
		this.lastcontactdate = lastcontactdate;
		this.isdelete = isdelete;
	}

	public int getSalesno() {
		return salesno;
	}

	public void setSalesno(int salesno) {
		this.salesno = salesno;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public int getClino() {
		return clino;
	}

	public void setClino(int clino) {
		this.clino = clino;
	}

	public String getSalename() {
		return salename;
	}

	public void setSalename(String salename) {
		this.salename = salename;
	}

	public String getPrdname() {
		return prdname;
	}

	public void setPrdname(String prdname) {
		this.prdname = prdname;
	}

	public String getNeed() {
		return need;
	}

	public void setNeed(String need) {
		this.need = need;
	}

	public String getCustmemo() {
		return custmemo;
	}

	public void setCustmemo(String custmemo) {
		this.custmemo = custmemo;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public int getRelation() {
		return relation;
	}

	public void setRelation(int relation) {
		this.relation = relation;
	}

	public String getForddate() {
		return forddate;
	}

	public void setForddate(String forddate) {
		this.forddate = forddate;
	}

	public String getFordamount() {
		return fordamount;
	}

	public void setFordamount(String fordamount) {
		this.fordamount = fordamount;
	}

	public String getProb() {
		return prob;
	}

	public void setProb(String prob) {
		this.prob = prob;
	}

	public String getRorddate() {
		return rorddate;
	}

	public void setRorddate(String rorddate) {
		this.rorddate = rorddate;
	}

	public String getRordamount() {
		return rordamount;
	}

	public void setRordamount(String rordamount) {
		this.rordamount = rordamount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getStatedate() {
		return statedate;
	}

	public void setStatedate(String statedate) {
		this.statedate = statedate;
	}

	public int getSalestate() {
		return salestate;
	}

	public void setSalestate(int salestate) {
		this.salestate = salestate;
	}

	public int getOwner() {
		return owner;
	}

	public void setOwner(int owner) {
		this.owner = owner;
	}

	public int getComreason() {
		return comreason;
	}

	public void setComreason(int comreason) {
		this.comreason = comreason;
	}

	public int getChkcomplete() {
		return chkcomplete;
	}

	public void setChkcomplete(int chkcomplete) {
		this.chkcomplete = chkcomplete;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public int getSalecd() {
		return salecd;
	}

	public void setSalecd(int salecd) {
		this.salecd = salecd;
	}

	public int getContno() {
		return contno;
	}

	public void setContno(int contno) {
		this.contno = contno;
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

	public String getEditdate() {
		return editdate;
	}

	public void setEditdate(String editdate) {
		this.editdate = editdate;
	}

	public int getEdituser() {
		return edituser;
	}

	public void setEdituser(int edituser) {
		this.edituser = edituser;
	}

	public String getRefusal() {
		return refusal;
	}

	public void setRefusal(String refusal) {
		this.refusal = refusal;
	}

	public String getSurmount() {
		return surmount;
	}

	public void setSurmount(String surmount) {
		this.surmount = surmount;
	}

	public String getSalesmemo() {
		return salesmemo;
	}

	public void setSalesmemo(String salesmemo) {
		this.salesmemo = salesmemo;
	}

	public String getLastcontactdate() {
		return lastcontactdate;
	}

	public void setLastcontactdate(String lastcontactdate) {
		this.lastcontactdate = lastcontactdate;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	
	
}
