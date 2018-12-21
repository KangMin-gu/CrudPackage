package saas.crud.crm.ce;

import java.util.List;
import java.util.Map;

public interface MailDao {
    public List<Map<String, Object>> allTarget(MailDto emailDto);
    public void UpdateMailState(MailDto emailDto);
    
    public void mailClick(MailDto emailDto);
    public void mailDeny(MailDto emailDto);
    
    public void clickHistory(Map<String,Object> param);
    
  //파일 첨부
  	public List<Map<String,Object>> fileAttach(Map<String, Object> map);
}
