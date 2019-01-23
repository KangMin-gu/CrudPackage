package saas.crud.crm.au.dao;

import java.util.List;

import saas.crud.crm.au.dto.GoodsDto;

public interface GoodsDao {
	
	public List<GoodsDto> getGoodsB(GoodsDto goodsDto);

}
