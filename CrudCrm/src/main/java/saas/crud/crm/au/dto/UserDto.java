package saas.crud.crm.au.dto;

public class UserDto {
	
	private int USERNO; //회원번호 PK
	private int SITEID; //회원소속 회원사
	private String USERID; //회원 ID
	private String USERNAME; //회원 이름
	private String USERPASSWORD; //회원비밀번호
	private String USERDESC; //회원 설명
	private String EMAIL; 
	private int DEPTID; //부서번호
	private int CHK_AUTH; //권한체크 10 / 20 / 30 
	private String ENTERDATE; //가입일자
	private String USERLANG; //언어
	private String MOBILE1; 
	private String MOBILE2;
	private String MOBILE3;
	private String TELNO1;
	private String TELNO2;
	private String TELNO3;
	private String USERDUTY; //직책
	private int CTIID; //CTI ID
	private String CTIPASS; //CTI PASSWORD
	private String PWDCHANGEDATE; //비밀번호 변경일시
	private int ISDELETED; //사용여부 0 / 1
	private String REGDATE; //등록일시
	private int REGUSER; //등록자 
	private String EDTDATE; //수정일시
	private int EDTUSER; //수정자
	
	public UserDto () {}

	public UserDto(int uSERNO, int sITEID, String uSERID, String uSERNAME, String uSERPASSWORD, String uSERDESC,
			String eMAIL, int dEPTID, int cHK_AUTH, String eNTERDATE, String uSERLANG, String mOBILE1, String mOBILE2,
			String mOBILE3, String tELNO1, String tELNO2, String tELNO3, String uSERDUTY, int cTIID, String cTIPASS,
			String pWDCHANGEDATE, int iSDELETED, String rEGDATE, int rEGUSER, String eDTDATE, int eDTUSER) {
		super();
		USERNO = uSERNO;
		SITEID = sITEID;
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPASSWORD = uSERPASSWORD;
		USERDESC = uSERDESC;
		EMAIL = eMAIL;
		DEPTID = dEPTID;
		CHK_AUTH = cHK_AUTH;
		ENTERDATE = eNTERDATE;
		USERLANG = uSERLANG;
		MOBILE1 = mOBILE1;
		MOBILE2 = mOBILE2;
		MOBILE3 = mOBILE3;
		TELNO1 = tELNO1;
		TELNO2 = tELNO2;
		TELNO3 = tELNO3;
		USERDUTY = uSERDUTY;
		CTIID = cTIID;
		CTIPASS = cTIPASS;
		PWDCHANGEDATE = pWDCHANGEDATE;
		ISDELETED = iSDELETED;
		REGDATE = rEGDATE;
		REGUSER = rEGUSER;
		EDTDATE = eDTDATE;
		EDTUSER = eDTUSER;
	}

	public int getUSERNO() {
		return USERNO;
	}

	public void setUSERNO(int uSERNO) {
		USERNO = uSERNO;
	}

	public int getSITEID() {
		return SITEID;
	}

	public void setSITEID(int sITEID) {
		SITEID = sITEID;
	}

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getUSERPASSWORD() {
		return USERPASSWORD;
	}

	public void setUSERPASSWORD(String uSERPASSWORD) {
		USERPASSWORD = uSERPASSWORD;
	}

	public String getUSERDESC() {
		return USERDESC;
	}

	public void setUSERDESC(String uSERDESC) {
		USERDESC = uSERDESC;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public int getDEPTID() {
		return DEPTID;
	}

	public void setDEPTID(int dEPTID) {
		DEPTID = dEPTID;
	}

	public int getCHK_AUTH() {
		return CHK_AUTH;
	}

	public void setCHK_AUTH(int cHK_AUTH) {
		CHK_AUTH = cHK_AUTH;
	}

	public String getENTERDATE() {
		return ENTERDATE;
	}

	public void setENTERDATE(String eNTERDATE) {
		ENTERDATE = eNTERDATE;
	}

	public String getUSERLANG() {
		return USERLANG;
	}

	public void setUSERLANG(String uSERLANG) {
		USERLANG = uSERLANG;
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

	public String getUSERDUTY() {
		return USERDUTY;
	}

	public void setUSERDUTY(String uSERDUTY) {
		USERDUTY = uSERDUTY;
	}

	public int getCTIID() {
		return CTIID;
	}

	public void setCTIID(int cTIID) {
		CTIID = cTIID;
	}

	public String getCTIPASS() {
		return CTIPASS;
	}

	public void setCTIPASS(String cTIPASS) {
		CTIPASS = cTIPASS;
	}

	public String getPWDCHANGEDATE() {
		return PWDCHANGEDATE;
	}

	public void setPWDCHANGEDATE(String pWDCHANGEDATE) {
		PWDCHANGEDATE = pWDCHANGEDATE;
	}

	public int getISDELETED() {
		return ISDELETED;
	}

	public void setISDELETED(int iSDELETED) {
		ISDELETED = iSDELETED;
	}

	public String getREGDATE() {
		return REGDATE;
	}

	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}

	public int getREGUSER() {
		return REGUSER;
	}

	public void setREGUSER(int rEGUSER) {
		REGUSER = rEGUSER;
	}

	public String getEDTDATE() {
		return EDTDATE;
	}

	public void setEDTDATE(String eDTDATE) {
		EDTDATE = eDTDATE;
	}

	public int getEDTUSER() {
		return EDTUSER;
	}

	public void setEDTUSER(int eDTUSER) {
		EDTUSER = eDTUSER;
	}
	
}
