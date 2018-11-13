package saas.crud.crm.nt.dto;

public class NoteCategoryDto {
	
	private int userno; 
	private String category;
	private int reguser;
	private String regdate;
	private int edteuser;
	private String edtedate;
	private int siteid;
	private int isdelete;
	
	public NoteCategoryDto() {}

	public NoteCategoryDto(int userno, String category, int reguser, String regdate, int edteuser, String edtedate,
			int siteid, int isdelete) {
		super();
		this.userno = userno;
		this.category = category;
		this.reguser = reguser;
		this.regdate = regdate;
		this.edteuser = edteuser;
		this.edtedate = edtedate;
		this.siteid = siteid;
		this.isdelete = isdelete;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getEdteuser() {
		return edteuser;
	}

	public void setEdteuser(int edteuser) {
		this.edteuser = edteuser;
	}

	public String getEdtedate() {
		return edtedate;
	}

	public void setEdtedate(String edtedate) {
		this.edtedate = edtedate;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	
	
}
