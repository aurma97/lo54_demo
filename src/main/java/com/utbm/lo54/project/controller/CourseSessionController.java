package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class CourseSessionController {
    @Autowired
    private CourseSessionService courseSessionService;

    @Autowired
    private CourseService courseService;
    
    @Autowired
    private LocationService locationService;
    
    @RequestMapping("/courseSession")
    public List<CourseSession> getAllCourseSessions() {
        return courseSessionService.getAllCoursesSession();
    }

    @RequestMapping("/courseSession/{id}")
    public CourseSession getCourseSession(@PathVariable Integer id) {
        return courseSessionService.getCourseSession(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/courses/{courseId}/session/{locationId}")
    public void addCourseSession(@RequestBody CourseSession courseSession, @PathVariable Integer courseId, @PathVariable Integer locationId) {
    	courseSession.setCourse(courseService.getCourse(courseId));
    	courseSession.setLocation(locationService.getLocation(locationId));
        courseSessionService.addCourseSession(courseSession);
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/courses/{courseId}/session/{locationId}/{id}")
    public void updateCourseSession(@RequestBody CourseSession courseSession, @PathVariable Integer courseId, @PathVariable Integer locationId, @PathVariable Integer id) {
    	
    	CourseSession cs = courseSessionService.getCourseSession(id);
    	cs.setStartDate(courseSession.getStartDate());
    	cs.setEndDate(courseSession.getEndDate());
    	cs.setMax(courseSession.getMax());
    	cs.setCourse(courseService.getCourse(courseId));
    	cs.setLocation(locationService.getLocation(locationId));
    	courseSessionService.updateCourseSession(cs);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/courseSession/{id}")
    public void deleteCourseSession(@PathVariable Integer id) {
        courseSessionService.deleteCourseSession(id);
    }
}