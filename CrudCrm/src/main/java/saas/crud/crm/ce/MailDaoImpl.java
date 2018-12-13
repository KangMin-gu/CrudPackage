package saas.crud.crm.ce;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailDaoImpl implements MailDao {

    @Autowired
    private SqlSession session;

    //이메일 배치 코드10 로우가져오기
    @Override
    public List<Map<String, Object>> allTarget(MailDto emailDto){

        List<Map<String, Object>> list = session.selectList("email.allTarget", emailDto);

        return list;
    }

    //발송 상태값변경 or emailsample 용
    @Override
    public void UpdateMailState(MailDto emailDto) { session.update("email.sendstate", emailDto); }

	@Override
	public void mailClick(MailDto emailDto) {
		// TODO Auto-generated method stub
		
		session.update("email.clickCnt",emailDto);
		
	}
    

}
