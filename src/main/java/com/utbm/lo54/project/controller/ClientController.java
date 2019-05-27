package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;

@RestController
public class ClientController {
    @Autowired
    private ClientService clientService;

    @Autowired
    private CourseSessionService courseSessionService;
    
    @Autowired
    private NotificationService notificationService;
   
    
    @RequestMapping("/clients")
    public List<Client> getAllClients() {
        return clientService.getAllClients();
    }

    @RequestMapping("/clients/{id}")
    public Client getClient(@PathVariable Integer id) {
        return clientService.getClient(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/client/{courseSessionId}/session/")
    public void addClient(@RequestBody Client client, @PathVariable Integer courseSessionId) {
    	
    	client.setCourseSession(courseSessionService.getCourseSession(courseSessionId));
        clientService.addClient(client);
        
        if (client.getEmail() != null) {
        	try {
        		notificationService.sendNotification(client);
        	}catch(MailException e) {
        		System.out.println(e.getMessage());
        	}
        }
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