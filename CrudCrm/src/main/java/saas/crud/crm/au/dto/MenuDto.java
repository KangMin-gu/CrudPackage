package saas.crud.crm.au.dto;

public class MenuDto {
	
	private int menuno;
	private String menuname;
	private int licenseno;
	private String menudesc;
	private String menuval;
	private int isdelete;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	
	public MenuDto() {};
	
	public MenuDto(int menuno, String menuname, int licenseno, String menudesc, String menuval, int isdelete,
			String regdate, int reguser, String edtdate, int edtuser) {
		super();
		this.menuno = menuno;
		this.menuname = menuname;
		this.licenseno = licenseno;
		this.menudesc = menudesc;
		this.menuval = menuval;
		this.isdelete = isdelete;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
	}
	public int getMenuno() {
		return menuno;
	}
	public void setMenuno(int menuno) {
		this.menuno = menuno;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public int getLicenseno() {
		return licenseno;
	}
	public void setLicenseno(int licenseno) {
		this.licenseno = licenseno;
	}
	public String getMenudesc() {
		return menudesc;
	}
	public void setMenudesc(String menudesc) {
		this.menudesc = menudesc;
	}
	public String getMenuval() {
		return menuval;
	}
	public void setMenuval(String menuval) {
		this.menuval = menuval;
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

}
