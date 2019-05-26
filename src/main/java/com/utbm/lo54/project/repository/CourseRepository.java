package com.utbm.lo54.project.repository;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

import com.utbm.lo54.project.entity.Course;

public interface CourseRepository extends CrudRepository<Course, Integer> {

}