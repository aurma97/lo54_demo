package com.utbm.lo54.project.repository;

import org.springframework.data.repository.CrudRepository;

import com.utbm.lo54.project.entity.Client;

public interface ClientRepository extends CrudRepository<Client, Integer> {
	
}