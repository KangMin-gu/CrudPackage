package saas.crud.crm.common;

public class FileDto {
	
	private int filesearchkey;
	private String savefilename;
	private String orgfilename;
	private long filesize;
	private String path;
	private int userno;
	private int siteid;
	
	public FileDto() {}

	public FileDto(int filesearchkey, String savefilename, String orgfilename, long filesize, String path, int userno,
			int siteid) {
		super();
		this.filesearchkey = filesearchkey;
		this.savefilename = savefilename;
		this.orgfilename = orgfilename;
		this.filesize = filesize;
		this.path = path;
		this.userno = userno;
		this.siteid = siteid;
	}

	public int getFilesearchkey() {
		return filesearchkey;
	}

	public void setFilesearchkey(int filesearchkey) {
		this.filesearchkey = filesearchkey;
	}

	public String getSavefilename() {
		return savefilename;
	}

	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}

	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}
	
	
}
