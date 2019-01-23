package saas.crud.crm.au.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<GoodsDto> getGoodsB(GoodsDto goodsDto) {
		List<GoodsDto> goodsB = session.selectList("goods.getGoodsB",goodsDto);
		return goodsB;
	}

}
