package com.utbm.lo54.project.repository;

import org.springframework.data.repository.CrudRepository;

import com.utbm.lo54.project.entity.Client;
import com.utbm.lo54.project.entity.CourseSession;

public interface ClientRepository extends CrudRepository<Client, Integer> {
	Long countByCourseSession(CourseSession cs);
}