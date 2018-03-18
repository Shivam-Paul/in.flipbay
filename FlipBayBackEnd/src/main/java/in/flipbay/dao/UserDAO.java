package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.User;

public interface UserDAO {

	public boolean save(User user);

	public boolean update(User user);

	public User get(String id);

	public boolean delete(String id);

	public List<User> list();

	public User validate(String id, String password);

}
