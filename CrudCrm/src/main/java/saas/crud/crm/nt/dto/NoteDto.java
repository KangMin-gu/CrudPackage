package saas.crud.crm.nt.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoteDto {
	
	private int noticeid; //내부통지번호
	private int userno; //받는이
	private int fromuserno; //보내는이
	private String linkurl; //링크
	private int ntcwayemail; //통지매체 email 
	private int ntcwaysms; //통지매체 sms 	 
	private String title; //제목 
	private String content; //내용   
	private int important; //중요메일여부
	private int siteid;
	private int chkcc;
	private int filesearchkey;
	private List<MultipartFile> file; //Spring 에서 파일 업로드 처리하기 위해
	
	public NoteDto () {}

	public NoteDto(int noticeid, int userno, int fromuserno, String linkurl, int ntcwayemail, int ntcwaysms,
			String title, String content, int important, int siteid, int chkcc, int filesearchkey,
			List<MultipartFile> file) {
		super();
		this.noticeid = noticeid;
		this.userno = userno;
		this.fromuserno = fromuserno;
		this.linkurl = linkurl;
		this.ntcwayemail = ntcwayemail;
		this.ntcwaysms = ntcwaysms;
		this.title = title;
		this.content = content;
		this.important = important;
		this.siteid = siteid;
		this.chkcc = chkcc;
		this.filesearchkey = filesearchkey;
		this.file = file;
	}

	public int getNoticeid() {
		return noticeid;
	}

	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getFromuserno() {
		return fromuserno;
	}

	public void setFromuserno(int fromuserno) {
		this.fromuserno = fromuserno;
	}

	public String getLinkurl() {
		return linkurl;
	}

	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
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

	public int getImportant() {
		return important;
	}

	public void setImportant(int important) {
		this.important = important;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public int getChkcc() {
		return chkcc;
	}

	public void setChkcc(int chkcc) {
		this.chkcc = chkcc;
	}

	public int getFilesearchkey() {
		return filesearchkey;
	}

	public void setFilesearchkey(int filesearchkey) {
		this.filesearchkey = filesearchkey;
	}

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	
	
}
