package saas.crud.crm.ce;

import java.util.List;
import java.util.Map;

public interface MailDao {
    public List<Map<String, Object>> allTarget(MailDto emailDto);
    public void UpdateMailState(MailDto emailDto);
}
