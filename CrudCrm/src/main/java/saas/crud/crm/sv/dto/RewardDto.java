package saas.crud.crm.sv.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RewardDto {
	
	private int rewardno;
	private int serviceno;
	private String visitdate;
	private String visittime;
	private int rewardtype;
	private int causecode;
	private int delaytype;
	private String rewarddesc;
	private String delaydesc;
	private String filesearchkey;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int siteid;
	private List<MultipartFile> rewardfile; //Spring 에서 파일 업로드 처리하기 위해
	
	public RewardDto() {}

	public RewardDto(int rewardno, int serviceno, String visitdate, String visittime, int rewardtype, int causecode,
			int delaytype, String rewarddesc, String delaydesc, String filesearchkey, String regdate, int reguser,
			String edtdate, int edtuser, int siteid, List<MultipartFile> rewardfile) {
		super();
		this.rewardno = rewardno;
		this.serviceno = serviceno;
		this.visitdate = visitdate;
		this.visittime = visittime;
		this.rewardtype = rewardtype;
		this.causecode = causecode;
		this.delaytype = delaytype;
		this.rewarddesc = rewarddesc;
		this.delaydesc = delaydesc;
		this.filesearchkey = filesearchkey;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.siteid = siteid;
		this.rewardfile = rewardfile;
	}

	public int getRewardno() {
		return rewardno;
	}

	public void setRewardno(int rewardno) {
		this.rewardno = rewardno;
	}

	public int getServiceno() {
		return serviceno;
	}

	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
	}

	public String getVisitdate() {
		return visitdate;
	}

	public void setVisitdate(String visitdate) {
		this.visitdate = visitdate;
	}

	public String getVisittime() {
		return visittime;
	}

	public void setVisittime(String visittime) {
		this.visittime = visittime;
	}

	public int getRewardtype() {
		return rewardtype;
	}

	public void setRewardtype(int rewardtype) {
		this.rewardtype = rewardtype;
	}

	public int getCausecode() {
		return causecode;
	}

	public void setCausecode(int causecode) {
		this.causecode = causecode;
	}

	public int getDelaytype() {
		return delaytype;
	}

	public void setDelaytype(int delaytype) {
		this.delaytype = delaytype;
	}

	public String getRewarddesc() {
		return rewarddesc;
	}

	public void setRewarddesc(String rewarddesc) {
		this.rewarddesc = rewarddesc;
	}

	public String getDelaydesc() {
		return delaydesc;
	}

	public void setDelaydesc(String delaydesc) {
		this.delaydesc = delaydesc;
	}

	public String getFilesearchkey() {
		return filesearchkey;
	}

	public void setFilesearchkey(String filesearchkey) {
		this.filesearchkey = filesearchkey;
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

	public List<MultipartFile> getRewardfile() {
		return rewardfile;
	}

	public void setRewardfile(List<MultipartFile> rewardfile) {
		this.rewardfile = rewardfile;
	}

	
}
	
	

