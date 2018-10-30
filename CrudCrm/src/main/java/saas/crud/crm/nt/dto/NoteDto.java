package saas.crud.crm.nt.dto;

import org.springframework.web.multipart.MultipartFile;

public class NoteDto {
	
	private int noticeid; //내부통지번호
	private int touserno; //보내는이
	private int ccuserno; //참조
	private String lnkurl; //링크
	private int ntcwayemail; //통지매체 email 
	private int ntcwaysms; //통지매체 sms 
	private int chkrltcode; //통지 읽음 체크 
	private String chkrltdate; //읽은 날짜 
	private int readchek; //통지 내용 체크 
	private String readdate; //통지 읽음 날짜 
	private String email; //이메일주소 
	private String mobile1; 
	private String mobile2;
	private String mobile3;
	private String title; //제목 
	private String contents; //내용 
	private String regdate; //등록일 
	private int reguser; //등록자 
	private int isdelete; //삭제여부 
	private int siteid; //사이트 
	private int important; //중요메일여부
	private MultipartFile filepath; //첨부파일
	
	public NoteDto () {}

	public NoteDto(int noticeid, int touserno, int ccuserno, String lnkurl, int ntcwayemail, int ntcwaysms,
			int chkrltcode, String chkrltdate, int readchek, String readdate, String email, String mobile1,
			String mobile2, String mobile3, String title, String contents, String regdate, int reguser, int isdelete,
			int siteid, int important, MultipartFile filepath) {
		super();
		this.noticeid = noticeid;
		this.touserno = touserno;
		this.ccuserno = ccuserno;
		this.lnkurl = lnkurl;
		this.ntcwayemail = ntcwayemail;
		this.ntcwaysms = ntcwaysms;
		this.chkrltcode = chkrltcode;
		this.chkrltdate = chkrltdate;
		this.readchek = readchek;
		this.readdate = readdate;
		this.email = email;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;
		this.title = title;
		this.contents = contents;
		this.regdate = regdate;
		this.reguser = reguser;
		this.isdelete = isdelete;
		this.siteid = siteid;
		this.important = important;
		this.filepath = filepath;
	}

	public int getNoticeid() {
		return noticeid;
	}

	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}

	public int getTouserno() {
		return touserno;
	}

	public void setTouserno(int touserno) {
		this.touserno = touserno;
	}

	public int getCcuserno() {
		return ccuserno;
	}

	public void setCcuserno(int ccuserno) {
		this.ccuserno = ccuserno;
	}

	public String getLnkurl() {
		return lnkurl;
	}

	public void setLnkurl(String lnkurl) {
		this.lnkurl = lnkurl;
	}

	public int getNtcwayemail() {
		return ntcwayemail;
	}

	public void setNtcwayemail(int ntcwayemail) {
		this.ntcwayemail = ntcwayemail;
	}

	public int getNtcwaysms() {
		return ntcwaysms;
	}

	public void setNtcwaysms(int ntcwaysms) {
		this.ntcwaysms = ntcwaysms;
	}

	public int getChkrltcode() {
		return chkrltcode;
	}

	public void setChkrltcode(int chkrltcode) {
		this.chkrltcode = chkrltcode;
	}

	public String getChkrltdate() {
		return chkrltdate;
	}

	public void setChkrltdate(String chkrltdate) {
		this.chkrltdate = chkrltdate;
	}

	public int getReadchek() {
		return readchek;
	}

	public void setReadchek(int readchek) {
		this.readchek = readchek;
	}

	public String getReaddate() {
		return readdate;
	}

	public void setReaddate(String readdate) {
		this.readdate = readdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getMobile3() {
		return mobile3;
	}

	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public int getImportant() {
		return important;
	}

	public void setImportant(int important) {
		this.important = important;
	}

	public MultipartFile getFilepath() {
		return filepath;
	}

	public void setFilepath(MultipartFile filepath) {
		this.filepath = filepath;
	}

	
}
