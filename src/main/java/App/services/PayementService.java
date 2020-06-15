package App.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import App.models.Payement;
import App.repository.PayementRepository;

@Service
@Transactional 
public class PayementService {
	
	private final PayementRepository payementRepository;
	
	public PayementService(PayementRepository payementRepository) {
		this.payementRepository = payementRepository;
	}
	
	public void savePayement(Payement payement) {
		payementRepository.save(payement);
	}
	
	public List<Payement> Allpayements(){
		 List<Payement> payements = new ArrayList<Payement>();
		 for(Payement payement: payementRepository.findAll()) {
			 payements.add(payement);
		 }
		 return payements;
		 
		
	}
	
	public List<Payement> findByStatut(String statut){
		List<Payement> payements = new ArrayList<Payement>();
		 for(Payement payement: payementRepository.findByStatut(statut)) {
			 payements.add(payement);
		 }
		 return payements;
	}
		
	
	
	public Payement findById(int id) {
		return payementRepository.findById(id);
	}
	
	public int countByStatut(String statut) {
		return payementRepository.countByStatut(statut);
	}
	
	
	public List<Payement> findAllById(int idc){
		 List<Payement> payements = new ArrayList<Payement>();
		 for(Payement payement: payementRepository.findAllByIdc(idc)) {
			 payements.add(payement);
		 }
		 return payements;
		 
		
	}
	

}
