package App.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import App.models.User;
import App.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	private final UserRepository  userRepository ;
	
	public UserService(UserRepository  userRepository){
		this.userRepository = userRepository;
	}
	
	
	public void saveUser(User user) {
		userRepository.save(user);
	}
	
	public void daleteUser(User user) {
		userRepository.delete(user);
	}
	
	public List<User> findAll(){
		List<User> users = new ArrayList<User>();
		for(User user : userRepository.findAll()) {users.add(user);}
		return users;
	}
	
	public User findById(int id){
		return userRepository.findById(id);
	}

}
