package saas.crud.crm.au.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemCompanyDto {
	
	private int SITEID; //사이트 ID PK
	private String SITENAME; //회원사명
	private String BSNO; //사업자번호
	private String INCNO; //법인번호
	private int ZIPCODE; //우편번호
	private String UPRADDRESS; //주소1
	private String LWRADDRESS; //주소2
	private String FREGDATE; //최초 가입일
	private String EXPIRDATE; //만료일
	private String TELNO1; //전화1
	private String TELNO2; //전화2
	private String TELNO3; //전화3
	private String FAXTEL1; //팩스1
	private String FAXTEL2; //팩스2
	private String FAXTEL3; //팩스3
	private String MOBILE1; //휴대폰1
	private String MOBILE2; //휴대폰2
	private String MOBILE3; //휴대폰3
	private String EMAIL; //이메일
	private String STIEMEMO; //사이트메모
	private MultipartFile SITELOGO; //사이트로고
	private String BSCOND; //업종
	private String COTYPE; //업태
	private String BSTYPE; //종목
	private String CTIADDRESS; //CTI주소
	private String SWITCHTEL; //CTI 대표번호
	private String REGDATE; //등록일시
	private String REGUSER; //등록자
	private String EDTDATE; //수정일시
	private String EDTUSER; //수정자
	private String CALLNAME; //회사약어
	private String SITESIZE; //회사규모
	
	public MemCompanyDto() {}

	public MemCompanyDto(int sITEID, String sITENAME, String bSNO, String iNCNO, int zIPCODE, String uPRADDRESS,
			String lWRADDRESS, String fREGDATE, String eXPIRDATE, String tELNO1, String tELNO2, String tELNO3,
			String fAXTEL1, String fAXTEL2, String fAXTEL3, String mOBILE1, String mOBILE2, String mOBILE3,
			String eMAIL, String sTIEMEMO, MultipartFile sITELOGO, String bSCOND, String cOTYPE, String bSTYPE,
			String cTIADDRESS, String sWITCHTEL, String rEGDATE, String rEGUSER, String eDTDATE, String eDTUSER,
			String cALLNAME, String sITESIZE) {
		super();
		SITEID = sITEID;
		SITENAME = sITENAME;
		BSNO = bSNO;
		INCNO = iNCNO;
		ZIPCODE = zIPCODE;
		UPRADDRESS = uPRADDRESS;
		LWRADDRESS = lWRADDRESS;
		FREGDATE = fREGDATE;
		EXPIRDATE = eXPIRDATE;
		TELNO1 = tELNO1;
		TELNO2 = tELNO2;
		TELNO3 = tELNO3;
		FAXTEL1 = fAXTEL1;
		FAXTEL2 = fAXTEL2;
		FAXTEL3 = fAXTEL3;
		MOBILE1 = mOBILE1;
		MOBILE2 = mOBILE2;
		MOBILE3 = mOBILE3;
		EMAIL = eMAIL;
		STIEMEMO = sTIEMEMO;
		SITELOGO = sITELOGO;
		BSCOND = bSCOND;
		COTYPE = cOTYPE;
		BSTYPE = bSTYPE;
		CTIADDRESS = cTIADDRESS;
		SWITCHTEL = sWITCHTEL;
		REGDATE = rEGDATE;
		REGUSER = rEGUSER;
		EDTDATE = eDTDATE;
		EDTUSER = eDTUSER;
		CALLNAME = cALLNAME;
		SITESIZE = sITESIZE;
	}

	public int getSITEID() {
		return SITEID;
	}

	public void setSITEID(int sITEID) {
		SITEID = sITEID;
	}

	public String getSITENAME() {
		return SITENAME;
	}

	public void setSITENAME(String sITENAME) {
		SITENAME = sITENAME;
	}

	public String getBSNO() {
		return BSNO;
	}

	public void setBSNO(String bSNO) {
		BSNO = bSNO;
	}

	public String getINCNO() {
		return INCNO;
	}

	public void setINCNO(String iNCNO) {
		INCNO = iNCNO;
	}

	public int getZIPCODE() {
		return ZIPCODE;
	}

	public void setZIPCODE(int zIPCODE) {
		ZIPCODE = zIPCODE;
	}

	public String getUPRADDRESS() {
		return UPRADDRESS;
	}

	public void setUPRADDRESS(String uPRADDRESS) {
		UPRADDRESS = uPRADDRESS;
	}

	public String getLWRADDRESS() {
		return LWRADDRESS;
	}

	public void setLWRADDRESS(String lWRADDRESS) {
		LWRADDRESS = lWRADDRESS;
	}

	public String getFREGDATE() {
		return FREGDATE;
	}

	public void setFREGDATE(String fREGDATE) {
		FREGDATE = fREGDATE;
	}

	public String getEXPIRDATE() {
		return EXPIRDATE;
	}

	public void setEXPIRDATE(String eXPIRDATE) {
		EXPIRDATE = eXPIRDATE;
	}

	public String getTELNO1() {
		return TELNO1;
	}

	public void setTELNO1(String tELNO1) {
		TELNO1 = tELNO1;
	}

	public String getTELNO2() {
		return TELNO2;
	}

	public void setTELNO2(String tELNO2) {
		TELNO2 = tELNO2;
	}

	public String getTELNO3() {
		return TELNO3;
	}

	public void setTELNO3(String tELNO3) {
		TELNO3 = tELNO3;
	}

	public String getFAXTEL1() {
		return FAXTEL1;
	}

	public void setFAXTEL1(String fAXTEL1) {
		FAXTEL1 = fAXTEL1;
	}

	public String getFAXTEL2() {
		return FAXTEL2;
	}

	public void setFAXTEL2(String fAXTEL2) {
		FAXTEL2 = fAXTEL2;
	}

	public String getFAXTEL3() {
		return FAXTEL3;
	}

	public void setFAXTEL3(String fAXTEL3) {
		FAXTEL3 = fAXTEL3;
	}

	public String getMOBILE1() {
		return MOBILE1;
	}

	public void setMOBILE1(String mOBILE1) {
		MOBILE1 = mOBILE1;
	}

	public String getMOBILE2() {
		return MOBILE2;
	}

	public void setMOBILE2(String mOBILE2) {
		MOBILE2 = mOBILE2;
	}

	public String getMOBILE3() {
		return MOBILE3;
	}

	public void setMOBILE3(String mOBILE3) {
		MOBILE3 = mOBILE3;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getSTIEMEMO() {
		return STIEMEMO;
	}

	public void setSTIEMEMO(String sTIEMEMO) {
		STIEMEMO = sTIEMEMO;
	}

	public MultipartFile getSITELOGO() {
		return SITELOGO;
	}

	public void setSITELOGO(MultipartFile sITELOGO) {
		SITELOGO = sITELOGO;
	}

	public String getBSCOND() {
		return BSCOND;
	}

	public void setBSCOND(String bSCOND) {
		BSCOND = bSCOND;
	}

	public String getCOTYPE() {
		return COTYPE;
	}

	public void setCOTYPE(String cOTYPE) {
		COTYPE = cOTYPE;
	}

	public String getBSTYPE() {
		return BSTYPE;
	}

	public void setBSTYPE(String bSTYPE) {
		BSTYPE = bSTYPE;
	}

	public String getCTIADDRESS() {
		return CTIADDRESS;
	}

	public void setCTIADDRESS(String cTIADDRESS) {
		CTIADDRESS = cTIADDRESS;
	}

	public String getSWITCHTEL() {
		return SWITCHTEL;
	}

	public void setSWITCHTEL(String sWITCHTEL) {
		SWITCHTEL = sWITCHTEL;
	}

	public String getREGDATE() {
		return REGDATE;
	}

	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}

	public String getREGUSER() {
		return REGUSER;
	}

	public void setREGUSER(String rEGUSER) {
		REGUSER = rEGUSER;
	}

	public String getEDTDATE() {
		return EDTDATE;
	}

	public void setEDTDATE(String eDTDATE) {
		EDTDATE = eDTDATE;
	}

	public String getEDTUSER() {
		return EDTUSER;
	}

	public void setEDTUSER(String eDTUSER) {
		EDTUSER = eDTUSER;
	}

	public String getCALLNAME() {
		return CALLNAME;
	}

	public void setCALLNAME(String cALLNAME) {
		CALLNAME = cALLNAME;
	}

	public String getSITESIZE() {
		return SITESIZE;
	}

	public void setSITESIZE(String sITESIZE) {
		SITESIZE = sITESIZE;
	}

	
}
