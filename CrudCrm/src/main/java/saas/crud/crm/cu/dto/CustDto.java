package saas.crud.crm.cu.dto;

/**
 * @author sdwsg
 *
 */
/**
 * @author sdwsg
 *
 */
public class CustDto {

	private int custno;
	private int siteid;
	private int userno;
	private String custname;
	private String company;
	private String deptname;
	private String duty;
	private String mobile1;
	private String mobile2;
	private String mobile3;
	private String email	;
	private int sex;
	private int custgubun;
	private int custgrade;
	private int infoagree;
	private String birth;
	private int married;
	private String weddingday;
	private int solar;
	private String job;
	private String hobby;
	private int ismember	;
	private String homtel1;
	private String homtel2;
	private String homtel3;
	private String homaddr1;
	private String homaddr2;
	private String homaddr3;
	private String wrkaddr1;
	private String wrkaddr2;
	private String wrkaddr3;
	private String wrktel1;
	private String wrktel2;
	private String wrktel3;
	private String wrkurl;
	private String wrkfax1;
	private String wrkfax2;
	private String wrkfax3;
	private int mailto;
	private int denyemail;
	private int denyfax;
	private int denydm;
	private int denytm;
	private int denysms;
	private int denyvisit;
	private int owner;
	private int actgrade;
	private String memo;
	private String regdate;
	private int reguser;
	private String editdate;
	private int edituser;
	private int isdelete;
	private int clino;
	
	
	
	public CustDto() {}
	
	public CustDto(int custno, int siteid, int userno, String custname, String company, String deptname, String duty,
			String mobile1, String mobile2, String mobile3, String email, int sex, int custgubun, int custgrade,
			int infoagree, String birth, int married, String weddingday, int solar, String job, String hobby,
			int ismember, String homtel1, String homtel2, String homtel3, String homaddr1, String homaddr2,
			String homaddr3, String wrkaddr1, String wrkaddr2, String wrkaddr3, String wrktel1, String wrktel2,
			String wrktel3, String wrkurl, String wrkfax1, String wrkfax2, String wrkfax3, int mailto, int denyemail,
			int denyfax, int denydm, int denytm, int denysms, int denyvisit, int owner, int actgrade, String memo,
			String regdate, int reguser, String editdate, int edituser, int isdelete, int clino) {
		super();
		this.custno = custno;
		this.siteid = siteid;
		this.userno = userno;
		this.custname = custname;
		this.company = company;
		this.deptname = deptname;
		this.duty = duty;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;
		this.email = email;
		this.sex = sex;
		this.custgubun = custgubun;
		this.custgrade = custgrade;
		this.infoagree = infoagree;
		this.birth = birth;
		this.married = married;
		this.weddingday = weddingday;
		this.solar = solar;
		this.job = job;
		this.hobby = hobby;
		this.ismember = ismember;
		this.homtel1 = homtel1;
		this.homtel2 = homtel2;
		this.homtel3 = homtel3;
		this.homaddr1 = homaddr1;
		this.homaddr2 = homaddr2;
		this.homaddr3 = homaddr3;
		this.wrkaddr1 = wrkaddr1;
		this.wrkaddr2 = wrkaddr2;
		this.wrkaddr3 = wrkaddr3;
		this.wrktel1 = wrktel1;
		this.wrktel2 = wrktel2;
		this.wrktel3 = wrktel3;
		this.wrkurl = wrkurl;
		this.wrkfax1 = wrkfax1;
		this.wrkfax2 = wrkfax2;
		this.wrkfax3 = wrkfax3;
		this.mailto = mailto;
		this.denyemail = denyemail;
		this.denyfax = denyfax;
		this.denydm = denydm;
		this.denytm = denytm;
		this.denysms = denysms;
		this.denyvisit = denyvisit;
		this.owner = owner;
		this.actgrade = actgrade;
		this.memo = memo;
		this.regdate = regdate;
		this.reguser = reguser;
		this.editdate = editdate;
		this.edituser = edituser;
		this.isdelete = isdelete;
		this.clino = clino;
	}
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
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
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getCustgubun() {
		return custgubun;
	}
	public void setCustgubun(int custgubun) {
		this.custgubun = custgubun;
	}
	public int getCustgrade() {
		return custgrade;
	}
	public void setCustgrade(int custgrade) {
		this.custgrade = custgrade;
	}
	public int getInfoagree() {
		return infoagree;
	}
	public void setInfoagree(int infoagree) {
		this.infoagree = infoagree;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getMarried() {
		return married;
	}
	public void setMarried(int married) {
		this.married = married;
	}
	public String getWeddingday() {
		return weddingday;
	}
	public void setWeddingday(String weddingday) {
		this.weddingday = weddingday;
	}
	public int getSolar() {
		return solar;
	}
	public void setSolar(int solar) {
		this.solar = solar;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public int getIsmember() {
		return ismember;
	}
	public void setIsmember(int ismember) {
		this.ismember = ismember;
	}
	public String getHomtel1() {
		return homtel1;
	}
	public void setHomtel1(String homtel1) {
		this.homtel1 = homtel1;
	}
	public String getHomtel2() {
		return homtel2;
	}
	public void setHomtel2(String homtel2) {
		this.homtel2 = homtel2;
	}
	public String getHomtel3() {
		return homtel3;
	}
	public void setHomtel3(String homtel3) {
		this.homtel3 = homtel3;
	}
	public String getHomaddr1() {
		return homaddr1;
	}
	public void setHomaddr1(String homaddr1) {
		this.homaddr1 = homaddr1;
	}
	public String getHomaddr2() {
		return homaddr2;
	}
	public void setHomaddr2(String homaddr2) {
		this.homaddr2 = homaddr2;
	}
	public String getHomaddr3() {
		return homaddr3;
	}
	public void setHomaddr3(String homaddr3) {
		this.homaddr3 = homaddr3;
	}
	public String getWrkaddr1() {
		return wrkaddr1;
	}
	public void setWrkaddr1(String wrkaddr1) {
		this.wrkaddr1 = wrkaddr1;
	}
	public String getWrkaddr2() {
		return wrkaddr2;
	}
	public void setWrkaddr2(String wrkaddr2) {
		this.wrkaddr2 = wrkaddr2;
	}
	public String getWrkaddr3() {
		return wrkaddr3;
	}
	public void setWrkaddr3(String wrkaddr3) {
		this.wrkaddr3 = wrkaddr3;
	}
	public String getWrktel1() {
		return wrktel1;
	}
	public void setWrktel1(String wrktel1) {
		this.wrktel1 = wrktel1;
	}
	public String getWrktel2() {
		return wrktel2;
	}
	public void setWrktel2(String wrktel2) {
		this.wrktel2 = wrktel2;
	}
	public String getWrktel3() {
		return wrktel3;
	}
	public void setWrktel3(String wrktel3) {
		this.wrktel3 = wrktel3;
	}
	public String getWrkurl() {
		return wrkurl;
	}
	public void setWrkurl(String wrkurl) {
		this.wrkurl = wrkurl;
	}
	public String getWrkfax1() {
		return wrkfax1;
	}
	public void setWrkfax1(String wrkfax1) {
		this.wrkfax1 = wrkfax1;
	}
	public String getWrkfax2() {
		return wrkfax2;
	}
	public void setWrkfax2(String wrkfax2) {
		this.wrkfax2 = wrkfax2;
	}
	public String getWrkfax3() {
		return wrkfax3;
	}
	public void setWrkfax3(String wrkfax3) {
		this.wrkfax3 = wrkfax3;
	}
	public int getMailto() {
		return mailto;
	}
	public void setMailto(int mailto) {
		this.mailto = mailto;
	}
	public int getDenyemail() {
		return denyemail;
	}
	public void setDenyemail(int denyemail) {
		this.denyemail = denyemail;
	}
	public int getDenyfax() {
		return denyfax;
	}
	public void setDenyfax(int denyfax) {
		this.denyfax = denyfax;
	}
	public int getDenydm() {
		return denydm;
	}
	public void setDenydm(int denydm) {
		this.denydm = denydm;
	}
	public int getDenytm() {
		return denytm;
	}
	public void setDenytm(int denytm) {
		this.denytm = denytm;
	}
	public int getDenysms() {
		return denysms;
	}
	public void setDenysms(int denysms) {
		this.denysms = denysms;
	}
	public int getDenyvisit() {
		return denyvisit;
	}
	public void setDenyvisit(int denyvisit) {
		this.denyvisit = denyvisit;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public int getActgrade() {
		return actgrade;
	}
	public void setActgrade(int actgrade) {
		this.actgrade = actgrade;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
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
	public String getEditdate() {
		return editdate;
	}
	public void setEditdate(String editdate) {
		this.editdate = editdate;
	}
	public int getEdituser() {
		return edituser;
	}
	public void setEdituser(int edituser) {
		this.edituser = edituser;
	}
	public int getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	public int getClino() {
		return clino;
	}
	public void setClino(int clino) {
		this.clino = clino;
	}
	
	
	
	
	
	
	
	
	
	
	
}
