package com.utbm.lo54.project.repository;

import org.springframework.data.repository.CrudRepository;
import com.utbm.lo54.project.entity.Topic;

public interface TopicRepository extends CrudRepository<Topic, String> {

}