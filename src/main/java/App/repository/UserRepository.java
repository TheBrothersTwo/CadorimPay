package App.repository;

import org.springframework.data.repository.CrudRepository;

import App.models.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	
	public User findById(int id);

}
