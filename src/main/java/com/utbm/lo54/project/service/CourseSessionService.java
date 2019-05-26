package com.utbm.lo54.project.service;

import java.util.ArrayList;
import java.util.List;

import com.utbm.lo54.project.entity.CourseSession;
import com.utbm.lo54.project.repository.CourseSessionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseSessionService {

    @Autowired
    private CourseSessionRepository courseSessionRepository;

    public List<CourseSession> getAllCoursesSession() {
        List<CourseSession> courseSession = new ArrayList<>();
        courseSessionRepository.findAll().forEach(courseSession::add);
        return courseSession;
    }

    public CourseSession getCourseSession(Integer id) {
        return courseSessionRepository.findById(id).orElse(null);
    }

    public void addCourseSession(CourseSession courseSession) {
    	courseSessionRepository.save(courseSession);
    }

    public void updateCourseSession(CourseSession courseSession) {
    	courseSessionRepository.save(courseSession);
    }

    public void deleteCourseSession(Integer id) {
    	courseSessionRepository.deleteById(id);
    }
}