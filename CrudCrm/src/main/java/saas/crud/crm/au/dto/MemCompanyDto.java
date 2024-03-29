package saas.crud.crm.au.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemCompanyDto {
	
	private int siteid; //사이트 ID PK
	private String sitename; //회원사명
	private String bsno1; //사업자번호1
	private String bsno2; //사업자번호2
	private String bsno3; //사업자번호3
	private String incno1; //법인번호1
	private String incno2; //법인번호2
	private int zipcode; //우편번호
	private String upraddress; //주소1
	private String lwraddress; //주소2
	private String fregdate; //최초 가입일
	private String expirdate; //만료일
	private String telno1; //전화1
	private String telno2; //전화2
	private String telno3; //전화3
	private String faxtel1; //팩스1
	private String faxtel2; //팩스2
	private String faxtel3; //팩스3
	private String mobile1; //휴대폰1
	private String mobile2; //휴대폰2
	private String mobile3; //휴대폰3
	private String email; //이메일
	private String stiememo; //사이트메모
	private MultipartFile sitelogo; //사이트로고
	private String bscond; //업종
	private String cotype; //업태
	private String bstype; //종목
	private String ctiaddress; //CTI주소
	private String switchtel; //CTI 대표번호
	private String regdate; //등록일시
	private String reguser; //등록자
	private String edtdate; //수정일시
	private String edtuser; //수정자
	private String callname; //회사약어
	private String sitesize; //회사규모
	
	public MemCompanyDto() {}

	public MemCompanyDto(int siteid, String sitename, String bsno1, String bsno2, String bsno3, String incno1,
			String incno2, int zipcode, String upraddress, String lwraddress, String fregdate, String expirdate,
			String telno1, String telno2, String telno3, String faxtel1, String faxtel2, String faxtel3, String mobile1,
			String mobile2, String mobile3, String email, String stiememo, MultipartFile sitelogo, String bscond,
			String cotype, String bstype, String ctiaddress, String switchtel, String regdate, String reguser,
			String edtdate, String edtuser, String callname, String sitesize) {
		super();
		this.siteid = siteid;
		this.sitename = sitename;
		this.bsno1 = bsno1;
		this.bsno2 = bsno2;
		this.bsno3 = bsno3;
		this.incno1 = incno1;
		this.incno2 = incno2;
		this.zipcode = zipcode;
		this.upraddress = upraddress;
		this.lwraddress = lwraddress;
		this.fregdate = fregdate;
		this.expirdate = expirdate;
		this.telno1 = telno1;
		this.telno2 = telno2;
		this.telno3 = telno3;
		this.faxtel1 = faxtel1;
		this.faxtel2 = faxtel2;
		this.faxtel3 = faxtel3;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;
		this.email = email;
		this.stiememo = stiememo;
		this.sitelogo = sitelogo;
		this.bscond = bscond;
		this.cotype = cotype;
		this.bstype = bstype;
		this.ctiaddress = ctiaddress;
		this.switchtel = switchtel;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.callname = callname;
		this.sitesize = sitesize;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public String getSitename() {
		return sitename;
	}

	public void setSitename(String sitename) {
		this.sitename = sitename;
	}

	public String getBsno1() {
		return bsno1;
	}

	public void setBsno1(String bsno1) {
		this.bsno1 = bsno1;
	}

	public String getBsno2() {
		return bsno2;
	}

	public void setBsno2(String bsno2) {
		this.bsno2 = bsno2;
	}

	public String getBsno3() {
		return bsno3;
	}

	public void setBsno3(String bsno3) {
		this.bsno3 = bsno3;
	}

	public String getIncno1() {
		return incno1;
	}

	public void setIncno1(String incno1) {
		this.incno1 = incno1;
	}

	public String getIncno2() {
		return incno2;
	}

	public void setIncno2(String incno2) {
		this.incno2 = incno2;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getUpraddress() {
		return upraddress;
	}

	public void setUpraddress(String upraddress) {
		this.upraddress = upraddress;
	}

	public String getLwraddress() {
		return lwraddress;
	}

	public void setLwraddress(String lwraddress) {
		this.lwraddress = lwraddress;
	}

	public String getFregdate() {
		return fregdate;
	}

	public void setFregdate(String fregdate) {
		this.fregdate = fregdate;
	}

	public String getExpirdate() {
		return expirdate;
	}

	public void setExpirdate(String expirdate) {
		this.expirdate = expirdate;
	}

	public String getTelno1() {
		return telno1;
	}

	public void setTelno1(String telno1) {
		this.telno1 = telno1;
	}

	public String getTelno2() {
		return telno2;
	}

	public void setTelno2(String telno2) {
		this.telno2 = telno2;
	}

	public String getTelno3() {
		return telno3;
	}

	public void setTelno3(String telno3) {
		this.telno3 = telno3;
	}

	public String getFaxtel1() {
		return faxtel1;
	}

	public void setFaxtel1(String faxtel1) {
		this.faxtel1 = faxtel1;
	}

	public String getFaxtel2() {
		return faxtel2;
	}

	public void setFaxtel2(String faxtel2) {
		this.faxtel2 = faxtel2;
	}

	public String getFaxtel3() {
		return faxtel3;
	}

	public void setFaxtel3(String faxtel3) {
		this.faxtel3 = faxtel3;
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

	public String getStiememo() {
		return stiememo;
	}

	public void setStiememo(String stiememo) {
		this.stiememo = stiememo;
	}

	public MultipartFile getSitelogo() {
		return sitelogo;
	}

	public void setSitelogo(MultipartFile sitelogo) {
		this.sitelogo = sitelogo;
	}

	public String getBscond() {
		return bscond;
	}

	public void setBscond(String bscond) {
		this.bscond = bscond;
	}

	public String getCotype() {
		return cotype;
	}

	public void setCotype(String cotype) {
		this.cotype = cotype;
	}

	public String getBstype() {
		return bstype;
	}

	public void setBstype(String bstype) {
		this.bstype = bstype;
	}

	public String getCtiaddress() {
		return ctiaddress;
	}

	public void setCtiaddress(String ctiaddress) {
		this.ctiaddress = ctiaddress;
	}

	public String getSwitchtel() {
		return switchtel;
	}

	public void setSwitchtel(String switchtel) {
		this.switchtel = switchtel;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReguser() {
		return reguser;
	}

	public void setReguser(String reguser) {
		this.reguser = reguser;
	}

	public String getEdtdate() {
		return edtdate;
	}

	public void setEdtdate(String edtdate) {
		this.edtdate = edtdate;
	}

	public String getEdtuser() {
		return edtuser;
	}

	public void setEdtuser(String edtuser) {
		this.edtuser = edtuser;
	}

	public String getCallname() {
		return callname;
	}

	public void setCallname(String callname) {
		this.callname = callname;
	}

	public String getSitesize() {
		return sitesize;
	}

	public void setSitesize(String sitesize) {
		this.sitesize = sitesize;
	}

	

}
