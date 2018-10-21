package saas.crud.crm.email.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.email.dto.EmailDto;

public interface EmailDao {
    public List<Map<String, Object>> Alltarget(EmailDto emailDto);
    public void UpdateMailState(EmailDto emailDto);
}
