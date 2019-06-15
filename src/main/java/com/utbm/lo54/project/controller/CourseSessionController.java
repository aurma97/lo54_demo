package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.math.RoundingMode;
import java.text.DecimalFormat;
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
    public ModelAndView getAllCourseSessions() {
    	List<CourseSession> sessions = courseSessionService.getAllCoursesSession();
    	
    	for(CourseSession session : sessions) {
    		Float percentage = ((float) clientService.CountByCourseSession(session) / session.getMax())*100 ;
                //Arrondi du pourcentage
                DecimalFormat df = new DecimalFormat("#.##");
                df.setRoundingMode(RoundingMode.HALF_UP);
                 
                //Float percent = (float)Math.round(percentage * 0);
                
    		session.setBusy(df.format(percentage));
    		session.setParticipants(clientService.CountByCourseSession(session));
    	}
    	
    	
    	//Envoi de toutes les sessions � la vue sessions/all
    	ModelAndView model = new ModelAndView("body/sessions/all");
    	model.addObject("sessions", sessions);
    	return model;
    }

    @RequestMapping("/courseSession/{id}")
    public CourseSession getCourseSession(@PathVariable Integer id) {
        return courseSessionService.getCourseSession(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/session/addCourseSession")
    public ModelAndView addCourseSession(@ModelAttribute("session") CourseSession courseSession) {
    	//courseSession.setCourse(courseSession.getCourse());
    	//courseSession.setLocation(locationService.getLocation(locationId));
        courseSessionService.addCourseSession(courseSession);
        return new ModelAndView("redirect:/courseSession");
    }

    //Maj d'une session
    @RequestMapping(method = RequestMethod.POST, value = "/session/updateSession/{id}")
    public ModelAndView updateCourseSession(@ModelAttribute("session") CourseSession courseSession, @PathVariable Integer id) {
    	
    	CourseSession cs = courseSessionService.getCourseSession(id);
    	cs.setStartDate(courseSession.getStartDate());
    	cs.setEndDate(courseSession.getEndDate());
    	cs.setMax(courseSession.getMax());
    	cs.setCourse(cs.getCourse());
    	cs.setLocation(cs.getLocation());
    	courseSessionService.updateCourseSession(cs);
        return new ModelAndView("redirect:/courseSession");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/session/deleteSession/{id}")
    public ModelAndView deleteCourseSession(@PathVariable Integer id) {
        //Récupère la session pour vérifier s'il y a des clients ou pas
        CourseSession cs = courseSessionService.getCourseSession(id);       
        List<Client> clients = clientService.findByCourseSession(cs);
 
        Boolean error;
        
        if(clients.isEmpty()){
            error = true;
            courseSessionService.deleteCourseSession(id);
            return new ModelAndView("redirect:/courseSession");
        }else{
            error = false;
        }
        
        ModelAndView model = new ModelAndView("body/sessions/all");
        model.addObject("error", error);
        
        return model;
    }
    
  //Méthode qui renvoit la vue vers le formulaire d'ajout de la sessioin
    @RequestMapping(method = RequestMethod.GET, value = "/session/vueAddSession")
    public ModelAndView vueAddSession() {
    	ModelAndView model = new ModelAndView("body/sessions/add");
    	List<Course> courses = courseService.getAllCourses();
    	List<Location> locations = locationService.getAllLocations();
    	//CourseSession courseSessionForm = new CourseSession();
    	//model.addObject("courseSessionForm", courseSessionForm);
        CourseSession session = new CourseSession();
        model.addObject("session", session);
    	model.addObject("courses", courses);
    	model.addObject("locations", locations);
    	return model;
    }
    
    //Méthode qui renvoit la vue d'update de la session
    @RequestMapping(method =  RequestMethod.GET, value = "/session/vueUpdateSession/{id}")
    public ModelAndView vueUpdateSession(@PathVariable Integer id){
        ModelAndView model = new ModelAndView("body/sessions/edit");
        List<Course> courses = courseService.getAllCourses();
    	List<Location> locations = locationService.getAllLocations();
        CourseSession session = courseSessionService.getCourseSession(id);
        model.addObject("courses", courses);
    	model.addObject("locations", locations);
        model.addObject("session", session);
        
        return model;
    }
}