package saas.crud.crm.sa.dto;

public class SalesCustDto {

	private int salescustno;
	private int siteid;
	private int custno;
	private int salesno;
	private String rolename;
	private int chksupport;
	private int keyman;
	private String memo;
	private String regdate;
	private String edtdate;
	private int reguser;
	private int edtuser;
	private int isdelete;
	
	public SalesCustDto() {}

	public SalesCustDto(int salescustno, int siteid, int custno, int salesno, String rolename, int chksupport,
			int keyman, String memo, String regdate, String edtdate, int reguser, int edtuser, int isdelete) {
		super();
		this.salescustno = salescustno;
		this.siteid = siteid;
		this.custno = custno;
		this.salesno = salesno;
		this.rolename = rolename;
		this.chksupport = chksupport;
		this.keyman = keyman;
		this.memo = memo;
		this.regdate = regdate;
		this.edtdate = edtdate;
		this.reguser = reguser;
		this.edtuser = edtuser;
		this.isdelete = isdelete;
	}

	public int getSalescustno() {
		return salescustno;
	}

	public void setSalescustno(int salescustno) {
		this.salescustno = salescustno;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public int getSalesno() {
		return salesno;
	}

	public void setSalesno(int salesno) {
		this.salesno = salesno;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public int getChksupport() {
		return chksupport;
	}

	public void setChksupport(int chksupport) {
		this.chksupport = chksupport;
	}

	public int getKeyman() {
		return keyman;
	}

	public void setKeyman(int keyman) {
		this.keyman = keyman;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getEdtdate() {
		return edtdate;
	}

	public void setEdtdate(String edtdate) {
		this.edtdate = edtdate;
	}

	public int getReguser() {
		return reguser;
	}

	public void setReguser(int reguser) {
		this.reguser = reguser;
	}

	public int getEdtuser() {
		return edtuser;
	}

	public void setEdtuser(int edtuser) {
		this.edtuser = edtuser;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	

	
	
	
	
	
}
