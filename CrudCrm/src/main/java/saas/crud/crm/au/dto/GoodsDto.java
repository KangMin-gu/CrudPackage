package saas.crud.crm.au.dto;

import java.io.Serializable;

public class GoodsDto {
	
	private int goodsno;
	private String goodsb;
	private String goodsm;
	private String goodss;
	private String goodsdesc;
	private int isdelete;
	private String regdate;
	private int reguser;
	private String edtdate;
	private int edtuser;
	private int siteid;
	
	public GoodsDto() {};
	
	public GoodsDto(int goodsno, String goodsb, String goodsm, String goodss, String goodsdesc, int isdelete,
			String regdate, int reguser, String edtdate, int edtuser, int siteid) {
		super();
		this.goodsno = goodsno;
		this.goodsb = goodsb;
		this.goodsm = goodsm;
		this.goodss = goodss;
		this.goodsdesc = goodsdesc;
		this.isdelete = isdelete;
		this.regdate = regdate;
		this.reguser = reguser;
		this.edtdate = edtdate;
		this.edtuser = edtuser;
		this.siteid = siteid;
	}

	public int getGoodsno() {
		return goodsno;
	}

	public void setGoodsno(int goodsno) {
		this.goodsno = goodsno;
	}

	public String getGoodsb() {
		return goodsb;
	}

	public void setGoodsb(String goodsb) {
		this.goodsb = goodsb;
	}

	public String getGoodsm() {
		return goodsm;
	}

	public void setGoodsm(String goodsm) {
		this.goodsm = goodsm;
	}

	public String getGoodss() {
		return goodss;
	}

	public void setGoodss(String goodss) {
		this.goodss = goodss;
	}

	public String getGoodsdesc() {
		return goodsdesc;
	}

	public void setGoodsdesc(String goodsdesc) {
		this.goodsdesc = goodsdesc;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
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

	public int getSiteid() {
		return siteid;
	}

	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}
	
}
