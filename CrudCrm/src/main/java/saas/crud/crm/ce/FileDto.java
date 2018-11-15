package saas.crud.crm.ce;

public class FileDto {
	
	private int fileid;
	private String savefilename;
	private String orgfilename;
	private String realpath;
	private long filesize;
	private String path;
	private int filesearchkey;
	private int userno;
	private int siteid;
	private String sub;
	
	public FileDto() {}

	public FileDto(int fileid, String savefilename, String orgfilename, String realpath, long filesize, String path,
			int filesearchkey, int userno, int siteid, String sub) {
		super();
		this.fileid = fileid;
		this.savefilename = savefilename;
		this.orgfilename = orgfilename;
		this.realpath = realpath;
		this.filesize = filesize;
		this.path = path;
		this.filesearchkey = filesearchkey;
		this.userno = userno;
		this.siteid = siteid;
		this.sub = sub;
	}

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
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

	public String getRealpath() {
		return realpath;
	}

	public void setRealpath(String realpath) {
		this.realpath = realpath;
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

	public int getFilesearchkey() {
		return filesearchkey;
	}

	public void setFilesearchkey(int filesearchkey) {
		this.filesearchkey = filesearchkey;
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

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	
}
