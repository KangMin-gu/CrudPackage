package saas.crud.crm.au.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import saas.crud.crm.au.dto.GoodsDto;

public interface GoodsService {
	
	public List<GoodsDto> getGoodsB(HttpServletRequest request);

}