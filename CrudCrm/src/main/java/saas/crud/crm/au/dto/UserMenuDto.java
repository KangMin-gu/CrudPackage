package saas.crud.crm.au.dto;

public class UserMenuDto {
	
	private int usermenuno;
	private int siteid;
	private int userno;
	private int menuno;
	private int isdelete;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	
	public UserMenuDto() {}

	public int getUsermenuno() {
		return usermenuno;
	}

	public void setUsermenuno(int usermenuno) {
		this.usermenuno = usermenuno;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getMenuno() {
		return menuno;
	}

	public void setMenuno(int menuno) {
		this.menuno = menuno;
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

	public UserMenuDto(int usermenuno, int siteid, int userno, int menuno, int isdelete, String regdate, int reguser,
			String edtdate, int edtuser) {
		super();
		this.usermenuno = usermenuno;
		this.siteid = siteid;
		this.userno = userno;
		this.menuno = menuno;
		this.isdelete = isdelete;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
	};
	
	
	

}
