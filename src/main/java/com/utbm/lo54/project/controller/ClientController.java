package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.*;

@RestController
public class ClientController {
    @Autowired
    private ClientService clientService;

    @Autowired
    private CourseSessionService courseSessionService;
    
    @Autowired
    private NotificationService notificationService;
   
    //Liste de tous les clients
    @RequestMapping("/clients")
    public ModelAndView getAllClients() {
    	List<Client> clients = clientService.getAllClients();
        //Envoi de tous les cours à la vue
        ModelAndView model = new ModelAndView("body/clients/all");
        
        //Ajout de l'objet courseSession pour afficher tous ces informations en fonction de l'id du client
        model.addObject("courseSessionService", courseSessionService);
        model.addObject("clients", clients);
        return model;
    }

    @RequestMapping("/clients/{id}")
    public Client getClient(@PathVariable Integer id) {
        return clientService.getClient(id);
    }
    
    @RequestMapping("/clients/count/{CourseSessionId}")
    public Long getCount(@PathVariable Integer CourseSessionId) {
    	CourseSession cs = courseSessionService.getCourseSession(CourseSessionId);
        return clientService.CountByCourseSession(cs);
    }

    //Ajout d'un nouveau client
    @RequestMapping(method = RequestMethod.POST, value = "/clients/{courseSessionId}/addClient")
    public void addClient(@RequestBody Client client, @PathVariable Integer courseSessionId) {
    	
    	client.setCourseSession(courseSessionService.getCourseSession(courseSessionId));
        clientService.addClient(client);
        System.out.println(client.getEmail());
        
        if (client.getEmail() != null) {
        	try {
        		notificationService.sendNotification(client);
        	}catch(MailException e) {
        		e.printStackTrace();
        		System.out.println(e.getMessage());
        	} catch (MessagingException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
        }
        //return new ModelAndView("redirect:/sessions");
    }
    
    //Maj d'un client
    @RequestMapping(method = RequestMethod.POST, value = "/client/updateClient/{courseSessionId}/{id}")
    public ModelAndView updateClient(@ModelAttribute("client") Client client, @PathVariable Integer courseSessionId, @PathVariable Integer id){
    	
    	Client cs = clientService.getClient(id);
    	cs.setLastName(client.getLastName());
    	cs.setFirstName(client.getFirstName());
    	cs.setAddress(client.getAddress());
    	cs.setPhone(client.getPhone());
    	cs.setEmail(client.getEmail());
    	cs.setCourseSession(courseSessionService.getCourseSession(courseSessionId));
    	clientService.updateClient(cs);
     	return new ModelAndView("redirect:/clients");
    }
    
    //Suppression d'un Client
    @RequestMapping(method = RequestMethod.GET, value = "/client/deleteClient/{id}")
    public ModelAndView deleteClient(@PathVariable Integer id) {
        clientService.deleteClient(id);
        return new ModelAndView("redirect:/clients");
    }
    
    //Retourne la liste des clients inscrits à une session
    @RequestMapping(method = RequestMethod.GET, value = "/client/allClients/{courseSessionId}")
    public ModelAndView clientsSession(@PathVariable Integer courseSessionId) {
    	ModelAndView model = new ModelAndView("body/clients/allSession");
    	CourseSession cs = courseSessionService.getCourseSession(courseSessionId);
    	List<Client> clients = clientService.findByCourseSession(cs);
    	//Charge tous les clients de la session dans la vue
    	model.addObject("clients", clients);
    	//Charge la session concernée
    	model.addObject("session", cs);
    	return model;
    }
    
    //Récupération du client pour passer à la vue edit
    @RequestMapping(method = RequestMethod.GET, value = "/client/vueUpdate/{id}")
    public ModelAndView vueUpdate(@PathVariable Integer id){
        Client cl = clientService.getClient(id);
        ModelAndView model = new ModelAndView("body/clients/edit");
        CourseSession cs = courseSessionService.getCourseSession(cl.getCourseSession().getId());
        
        model.addObject("session", cs);
        model.addObject("client",cl);
        return model;
    }
}