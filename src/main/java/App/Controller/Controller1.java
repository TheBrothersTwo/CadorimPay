package App.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import App.models.Client;
import App.models.Payement;
import App.services.ClientService;
import App.services.PayementService;

import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class


@Controller
public class Controller1 {
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private PayementService payementService;
	
	@RequestMapping("/")
    public String home(HttpServletRequest request,HttpSession session) {
		Client client = (Client) session.getAttribute("client1");
		if(client==null) {
		request.setAttribute("type", "login");
        return "accueil";}
		else {
			request.setAttribute("client", client);
			return "compte";
			
		}
    }
	
	@RequestMapping("/signin")
    public String singin(HttpServletRequest request) {
		request.setAttribute("type", "signin");
        return "accueil";
    }
	
	@PostMapping("/register")
	public String register(@ModelAttribute Client client, @RequestParam String confirmation ,HttpServletRequest request,HttpSession session) {
		if(client.getPassword().equals(confirmation)) {
		clientService.saveClient(client);
		session.setAttribute("client1", clientService.findByEmailAndPassword(client.getEmail(), client.getPassword()));
		request.setAttribute("client", clientService.findByEmailAndPassword(client.getEmail(), client.getPassword()));
		return "compte";}
		else {
			request.setAttribute("client", client);	
			request.setAttribute("error", "Les deux mots de passe sont differents");
			request.setAttribute("type", "signin");	
		return "accueil";}
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute Client client, HttpServletRequest request,HttpSession session) {
		if(clientService.findByEmailAndPassword(client.getEmail(), client.getPassword()) !=null ) {
			Client client1 = new Client();
			client1 = clientService.findByEmailAndPassword(client.getEmail(), client.getPassword());
			session.setAttribute("client1", client1);
			request.setAttribute("client1", clientService.findByEmailAndPassword(client.getEmail(), client.getPassword()));
			return "compte";}
		else {
		request.setAttribute("error", "email ou mot de passe errone");
		request.setAttribute("type", "login");	
		return "accueil";}
	}
	
	@PostMapping("/logout")
	public String logout(HttpServletRequest request,HttpSession session) {
			session.removeAttribute("client1");
		request.setAttribute("type", "login");	
		return "accueil";}
	
	@RequestMapping("/payement")
    public String payement(HttpServletRequest request,HttpSession session) {
		Client client = (Client) session.getAttribute("client1");
		if(client==null) {
			request.setAttribute("type", "login");
	        return "accueil";}
		request.setAttribute("client1", client);
		request.setAttribute("mode", "AJOUTER");
		request.setAttribute("active", "active");
        return "payement";
    }

	@PostMapping("/payer")
    public String payer(@ModelAttribute Payement  payement, HttpServletRequest request ,HttpSession session) {
	    LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
	    String date = myDateObj.format(myFormatObj);
		payement.setDate(date);
		Client client = (Client) session.getAttribute("client1");
		if(client==null) {
			request.setAttribute("type", "login");
	        return "accueil";}
		payement.setIdc(client.getId());
		payement.setStatut("v");
		payementService.savePayement(payement);
		request.setAttribute("client1", client);
        return "compte";
    }
	
	@RequestMapping("/admin")
    public String admin(HttpServletRequest request) {
		request.setAttribute("mode", "ADMIN_LOGIN");
        return "admin";
    }
	
	@RequestMapping("/index")
    public String adminIndex(HttpServletRequest request) {
		request.setAttribute("new", payementService.countByStatut("v"));
		request.setAttribute("mode", "ADMIN_INDEX");
        return "admin";
    }
	
	@RequestMapping("/auth")
    public String adminAuyh(@RequestParam String email ,@RequestParam String password , HttpServletRequest request) {
		if(email.equals("admin@gmail.com") && password.equals("admin")) {
			request.setAttribute("new", payementService.countByStatut("v"));
			request.setAttribute("mode", "ADMIN_INDEX");
	        return "admin";
		}
		else{request.setAttribute("error", "email ou mot de passe errone");
		request.setAttribute("mode", "ADMIN_LOGIN");
        return "admin";}
    }
	
	
	
	@RequestMapping("/gestionP")
    public String gestionP(HttpServletRequest request) {
		
		request.setAttribute("mode", "DEMANDE_PAYEMENT");
		request.setAttribute("payements", payementService.findByStatut("v"));
        return "admin";
    }

	@RequestMapping("/demande_detail")
    public String gestionP(@RequestParam int id,HttpServletRequest request) {
		Payement payement = payementService.findById(id);
		request.setAttribute("mode", "DEMANDE_DETAIL");
		request.setAttribute("payement", payement);
		request.setAttribute("client", clientService.findById(payement.getIdc()));
		request.setAttribute("new", payementService.countByStatut("v"));
        return "admin";
    }
	
	@RequestMapping("/approuved")
    public String approuved(@RequestParam int id,HttpServletRequest request) {
		Payement payement = payementService.findById(id);
		payement.setStatut("approuver");
		payementService.savePayement(payement);
		request.setAttribute("mode", "DEMANDE_PAYEMENT");
		request.setAttribute("payements", payementService.findByStatut("v"));
        return "admin";
    }
	
	@RequestMapping("/rejeted")
    public String rejeted(@RequestParam int id,HttpServletRequest request) {
		Payement payement = payementService.findById(id);
		payement.setStatut("rejeter");
		payementService.savePayement(payement);
		request.setAttribute("mode", "DEMANDE_PAYEMENT");
		request.setAttribute("payements", payementService.findByStatut("v"));
        return "admin";
    }
   
	
	@RequestMapping("/historique")
    public String clientDemande(HttpServletRequest request,HttpSession session) {
		Client client = (Client) session.getAttribute("client1");
		if(client==null) {
			request.setAttribute("type", "login");
	        return "accueil";}
		request.setAttribute("client1", client);	
		request.setAttribute("mode", "HISTORIQUE");
		request.setAttribute("active1", "active");
		request.setAttribute("payements", payementService.findAllById(client.getId()));
        return "payement";
        }
}
