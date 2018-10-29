package saas.crud.crm.nt.dto;

import org.springframework.web.multipart.MultipartFile;

public class NoteDto {
	
	private int NOTICEID; //내부통지번호
	private String TOUSERNO; //보내는이
	private String CCUSERNO; //참조
	private String LNKURL; //링크
	private int NTCWAYEMAIL; //통지매체 email 
	private int NTCWAYSMS; //통지매체 sms 
	private int CHKRLTCODE; //통지 읽음 체크 
	private String CHKRLTDATE; //읽은 날짜 
	private int READCHEK; //통지 내용 체크 
	private String READDATE; //통지 읽음 날짜 
	private String EMAIL; //이메일주소 
	private String MOBILE1; 
	private String MOBILE2;
	private String MOBILE3;
	private String TITLE; //제목 
	private String CONTENTS; //내용 
	private String REGDATE; //등록일 
	private int REGUSER; //등록자 
	private int ISDELETE; //삭제여부 
	private int SITEID; //사이트 
	private int IMPORTANT; //중요메일여부
	private MultipartFile FILEPATH; //첨부파일
	
	public NoteDto () {}

	public NoteDto(int nOTICEID, String tOUSERNO, String cCUSERNO, String lNKURL, int nTCWAYEMAIL, int nTCWAYSMS,
			int cHKRLTCODE, String cHKRLTDATE, int rEADCHEK, String rEADDATE, String eMAIL, String mOBILE1,
			String mOBILE2, String mOBILE3, String tITLE, String cONTENTS, String rEGDATE, int rEGUSER, int iSDELETE,
			int sITEID, int iMPORTANT, MultipartFile fILEPATH) {
		super();
		NOTICEID = nOTICEID;
		TOUSERNO = tOUSERNO;
		CCUSERNO = cCUSERNO;
		LNKURL = lNKURL;
		NTCWAYEMAIL = nTCWAYEMAIL;
		NTCWAYSMS = nTCWAYSMS;
		CHKRLTCODE = cHKRLTCODE;
		CHKRLTDATE = cHKRLTDATE;
		READCHEK = rEADCHEK;
		READDATE = rEADDATE;
		EMAIL = eMAIL;
		MOBILE1 = mOBILE1;
		MOBILE2 = mOBILE2;
		MOBILE3 = mOBILE3;
		TITLE = tITLE;
		CONTENTS = cONTENTS;
		REGDATE = rEGDATE;
		REGUSER = rEGUSER;
		ISDELETE = iSDELETE;
		SITEID = sITEID;
		IMPORTANT = iMPORTANT;
		FILEPATH = fILEPATH;
	}

	public int getNOTICEID() {
		return NOTICEID;
	}

	public void setNOTICEID(int nOTICEID) {
		NOTICEID = nOTICEID;
	}

	public String getTOUSERNO() {
		return TOUSERNO;
	}

	public void setTOUSERNO(String tOUSERNO) {
		TOUSERNO = tOUSERNO;
	}

	public String getCCUSERNO() {
		return CCUSERNO;
	}

	public void setCCUSERNO(String cCUSERNO) {
		CCUSERNO = cCUSERNO;
	}

	public String getLNKURL() {
		return LNKURL;
	}

	public void setLNKURL(String lNKURL) {
		LNKURL = lNKURL;
	}

	public int getNTCWAYEMAIL() {
		return NTCWAYEMAIL;
	}

	public void setNTCWAYEMAIL(int nTCWAYEMAIL) {
		NTCWAYEMAIL = nTCWAYEMAIL;
	}

	public int getNTCWAYSMS() {
		return NTCWAYSMS;
	}

	public void setNTCWAYSMS(int nTCWAYSMS) {
		NTCWAYSMS = nTCWAYSMS;
	}

	public int getCHKRLTCODE() {
		return CHKRLTCODE;
	}

	public void setCHKRLTCODE(int cHKRLTCODE) {
		CHKRLTCODE = cHKRLTCODE;
	}

	public String getCHKRLTDATE() {
		return CHKRLTDATE;
	}

	public void setCHKRLTDATE(String cHKRLTDATE) {
		CHKRLTDATE = cHKRLTDATE;
	}

	public int getREADCHEK() {
		return READCHEK;
	}

	public void setREADCHEK(int rEADCHEK) {
		READCHEK = rEADCHEK;
	}

	public String getREADDATE() {
		return READDATE;
	}

	public void setREADDATE(String rEADDATE) {
		READDATE = rEADDATE;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
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

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getCONTENTS() {
		return CONTENTS;
	}

	public void setCONTENTS(String cONTENTS) {
		CONTENTS = cONTENTS;
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

	public int getISDELETE() {
		return ISDELETE;
	}

	public void setISDELETE(int iSDELETE) {
		ISDELETE = iSDELETE;
	}

	public int getSITEID() {
		return SITEID;
	}

	public void setSITEID(int sITEID) {
		SITEID = sITEID;
	}

	public int getIMPORTANT() {
		return IMPORTANT;
	}

	public void setIMPORTANT(int iMPORTANT) {
		IMPORTANT = iMPORTANT;
	}

	public MultipartFile getFILEPATH() {
		return FILEPATH;
	}

	public void setFILEPATH(MultipartFile fILEPATH) {
		FILEPATH = fILEPATH;
	}

	
}
