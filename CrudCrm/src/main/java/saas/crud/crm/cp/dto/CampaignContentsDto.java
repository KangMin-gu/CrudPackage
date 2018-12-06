package saas.crud.crm.cp.dto;

public class CampaignContentsDto {
	
	private int no;
	private int formtype;
	private String title;
	private String content;
	private String purp;
	private int siteid;
	private int isdelete;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	
	public CampaignContentsDto() {};
	
	public CampaignContentsDto(int no, int formtype, String title, String content, String purp, int siteid, int isdelete,
			String regdate, int reguser, String edtdate, int edtuser) {
		super();
		this.no = no;
		this.formtype = formtype;
		this.title = title;
		this.content = content;
		this.purp = purp;
		this.siteid = siteid;
		this.isdelete = isdelete;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getFormtype() {
		return formtype;
	}


	public void setFormtype(int formtype) {
		this.formtype = formtype;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getPurp() {
		return purp;
	}


	public void setPurp(String purp) {
		this.purp = purp;
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
