package App.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import App.models.Client;
import App.repository.ClientRepository;

@Service
@Transactional
public class ClientService {
	
	private final ClientRepository clientRepository;
	
	public  ClientService( ClientRepository clientRepository) {
		this.clientRepository= clientRepository;
	}
	
	public void saveClient(Client client) {
		clientRepository.save(client);
	}
	
	public List<Client> AllClients(){
		List<Client> clients = new ArrayList<Client>();
		for(Client client : clientRepository.findAll() ) {clients.add(client);}
		return clients;
	}
	
	public Client findByEmailAndPassword(String email, String password) {
		return clientRepository.findByEmailAndPassword(email, password);
	};
	
	
	public Client findById(int id) {
		return clientRepository.findById(id);
	}
	

	public Client findByEmail(String email) {
		return clientRepository.findByEmail(email);
	}
	

}
