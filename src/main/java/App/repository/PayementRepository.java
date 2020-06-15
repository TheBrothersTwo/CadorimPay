package App.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import App.models.Payement;

public interface PayementRepository extends CrudRepository<Payement,Integer> {
	
	public Payement findById(int id);
	
	public List<Payement> findAllByIdc(int idc);
	
	@Query("select p from Payement p where p.statut=?1")
	public List<Payement> findByStatut(String statut);
	
	@Query("select count(p) from Payement p where p.statut=?1")
	public int countByStatut(String statut);
	

}
