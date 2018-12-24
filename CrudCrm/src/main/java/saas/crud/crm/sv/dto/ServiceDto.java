package saas.crud.crm.sv.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ServiceDto {
	
	private int serviceno;
	private String servicename;
	private String servicedesc;
	private int serviceowner;
	private String receptiondate;
	private int custno;
	private int clino;
	private int servicestep;
	private int owner;
	private int siteid;
	private int servicetype;
	private int servicecode;
	private int servicechannel;
	private String filesearchkey;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int isdelete;
	private List<MultipartFile> servicefile; //Spring 에서 파일 업로드 처리하기 위해
	
	public ServiceDto() {}

	public ServiceDto(int serviceno, String servicename, String servicedesc, int serviceowner, String receptiondate,
			int custno, int clino, int servicestep, int owner, int siteid, int servicetype, int servicecode,
			int servicechannel, String filesearchkey, String regdate, int reguser, String edtdate, int edtuser,
			int isdelete, List<MultipartFile> servicefile) {
		super();
		this.serviceno = serviceno;
		this.servicename = servicename;
		this.servicedesc = servicedesc;
		this.serviceowner = serviceowner;
		this.receptiondate = receptiondate;
		this.custno = custno;
		this.clino = clino;
		this.servicestep = servicestep;
		this.owner = owner;
		this.siteid = siteid;
		this.servicetype = servicetype;
		this.servicecode = servicecode;
		this.servicechannel = servicechannel;
		this.filesearchkey = filesearchkey;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.isdelete = isdelete;
		this.servicefile = servicefile;
	}

	public int getServiceno() {
		return serviceno;
	}

	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
	}

	public String getServicename() {
		return servicename;
	}

	public void setServicename(String servicename) {
		this.servicename = servicename;
	}

	public String getServicedesc() {
		return servicedesc;
	}

	public void setServicedesc(String servicedesc) {
		this.servicedesc = servicedesc;
	}

	public int getServiceowner() {
		return serviceowner;
	}

	public void setServiceowner(int serviceowner) {
		this.serviceowner = serviceowner;
	}

	public String getReceptiondate() {
		return receptiondate;
	}

	public void setReceptiondate(String receptiondate) {
		this.receptiondate = receptiondate;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public int getClino() {
		return clino;
	}

	public void setClino(int clino) {
		this.clino = clino;
	}

	public int getServicestep() {
		return servicestep;
	}

	public void setServicestep(int servicestep) {
		this.servicestep = servicestep;
	}

	public int getOwner() {
		return owner;
	}

	public void setOwner(int owner) {
		this.owner = owner;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}

	public int getServicetype() {
		return servicetype;
	}

	public void setServicetype(int servicetype) {
		this.servicetype = servicetype;
	}

	public int getServicecode() {
		return servicecode;
	}

	public void setServicecode(int servicecode) {
		this.servicecode = servicecode;
	}

	public int getServicechannel() {
		return servicechannel;
	}

	public void setServicechannel(int servicechannel) {
		this.servicechannel = servicechannel;
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

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	public List<MultipartFile> getServicefile() {
		return servicefile;
	}

	public void setServicefile(List<MultipartFile> servicefile) {
		this.servicefile = servicefile;
	};
	
	
	
	
	
}
