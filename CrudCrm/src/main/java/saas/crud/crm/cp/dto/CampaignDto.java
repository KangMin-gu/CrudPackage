package saas.crud.crm.cp.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CampaignDto {
	
	private int campno;
	private String campname;
	private int camptype;
	private int campstep;
	private String startdate;
	private String enddate;
	private int owner;
	private String campdesc;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int siteid;
	private int isdelete;
	private String filesearchkey;
	private List<MultipartFile> file; //Spring 에서 파일 업로드 처리하기 위해
	
	public CampaignDto() {}

	public CampaignDto(int campno, String campname, int camptype, int campstep, String startdate, String enddate,
			int owner, String campdesc, String regdate, int reguser, String edtdate, int edtuser, int siteid,
			int isdelete, String filesearchkey, List<MultipartFile> file) {
		super();
		this.campno = campno;
		this.campname = campname;
		this.camptype = camptype;
		this.campstep = campstep;
		this.startdate = startdate;
		this.enddate = enddate;
		this.owner = owner;
		this.campdesc = campdesc;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.siteid = siteid;
		this.isdelete = isdelete;
		this.filesearchkey = filesearchkey;
		this.file = file;
	}

	public int getCampno() {
		return campno;
	}

	public void setCampno(int campno) {
		this.campno = campno;
	}

	public String getCampname() {
		return campname;
	}

	public void setCampname(String campname) {
		this.campname = campname;
	}

	public int getCamptype() {
		return camptype;
	}

	public void setCamptype(int camptype) {
		this.camptype = camptype;
	}

	public int getCampstep() {
		return campstep;
	}

	public void setCampstep(int campstep) {
		this.campstep = campstep;
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

	public int getOwner() {
		return owner;
	}

	public void setOwner(int owner) {
		this.owner = owner;
	}

	public String getCampdesc() {
		return campdesc;
	}

	public void setCampdesc(String campdesc) {
		this.campdesc = campdesc;
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

	public String getFilesearchkey() {
		return filesearchkey;
	}

	public void setFilesearchkey(String filesearchkey) {
		this.filesearchkey = filesearchkey;
	}

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	};
	
	
	
	
	

}
