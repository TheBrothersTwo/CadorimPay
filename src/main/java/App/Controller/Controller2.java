package App.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import App.models.User;
import App.services.PayementService;
import App.services.UserService;

@Controller
public class Controller2 {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PayementService payementService;
	
	@RequestMapping("/ajouUser")
	public String ajouter(HttpServletRequest request) {
		request.setAttribute("new", payementService.countByStatut("v"));
		request.setAttribute("mode", "AddUser");
		return "user";
		
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute User user,HttpServletRequest request) {
		
		userService.saveUser(user);
		request.setAttribute("users", userService.findAll());
		request.setAttribute("mode", "EditeUser");
		request.setAttribute("new", payementService.countByStatut("v"));
		return "user";
		
	}
	
	@RequestMapping("/editUser")
	public String editer(HttpServletRequest request) {
		request.setAttribute("users", userService.findAll());
		request.setAttribute("mode", "EditeUser");
		request.setAttribute("new", payementService.countByStatut("v"));
		return "user";
		
	}
	
	@RequestMapping("/modifier")
	public String modifier(@RequestParam int id ,HttpServletRequest request) {
		request.setAttribute("user", userService.findById(id));
		request.setAttribute("mode", "Modifier");
		request.setAttribute("new", payementService.countByStatut("v"));
		return "user";
		
	}
	
	@RequestMapping("/supprimer")
	public String supprimer(@RequestParam int id ,HttpServletRequest request) {
		userService.daleteUser(userService.findById(id));
		request.setAttribute("users", userService.findAll());
		request.setAttribute("mode", "EditeUser");
		request.setAttribute("new", payementService.countByStatut("v"));
		return "user";}
	
	@PostMapping("/changer")
	public String changer(@ModelAttribute User user,HttpServletRequest request) {
		userService.saveUser(user);
		request.setAttribute("users", userService.findAll());
		request.setAttribute("mode", "EditeUser");
		request.setAttribute("new", payementService.countByStatut("v"));
		return "user";
		
	}
	
	

}
