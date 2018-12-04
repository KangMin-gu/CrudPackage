package saas.crud.crm.sa.dto;

public class SalesCustDto {

	private int salescustno;
	private int siteid;
	private int custno;
	private int salesno;
	private String rolename;
	private int keyman;
	private String memo;
	private String regdate;
	private String edtdate;
	private int reguser;
	private int edtuser;
	private int isdelete;
	
	public SalesCustDto() {}

	public SalesCustDto(int salescustno, int siteid, int custno, int salesno, String rolename, int keyman, String memo,
			String regdate, String edtdate, int reguser, int edtuser, int isdelete) {
		super();
		this.salescustno = salescustno;
		this.siteid = siteid;
		this.custno = custno;
		this.salesno = salesno;
		this.rolename = rolename;
		this.keyman = keyman;
		this.memo = memo;
		this.regdate = regdate;
		this.edtdate = edtdate;
		this.reguser = reguser;
		this.edtuser = edtuser;
		this.isdelete = isdelete;
	}

	int getSalescustno() {
		return salescustno;
	}

	void setSalescustno(int salescustno) {
		this.salescustno = salescustno;
	}

	int getSiteid() {
		return siteid;
	}

	void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	int getCustno() {
		return custno;
	}

	void setCustno(int custno) {
		this.custno = custno;
	}

	int getSalesno() {
		return salesno;
	}

	void setSalesno(int salesno) {
		this.salesno = salesno;
	}

	String getRolename() {
		return rolename;
	}

	void setRolename(String rolename) {
		this.rolename = rolename;
	}

	int getKeyman() {
		return keyman;
	}

	void setKeyman(int keyman) {
		this.keyman = keyman;
	}

	String getMemo() {
		return memo;
	}

	void setMemo(String memo) {
		this.memo = memo;
	}

	String getRegdate() {
		return regdate;
	}

	void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	String getEdtdate() {
		return edtdate;
	}

	void setEdtdate(String edtdate) {
		this.edtdate = edtdate;
	}

	int getReguser() {
		return reguser;
	}

	void setReguser(int reguser) {
		this.reguser = reguser;
	}

	int getEdtuser() {
		return edtuser;
	}

	void setEdtuser(int edtuser) {
		this.edtuser = edtuser;
	}

	int getIsdelete() {
		return isdelete;
	}

	void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	
	
	
	
	
}
