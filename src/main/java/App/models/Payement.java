package App.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payement")
public class Payement {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private int id;
	private int idc;
	private double montent;
	private String date, iban, nom_E, reference, commentaire, statut;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdc() {
		return idc;
	}
	public void setIdc(int idc) {
		this.idc = idc;
	}
	public double getMontent() {
		return montent;
	}
	public void setMontent(double montent) {
		this.montent = montent;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIban() {
		return iban;
	}
	public void setIban(String iban) {
		this.iban = iban;
	}
	public String getNom_E() {
		return nom_E;
	}
	public void setNom_E(String nom_E) {
		this.nom_E = nom_E;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getCommentaire() {
		return commentaire;
	}
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}
	
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	@Override
	public String toString() {
		return "Payement [id=" + id + ", idc=" + idc + ", montent=" + montent + ", date="
				+ date + ", iban=" + iban + ", nom_E=" + nom_E + ", reference=" + reference + ", commentaire="
				+ commentaire + ", statut=" + statut + "]";
	}
	
	
	
	

}
