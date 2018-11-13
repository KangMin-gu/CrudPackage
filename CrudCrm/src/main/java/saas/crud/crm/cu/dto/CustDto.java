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

	private int CUSTNO;
	private int SITEID;
	private int USERNO;
	private String CUSTNAME;
	private String COMPANY;
	private String DEPTNAME;
	private String DUTY;
	private String MOBILE1;
	private String MOBILE2;
	private String MOBILE3;
	private String EMAIL	;
	private int SEX;
	private int CUSTGUBUN;
	private int CUSTGRADE;
	private int INFOAGREE;
	private String BIRTH;
	private int MARRIED;
	private String WEDDINGDAY;
	private int SOLAR;
	private String JOB;
	private String HOBBY;
	private int ISMEMBER	;
	private String HOMTEL1;
	private String HOMTEL2;
	private String HOMTEL3;
	private String HOMADDR1;
	private String HOMADDR2;
	private String HOMADDR3;
	private String WRKADDR1;
	private String WRKADDR2;
	private String WRKADDR3;
	private String WRKTEL1;
	private String WRKTEL2;
	private String WRKTEL3;
	private String WRKURL;
	private String WRKFAX1;
	private String WRKFAX2;
	private String WRKFAX3;
	private int MAILTO;
	private int DENYEMAIL;
	private int DENYFAX;
	private int DENYDM;
	private int DENYTM;
	private int DENYSMS;
	private int DENYVISIT;
	private int OWNER;
	private int ACTGRADE;
	private String MEMO;
	private String REGDATE;
	private int REGUSER;
	private String EDITDATE;
	private int EDITUSER	;
	private int ISDELETE;
	private int CLINO;
	
	
	
	
	
	
	
	public CustDto() {}
	public CustDto(int cUSTNO, int sITEID, int uSERNO, String cUSTNAME, String cOMPANY, String dEPTNAME,
			String dUTY, String mOBILE1, String mOBILE2, String mOBILE3, String eMAIL, int sEX, int cUSTGUBUN,
			int cUSTGRADE, int iNFOAGREE, String bIRTH, int mARRIED, String wEDDINGDAY, int sOLAR,
			String jOB, String hOBBY, int iSMEMBER, String hOMTEL1, String hOMTEL2, String hOMTEL3, String hOMADDR1,
			String hOMADDR2, String hOMADDR3, String wRKADDR1, String wRKADDR2, String wRKADDR3, String wRKTEL1,
			String wRKTEL2, String wRKTEL3, String wRKURL, String wRKFAX1, String wRKFAX2, String wRKFAX3,
			int mAILTO, int dENYEMAIL, int dENYFAX, int dENYDM, int dENYTM, int dENYSMS,
			int dENYVISIT, int oWNER, int aCTGRADE, String mEMO, String rEGDATE, int rEGUSER,
			String eDITDATE, int eDITUSER, int iSDELETE, int cLINO) {
		super();
		CUSTNO = cUSTNO;
		SITEID = sITEID;
		USERNO = uSERNO;
		CUSTNAME = cUSTNAME;
		COMPANY = cOMPANY;
		DEPTNAME = dEPTNAME;
		DUTY = dUTY;
		MOBILE1 = mOBILE1;
		MOBILE2 = mOBILE2;
		MOBILE3 = mOBILE3;
		EMAIL = eMAIL;
		SEX = sEX;
		CUSTGUBUN = cUSTGUBUN;
		CUSTGRADE = cUSTGRADE;
		INFOAGREE = iNFOAGREE;
		BIRTH = bIRTH;
		MARRIED = mARRIED;
		WEDDINGDAY = wEDDINGDAY;
		SOLAR = sOLAR;
		JOB = jOB;
		HOBBY = hOBBY;
		ISMEMBER = iSMEMBER;
		HOMTEL1 = hOMTEL1;
		HOMTEL2 = hOMTEL2;
		HOMTEL3 = hOMTEL3;
		HOMADDR1 = hOMADDR1;
		HOMADDR2 = hOMADDR2;
		HOMADDR3 = hOMADDR3;
		WRKADDR1 = wRKADDR1;
		WRKADDR2 = wRKADDR2;
		WRKADDR3 = wRKADDR3;
		WRKTEL1 = wRKTEL1;
		WRKTEL2 = wRKTEL2;
		WRKTEL3 = wRKTEL3;
		WRKURL = wRKURL;
		WRKFAX1 = wRKFAX1;
		WRKFAX2 = wRKFAX2;
		WRKFAX3 = wRKFAX3;
		MAILTO = mAILTO;
		DENYEMAIL = dENYEMAIL;
		DENYFAX = dENYFAX;
		DENYDM = dENYDM;
		DENYTM = dENYTM;
		DENYSMS = dENYSMS;
		DENYVISIT = dENYVISIT;
		OWNER = oWNER;
		ACTGRADE = aCTGRADE;
		MEMO = mEMO;
		REGDATE = rEGDATE;
		REGUSER = rEGUSER;
		EDITDATE = eDITDATE;
		EDITUSER = eDITUSER;
		ISDELETE = iSDELETE;
		CLINO = cLINO;
	}
	public int getCUSTNO() {
		return CUSTNO;
	}
	public void setCUSTNO(int cUSTNO) {
		CUSTNO = cUSTNO;
	}
	public int getSITEID() {
		return SITEID;
	}
	public void setSITEID(int sITEID) {
		SITEID = sITEID;
	}
	public int getUSERNO() {
		return USERNO;
	}
	public void setUSERNO(int uSERNO) {
		USERNO = uSERNO;
	}
	public String getCUSTNAME() {
		return CUSTNAME;
	}
	public void setCUSTNAME(String cUSTNAME) {
		CUSTNAME = cUSTNAME;
	}
	public String getCOMPANY() {
		return COMPANY;
	}
	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}
	public String getDEPTNAME() {
		return DEPTNAME;
	}
	public void setDEPTNAME(String dEPTNAME) {
		DEPTNAME = dEPTNAME;
	}
	public String getDUTY() {
		return DUTY;
	}
	public void setDUTY(String dUTY) {
		DUTY = dUTY;
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
	public int getSEX() {
		return SEX;
	}
	public void setSEX(int sEX) {
		SEX = sEX;
	}
	public int getCUSTGUBUN() {
		return CUSTGUBUN;
	}
	public void setCUSTGUBUN(int cUSTGUBUN) {
		CUSTGUBUN = cUSTGUBUN;
	}
	public int getCUSTGRADE() {
		return CUSTGRADE;
	}
	public void setCUSTGRADE(int cUSTGRADE) {
		CUSTGRADE = cUSTGRADE;
	}
	public int getINFOAGREE() {
		return INFOAGREE;
	}
	public void setINFOAGREE(int iNFOAGREE) {
		INFOAGREE = iNFOAGREE;
	}
	public String getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}
	public int getMARRIED() {
		return MARRIED;
	}
	public void setMARRIED(int mARRIED) {
		MARRIED = mARRIED;
	}
	public String getWEDDINGDAY() {
		return WEDDINGDAY;
	}
	public void setWEDDINGDAY(String wEDDINGDAY) {
		WEDDINGDAY = wEDDINGDAY;
	}
	public int getSOLAR() {
		return SOLAR;
	}
	public void setSOLAR(int sOLAR) {
		SOLAR = sOLAR;
	}
	public String getJOB() {
		return JOB;
	}
	public void setJOB(String jOB) {
		JOB = jOB;
	}
	public String getHOBBY() {
		return HOBBY;
	}
	public void setHOBBY(String hOBBY) {
		HOBBY = hOBBY;
	}
	public int getISMEMBER() {
		return ISMEMBER;
	}
	public void setISMEMBER(int iSMEMBER) {
		ISMEMBER = iSMEMBER;
	}
	public String getHOMTEL1() {
		return HOMTEL1;
	}
	public void setHOMTEL1(String hOMTEL1) {
		HOMTEL1 = hOMTEL1;
	}
	public String getHOMTEL2() {
		return HOMTEL2;
	}
	public void setHOMTEL2(String hOMTEL2) {
		HOMTEL2 = hOMTEL2;
	}
	public String getHOMTEL3() {
		return HOMTEL3;
	}
	public void setHOMTEL3(String hOMTEL3) {
		HOMTEL3 = hOMTEL3;
	}
	public String getHOMADDR1() {
		return HOMADDR1;
	}
	public void setHOMADDR1(String hOMADDR1) {
		HOMADDR1 = hOMADDR1;
	}
	public String getHOMADDR2() {
		return HOMADDR2;
	}
	public void setHOMADDR2(String hOMADDR2) {
		HOMADDR2 = hOMADDR2;
	}
	public String getHOMADDR3() {
		return HOMADDR3;
	}
	public void setHOMADDR3(String hOMADDR3) {
		HOMADDR3 = hOMADDR3;
	}
	public String getWRKADDR1() {
		return WRKADDR1;
	}
	public void setWRKADDR1(String wRKADDR1) {
		WRKADDR1 = wRKADDR1;
	}
	public String getWRKADDR2() {
		return WRKADDR2;
	}
	public void setWRKADDR2(String wRKADDR2) {
		WRKADDR2 = wRKADDR2;
	}
	public String getWRKADDR3() {
		return WRKADDR3;
	}
	public void setWRKADDR3(String wRKADDR3) {
		WRKADDR3 = wRKADDR3;
	}
	public String getWRKTEL1() {
		return WRKTEL1;
	}
	public void setWRKTEL1(String wRKTEL1) {
		WRKTEL1 = wRKTEL1;
	}
	public String getWRKTEL2() {
		return WRKTEL2;
	}
	public void setWRKTEL2(String wRKTEL2) {
		WRKTEL2 = wRKTEL2;
	}
	public String getWRKTEL3() {
		return WRKTEL3;
	}
	public void setWRKTEL3(String wRKTEL3) {
		WRKTEL3 = wRKTEL3;
	}
	public String getWRKURL() {
		return WRKURL;
	}
	public void setWRKURL(String wRKURL) {
		WRKURL = wRKURL;
	}
	public String getWRKFAX1() {
		return WRKFAX1;
	}
	public void setWRKFAX1(String wRKFAX1) {
		WRKFAX1 = wRKFAX1;
	}
	public String getWRKFAX2() {
		return WRKFAX2;
	}
	public void setWRKFAX2(String wRKFAX2) {
		WRKFAX2 = wRKFAX2;
	}
	public String getWRKFAX3() {
		return WRKFAX3;
	}
	public void setWRKFAX3(String wRKFAX3) {
		WRKFAX3 = wRKFAX3;
	}
	public int getMAILTO() {
		return MAILTO;
	}
	public void setMAILTO(int mAILTO) {
		MAILTO = mAILTO;
	}
	public int getDENYEMAIL() {
		return DENYEMAIL;
	}
	public void setDENYEMAIL(int dENYEMAIL) {
		DENYEMAIL = dENYEMAIL;
	}
	public int getDENYFAX() {
		return DENYFAX;
	}
	public void setDENYFAX(int dENYFAX) {
		DENYFAX = dENYFAX;
	}
	public int getDENYDM() {
		return DENYDM;
	}
	public void setDENYDM(int dENYDM) {
		DENYDM = dENYDM;
	}
	public int getDENYTM() {
		return DENYTM;
	}
	public void setDENYTM(int dENYTM) {
		DENYTM = dENYTM;
	}
	public int getDENYSMS() {
		return DENYSMS;
	}
	public void setDENYSMS(int dENYSMS) {
		DENYSMS = dENYSMS;
	}
	public int getDENYVISIT() {
		return DENYVISIT;
	}
	public void setDENYVISIT(int dENYVISIT) {
		DENYVISIT = dENYVISIT;
	}
	public int getOWNER() {
		return OWNER;
	}
	public void setOWNER(int oWNER) {
		OWNER = oWNER;
	}
	public int getACTGRADE() {
		return ACTGRADE;
	}
	public void setACTGRADE(int aCTGRADE) {
		ACTGRADE = aCTGRADE;
	}
	public String getMEMO() {
		return MEMO;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
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
	public String getEDITDATE() {
		return EDITDATE;
	}
	public void setEDITDATE(String eDITDATE) {
		EDITDATE = eDITDATE;
	}
	public int getEDITUSER() {
		return EDITUSER;
	}
	public void setEDITUSER(int eDITUSER) {
		EDITUSER = eDITUSER;
	}
	public int getISDELETE() {
		return ISDELETE;
	}
	public void setISDELETE(int iSDELETE) {
		ISDELETE = iSDELETE;
	}
	public int getCLINO() {
		return CLINO;
	}
	public void setCLINO(int cLINO) {
		CLINO = cLINO;
	}
	
	
	
	
	
	
}
