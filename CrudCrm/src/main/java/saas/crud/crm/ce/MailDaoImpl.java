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

    // 메일 클릭
	@Override
	public void mailClick(MailDto emailDto) {
		session.update("email.clickCnt",emailDto);
		
	}

	// 메일 수신거부
	@Override
	public void mailDeny(MailDto emailDto) {
		session.update("email.denyEmail",emailDto);
	}

	// 메일 클릭 이력
	@Override
	public void clickHistory(Map<String, Object> param) {
		session.insert("email.clickHistory",param);
	}
	
	//파일첨부
  	@Override
  	public List<Map<String, Object>> fileAttach(Map<String, Object> map) {
  			List<Map<String,Object>> fileInfo = session.selectList("email.noteAttach",map);
  			return fileInfo;

  	}
}
