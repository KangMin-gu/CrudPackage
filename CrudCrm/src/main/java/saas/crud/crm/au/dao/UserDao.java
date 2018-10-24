package saas.crud.crm.au.dao;

import saas.crud.crm.au.dto.UserDto;

public interface UserDao {
	public UserDto getData(String userId);
}
