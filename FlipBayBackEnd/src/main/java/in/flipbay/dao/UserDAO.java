package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.User;

public interface UserDAO {

	public boolean saveOrUpdate(User user);

	public User get(String id);

	public boolean delete(String id);

	public List<User> list();

	public User validate(String id, String password);
	
	public boolean register(User user);

}
