package in.flipbay.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.CategoryDAO;
import in.flipbay.domain.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private Category category;

	public CategoryDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

	}

	public CategoryDAOImpl() {

	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean save(Category category) {

		try {
			if (category.getDescription() == null) {
				category.setDescription(category.getName());
			}
			getSession().save(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean update(Category category) {

		try {
			getSession().update(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public Category get(int id) {

		return getSession().get(Category.class, id);

	}

	public boolean delete(int id) {
		try {
			category = get(id);
			if (category == null) {
				return false;
			}
			getSession().delete(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Category> list() {
		return getSession().createQuery("from Category").list();
	}

}
