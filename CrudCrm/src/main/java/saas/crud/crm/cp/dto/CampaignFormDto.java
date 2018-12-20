package saas.crud.crm.cp.dto;

public class CampaignFormDto {
	
	private int no;
	private int campno;
	private int siteid;
	private String sender;
	private int sendtype;
	private String senddate;
	private int week;
	private int day;
	private String startdate;
	private String enddate;
	private int sendhour;
	private int sendminute;
	private int contentsno;
	private String title;
	private String senddesc;
	private String testmail;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int sendform;
	
	public CampaignFormDto() {}

	public CampaignFormDto(int no, int campno, int siteid, String sender, int sendtype, String senddate, int week,
			int day, String startdate, String enddate, int sendhour, int sendminute, int contentsno, String title,
			String senddesc, String testmail, String regdate, int reguser, String edtdate, int edtuser, int sendform) {
		super();
		this.no = no;
		this.campno = campno;
		this.siteid = siteid;
		this.sender = sender;
		this.sendtype = sendtype;
		this.senddate = senddate;
		this.week = week;
		this.day = day;
		this.startdate = startdate;
		this.enddate = enddate;
		this.sendhour = sendhour;
		this.sendminute = sendminute;
		this.contentsno = contentsno;
		this.title = title;
		this.senddesc = senddesc;
		this.testmail = testmail;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.sendform = sendform;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCampno() {
		return campno;
	}

	public void setCampno(int campno) {
		this.campno = campno;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public int getSendtype() {
		return sendtype;
	}

	public void setSendtype(int sendtype) {
		this.sendtype = sendtype;
	}

	public String getSenddate() {
		return senddate;
	}

	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public int getSendhour() {
		return sendhour;
	}

	public void setSendhour(int sendhour) {
		this.sendhour = sendhour;
	}

	public int getSendminute() {
		return sendminute;
	}

	public void setSendminute(int sendminute) {
		this.sendminute = sendminute;
	}

	public int getContentsno() {
		return contentsno;
	}

	public void setContentsno(int contentsno) {
		this.contentsno = contentsno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSenddesc() {
		return senddesc;
	}

	public void setSenddesc(String senddesc) {
		this.senddesc = senddesc;
	}

	public String getTestmail() {
		return testmail;
	}

	public void setTestmail(String testmail) {
		this.testmail = testmail;
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

	public int getSendform() {
		return sendform;
	}

	public void setSendform(int sendform) {
		this.sendform = sendform;
	}

	
	
	
}
