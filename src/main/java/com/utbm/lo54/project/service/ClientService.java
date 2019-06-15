package com.utbm.lo54.project.service;

import java.util.ArrayList;
import java.util.List;

import com.utbm.lo54.project.entity.Client;
import com.utbm.lo54.project.entity.CourseSession;
import com.utbm.lo54.project.repository.ClientRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public List<Client> getAllClients() {
        List<Client> client = new ArrayList<>();
        clientRepository.findAll().forEach(client::add);
        return client;
    }

    public Client getClient(Integer id) {
        return clientRepository.findById(id).orElse(null);
    }

    public void addClient(Client client) {
    	clientRepository.save(client);
    }

    public void updateClient(Client client) {
    	clientRepository.save(client);
    }

    public void deleteClient(Integer id) {
    	clientRepository.deleteById(id);
    }
    
    public Long CountByCourseSession(CourseSession cs) {
    	return clientRepository.countByCourseSession(cs);
    }
    
    public List<Client> findByCourseSession(CourseSession cs){
    	return clientRepository.findByCourseSession(cs);
    }
    //Retourne le nombre de clients
    public Integer numClient(){
        List<Client> client = new ArrayList<>();
        clientRepository.findAll().forEach(client::add);
        return client.size();
    }
}