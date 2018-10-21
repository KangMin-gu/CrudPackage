package saas.crud.crm.email.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.email.dto.EmailDto;

@Repository
public class EmailDaoImpl implements EmailDao {

    @Autowired
    private SqlSession session;

    //이메일 배치 코드10 로우가져오기
    @Override
    public List<Map<String, Object>> Alltarget(EmailDto emailDto){

        List<Map<String, Object>> list = session.selectList("email.allTarget", emailDto);

        return list;
    }

    //발송 상태값변경 or emailsample 용
    @Override
    public void UpdateMailState(EmailDto emailDto) { session.update("email.sendstate", emailDto); }

}
