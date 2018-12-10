package saas.crud.crm.sa.dto;

public class ClientCustDto {

	private int clicustno;
	private int siteid;
	private int custno;
	private int clino;
	private String rolename;
	private int chksupport;
	private int keyman;
	private String memo;
	private String regdate;
	private String edtdate;
	private int reguser;
	private int edtuser;
	private int isdelete;
	
	public ClientCustDto() {}

	public ClientCustDto(int clicustno, int siteid, int custno, int clino, String rolename, int chksupport, int keyman,
			String memo, String regdate, String edtdate, int reguser, int edtuser, int isdelete) {
		super();
		this.clicustno = clicustno;
		this.siteid = siteid;
		this.custno = custno;
		this.clino = clino;
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

	public int getClicustno() {
		return clicustno;
	}

	public void setClicustno(int clicustno) {
		this.clicustno = clicustno;
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

	public int getClino() {
		return clino;
	}

	public void setClino(int clino) {
		this.clino = clino;
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
