package saas.crud.crm.cu.dto;

public class CustDenyDto {

	private int denyno;
	private int custno;
	private int denymailnomal;
	private int denymailsurvey;
	private int denymailad;
	private int denymailnews;
	private int denymailseminar;
	private int denysmsnomal;
	private int denysmssurvey;
	private int denysmsseminar;
	private int denysmsad;
	private int denydmnomal;
	private int denydmsurvey;
	private int denydmnews;
	private int denydmseminar;
	private int denydmad;
	private int denytelnews;
	private int denytelseminar;
	private int denyfax;
	private int denyvisit;
	private String regdate;
	private int reguser;
	private String editdate;
	private int edituser;
	private int isdelete;

	public CustDenyDto() {}

	public CustDenyDto(int denyno, int custno, int denymailnomal, int denymailsurvey, int denymailad, int denymailnews,
			int denymailseminar, int denysmsnomal, int denysmssurvey, int denysmsseminar, int denysmsad,
			int denydmnomal, int denydmsurvey, int denydmnews, int denydmseminar, int denydmad, int denytelnews,
			int denytelseminar, int denyfax, int denyvisit, String regdate, int reguser, String editdate, int edituser,
			int isdelete) {
		super();
		this.denyno = denyno;
		this.custno = custno;
		this.denymailnomal = denymailnomal;
		this.denymailsurvey = denymailsurvey;
		this.denymailad = denymailad;
		this.denymailnews = denymailnews;
		this.denymailseminar = denymailseminar;
		this.denysmsnomal = denysmsnomal;
		this.denysmssurvey = denysmssurvey;
		this.denysmsseminar = denysmsseminar;
		this.denysmsad = denysmsad;
		this.denydmnomal = denydmnomal;
		this.denydmsurvey = denydmsurvey;
		this.denydmnews = denydmnews;
		this.denydmseminar = denydmseminar;
		this.denydmad = denydmad;
		this.denytelnews = denytelnews;
		this.denytelseminar = denytelseminar;
		this.denyfax = denyfax;
		this.denyvisit = denyvisit;
		this.regdate = regdate;
		this.reguser = reguser;
		this.editdate = editdate;
		this.edituser = edituser;
		this.isdelete = isdelete;
	}

	public int getDenyno() {
		return denyno;
	}

	public void setDenyno(int denyno) {
		this.denyno = denyno;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public int getDenymailnomal() {
		return denymailnomal;
	}

	public void setDenymailnomal(int denymailnomal) {
		this.denymailnomal = denymailnomal;
	}

	public int getDenymailsurvey() {
		return denymailsurvey;
	}

	public void setDenymailsurvey(int denymailsurvey) {
		this.denymailsurvey = denymailsurvey;
	}

	public int getDenymailad() {
		return denymailad;
	}

	public void setDenymailad(int denymailad) {
		this.denymailad = denymailad;
	}

	public int getDenymailnews() {
		return denymailnews;
	}

	public void setDenymailnews(int denymailnews) {
		this.denymailnews = denymailnews;
	}

	public int getDenymailseminar() {
		return denymailseminar;
	}

	public void setDenymailseminar(int denymailseminar) {
		this.denymailseminar = denymailseminar;
	}

	public int getDenysmsnomal() {
		return denysmsnomal;
	}

	public void setDenysmsnomal(int denysmsnomal) {
		this.denysmsnomal = denysmsnomal;
	}

	public int getDenysmssurvey() {
		return denysmssurvey;
	}

	public void setDenysmssurvey(int denysmssurvey) {
		this.denysmssurvey = denysmssurvey;
	}

	public int getDenysmsseminar() {
		return denysmsseminar;
	}

	public void setDenysmsseminar(int denysmsseminar) {
		this.denysmsseminar = denysmsseminar;
	}

	public int getDenysmsad() {
		return denysmsad;
	}

	public void setDenysmsad(int denysmsad) {
		this.denysmsad = denysmsad;
	}

	public int getDenydmnomal() {
		return denydmnomal;
	}

	public void setDenydmnomal(int denydmnomal) {
		this.denydmnomal = denydmnomal;
	}

	public int getDenydmsurvey() {
		return denydmsurvey;
	}

	public void setDenydmsurvey(int denydmsurvey) {
		this.denydmsurvey = denydmsurvey;
	}

	public int getDenydmnews() {
		return denydmnews;
	}

	public void setDenydmnews(int denydmnews) {
		this.denydmnews = denydmnews;
	}

	public int getDenydmseminar() {
		return denydmseminar;
	}

	public void setDenydmseminar(int denydmseminar) {
		this.denydmseminar = denydmseminar;
	}

	public int getDenydmad() {
		return denydmad;
	}

	public void setDenydmad(int denydmad) {
		this.denydmad = denydmad;
	}

	public int getDenytelnews() {
		return denytelnews;
	}

	public void setDenytelnews(int denytelnews) {
		this.denytelnews = denytelnews;
	}

	public int getDenytelseminar() {
		return denytelseminar;
	}

	public void setDenytelseminar(int denytelseminar) {
		this.denytelseminar = denytelseminar;
	}

	public int getDenyfax() {
		return denyfax;
	}

	public void setDenyfax(int denyfax) {
		this.denyfax = denyfax;
	}

	public int getDenyvisit() {
		return denyvisit;
	}

	public void setDenyvisit(int denyvisit) {
		this.denyvisit = denyvisit;
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

}
