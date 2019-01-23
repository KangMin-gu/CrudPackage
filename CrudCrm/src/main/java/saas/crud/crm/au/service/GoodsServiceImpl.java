package saas.crud.crm.au.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import saas.crud.crm.au.dao.GoodsDao;
import saas.crud.crm.au.dto.GoodsDto;

public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDao goodsDao;
	
	@Override
	public List<GoodsDto> getGoodsB(HttpServletRequest request) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setSiteid(siteId);
		
		List<GoodsDto> goodsB = goodsDao.getGoodsB(goodsDto);

		return goodsB;
	}

}
