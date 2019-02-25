package saas.crud.crm.au.dto;

public class NoticeDto {
	
	private int icnum;
	private String subject;
	private String linkurl;
	private int reguser;
	private String regdate;
	private int edtuser;
	private String edtdate;
	private int siteid;
	private String content;
	private int header;
	
	public NoticeDto() {}

	public NoticeDto(int icnum, String subject, String linkurl, int reguser, String regdate, int edtuser,
			String edtdate, int siteid, String content, int header) {
		super();
		this.icnum = icnum;
		this.subject = subject;
		this.linkurl = linkurl;
		this.reguser = reguser;
		this.regdate = regdate;
		this.edtuser = edtuser;
		this.edtdate = edtdate;
		this.siteid = siteid;
		this.content = content;
		this.header = header;
	}

	public int getIcnum() {
		return icnum;
	}

	public void setIcnum(int icnum) {
		this.icnum = icnum;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getLinkurl() {
		return linkurl;
	}

	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
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

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHeader() {
		return header;
	}

	public void setHeader(int header) {
		this.header = header;
	}
	
	
}
