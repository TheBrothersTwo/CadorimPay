package App.repository;

import org.springframework.data.repository.CrudRepository;

import App.models.Client;

public interface ClientRepository extends CrudRepository<Client, Integer> {
	
	public Client findByEmailAndPassword(String email, String password);
	public Client findByEmail(String email);
	public Client findById(int id);

}
