package saas.crud.crm.cu.dto;

public class CustDenyDto {

	private int DENYNO;
	private int CUSTNO;
	private int DENYMAILAD ;
	private int DENYMAILNEWS ;
	private int DENYMAILSEMINAR;
	private int DENYSMSNOMAL;
	private int DENYSMSSEMINAR ;
	private int DENYSMSAD ;
	private int DENYDMNEWS ;
	private int DENYDMSEMINAR ;
	private int DENYDMAD ;
	private int DENYTELNEWS ;
	private int DENYTELSEMINAR;
	private int DENYFAX;
	private int DENYVISIT ;
	private String REGDATE;
	private int REGUSER;
	private String EDITDATE;
	private int EDITUSER;
	private int ISDELETE;
	
	
	public CustDenyDto() {}


	public CustDenyDto(int dENYNO, int cUSTNO, int dENYMAILAD, int dENYMAILNEWS,
			int dENYMAILSEMINAR, int dENYSMSNOMAL, int dENYSMSSEMINAR, int dENYSMSAD,
			int dENYDMNEWS, int dENYDMSEMINAR, int dENYDMAD, int dENYTELNEWS, int dENYTELSEMINAR,
			int dENYFAX, int dENYVISIT, String rEGDATE, int rEGUSER, String eDITDATE, int eDITUSER,
			int iSDELETE) {
		super();
		DENYNO = dENYNO;
		CUSTNO = cUSTNO;
		DENYMAILAD = dENYMAILAD;
		DENYMAILNEWS = dENYMAILNEWS;
		DENYMAILSEMINAR = dENYMAILSEMINAR;
		DENYSMSNOMAL = dENYSMSNOMAL;
		DENYSMSSEMINAR = dENYSMSSEMINAR;
		DENYSMSAD = dENYSMSAD;
		DENYDMNEWS = dENYDMNEWS;
		DENYDMSEMINAR = dENYDMSEMINAR;
		DENYDMAD = dENYDMAD;
		DENYTELNEWS = dENYTELNEWS;
		DENYTELSEMINAR = dENYTELSEMINAR;
		DENYFAX = dENYFAX;
		DENYVISIT = dENYVISIT;
		REGDATE = rEGDATE;
		REGUSER = rEGUSER;
		EDITDATE = eDITDATE;
		EDITUSER = eDITUSER;
		ISDELETE = iSDELETE;
	}


	public int getDENYNO() {
		return DENYNO;
	}


	public void setDENYNO(int dENYNO) {
		DENYNO = dENYNO;
	}


	public int getCUSTNO() {
		return CUSTNO;
	}


	public void setCUSTNO(int cUSTNO) {
		CUSTNO = cUSTNO;
	}


	public int getDENYMAILAD() {
		return DENYMAILAD;
	}


	public void setDENYMAILAD(int dENYMAILAD) {
		DENYMAILAD = dENYMAILAD;
	}


	public int getDENYMAILNEWS() {
		return DENYMAILNEWS;
	}


	public void setDENYMAILNEWS(int dENYMAILNEWS) {
		DENYMAILNEWS = dENYMAILNEWS;
	}


	public int getDENYMAILSEMINAR() {
		return DENYMAILSEMINAR;
	}


	public void setDENYMAILSEMINAR(int dENYMAILSEMINAR) {
		DENYMAILSEMINAR = dENYMAILSEMINAR;
	}


	public int getDENYSMSNOMAL() {
		return DENYSMSNOMAL;
	}


	public void setDENYSMSNOMAL(int dENYSMSNOMAL) {
		DENYSMSNOMAL = dENYSMSNOMAL;
	}


	public int getDENYSMSSEMINAR() {
		return DENYSMSSEMINAR;
	}


	public void setDENYSMSSEMINAR(int dENYSMSSEMINAR) {
		DENYSMSSEMINAR = dENYSMSSEMINAR;
	}


	public int getDENYSMSAD() {
		return DENYSMSAD;
	}


	public void setDENYSMSAD(int dENYSMSAD) {
		DENYSMSAD = dENYSMSAD;
	}


	public int getDENYDMNEWS() {
		return DENYDMNEWS;
	}


	public void setDENYDMNEWS(int dENYDMNEWS) {
		DENYDMNEWS = dENYDMNEWS;
	}


	public int getDENYDMSEMINAR() {
		return DENYDMSEMINAR;
	}


	public void setDENYDMSEMINAR(int dENYDMSEMINAR) {
		DENYDMSEMINAR = dENYDMSEMINAR;
	}


	public int getDENYDMAD() {
		return DENYDMAD;
	}


	public void setDENYDMAD(int dENYDMAD) {
		DENYDMAD = dENYDMAD;
	}


	public int getDENYTELNEWS() {
		return DENYTELNEWS;
	}


	public void setDENYTELNEWS(int dENYTELNEWS) {
		DENYTELNEWS = dENYTELNEWS;
	}


	public int getDENYTELSEMINAR() {
		return DENYTELSEMINAR;
	}


	public void setDENYTELSEMINAR(int dENYTELSEMINAR) {
		DENYTELSEMINAR = dENYTELSEMINAR;
	}


	public int getDENYFAX() {
		return DENYFAX;
	}


	public void setDENYFAX(int dENYFAX) {
		DENYFAX = dENYFAX;
	}


	public int getDENYVISIT() {
		return DENYVISIT;
	}


	public void setDENYVISIT(int dENYVISIT) {
		DENYVISIT = dENYVISIT;
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
	
	
	
	
}
