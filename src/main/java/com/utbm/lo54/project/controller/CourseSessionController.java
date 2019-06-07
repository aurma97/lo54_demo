package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CourseSessionController {
    @Autowired
    private CourseSessionService courseSessionService;

    @Autowired
    private CourseService courseService;
    
    @Autowired
    private ClientService clientService;
    
    @Autowired
    private LocationService locationService;
    
    @RequestMapping("/courseSession")
    public  ModelAndView getAllCourseSessions() {
    	List<CourseSession> sessions = courseSessionService.getAllCoursesSession();
    	
    	for(CourseSession session : sessions) {
    		session.setBusy(clientService.CountByCourseSession(session));
    	}
    	
    	//Envoi de toutes les sessions à la vue sessions/all
    	ModelAndView model = new ModelAndView("body/sessions/all");
    	model.addObject("sessions", sessions);
    	return model;
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
    
    //Renvoit vers le formulaire de création d'un nouveau client avec l'id de la session
    @RequestMapping(method = RequestMethod.GET, value ="/client/applySession/{id}")
    public ModelAndView applySession(@PathVariable Integer id) {
    	CourseSession courseSession = courseSessionService.getCourseSession(id);
    	ModelAndView model = new ModelAndView("body/clients/add");
    	model.addObject("sessionForm", courseSession);
    	
    	return model;
    }
}