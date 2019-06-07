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

    @RequestMapping(method = RequestMethod.PUT, value = "/client/{courseSessionId}/session/{id}")
    public void updateClient(@RequestBody Client client, @PathVariable Integer courseSessionId, @PathVariable Integer id) {
    	
    	Client cs = clientService.getClient(id);
    	cs.setLastName(client.getLastName());
    	cs.setFirstName(client.getFirstName());
    	cs.setAddress(client.getAddress());
    	cs.setPhone(client.getPhone());
    	cs.setEmail(client.getEmail());
    	cs.setCourseSession(courseSessionService.getCourseSession(courseSessionId));
    	clientService.updateClient(cs);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/client/{id}")
    public void deleteClient(@PathVariable Integer id) {
        clientService.deleteClient(id);
    }
}