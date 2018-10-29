package saas.crud.crm.nt.dto;

public class NoteCategoryDto {
	
	private int USERNO; 
	private String CATEGORY1;
	private String CATEGORY2;
	private String CATEGORY3;
	private String CATEGORY4; 
	private String CATEGORY5;
	private int REGUSER;
	private String REGDATE;
	private int EDTEUSER;
	private String EDTEDATE;
	private int SITEID;
	private int ISDELETE;
	
	public NoteCategoryDto() {}

	public NoteCategoryDto(int uSERNO, String cATEGORY1, String cATEGORY2, String cATEGORY3, String cATEGORY4,
			String cATEGORY5, int rEGUSER, String rEGDATE, int eDTEUSER, String eDTEDATE, int sITEID, int iSDELETE) {
		super();
		USERNO = uSERNO;
		CATEGORY1 = cATEGORY1;
		CATEGORY2 = cATEGORY2;
		CATEGORY3 = cATEGORY3;
		CATEGORY4 = cATEGORY4;
		CATEGORY5 = cATEGORY5;
		REGUSER = rEGUSER;
		REGDATE = rEGDATE;
		EDTEUSER = eDTEUSER;
		EDTEDATE = eDTEDATE;
		SITEID = sITEID;
		ISDELETE = iSDELETE;
	}

	public int getUSERNO() {
		return USERNO;
	}

	public void setUSERNO(int uSERNO) {
		USERNO = uSERNO;
	}

	public String getCATEGORY1() {
		return CATEGORY1;
	}

	public void setCATEGORY1(String cATEGORY1) {
		CATEGORY1 = cATEGORY1;
	}

	public String getCATEGORY2() {
		return CATEGORY2;
	}

	public void setCATEGORY2(String cATEGORY2) {
		CATEGORY2 = cATEGORY2;
	}

	public String getCATEGORY3() {
		return CATEGORY3;
	}

	public void setCATEGORY3(String cATEGORY3) {
		CATEGORY3 = cATEGORY3;
	}

	public String getCATEGORY4() {
		return CATEGORY4;
	}

	public void setCATEGORY4(String cATEGORY4) {
		CATEGORY4 = cATEGORY4;
	}

	public String getCATEGORY5() {
		return CATEGORY5;
	}

	public void setCATEGORY5(String cATEGORY5) {
		CATEGORY5 = cATEGORY5;
	}

	public int getREGUSER() {
		return REGUSER;
	}

	public void setREGUSER(int rEGUSER) {
		REGUSER = rEGUSER;
	}

	public String getREGDATE() {
		return REGDATE;
	}

	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}

	public int getEDTEUSER() {
		return EDTEUSER;
	}

	public void setEDTEUSER(int eDTEUSER) {
		EDTEUSER = eDTEUSER;
	}

	public String getEDTEDATE() {
		return EDTEDATE;
	}

	public void setEDTEDATE(String eDTEDATE) {
		EDTEDATE = eDTEDATE;
	}

	public int getSITEID() {
		return SITEID;
	}

	public void setSITEID(int sITEID) {
		SITEID = sITEID;
	}

	public int getISDELETE() {
		return ISDELETE;
	}

	public void setISDELETE(int iSDELETE) {
		ISDELETE = iSDELETE;
	}
	
	
}
