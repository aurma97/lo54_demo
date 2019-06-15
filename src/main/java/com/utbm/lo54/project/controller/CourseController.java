package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;
    
    @Autowired
    private CourseSessionService courseSessionService;

    @RequestMapping("/courses")
    public ModelAndView getAllCourses() {
    	List<Course> courses =  courseService.getAllCourses();
    	
    	//Envoi de tous les cours à la vue
    	ModelAndView model = new ModelAndView("body/courses/all");
    	model.addObject("courses", courses);
    	return model;

    }

    @RequestMapping("/courses/{id}")
    public Course getCourse(@PathVariable Integer id) {
        return courseService.getCourse(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/courses/addCourse")
    public ModelAndView addCourse(@ModelAttribute("courseForm") Course course) {
        courseService.addCourse(course);
        //rédiriger vers la page de toutes les courses
        return new ModelAndView("redirect:/courses");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/courses/updateCourse/{id}")
    public ModelAndView updateCourse(@PathVariable Integer id) {
    	
        //courseService.updateCourse(course);
        Course course = courseService.getCourse(id);
        ModelAndView model = new ModelAndView("body/courses/add");
    	model.addObject("courseForm", course);
    	return model;

    }
    
    //Delete course
    @RequestMapping(method = RequestMethod.GET, value = "/courses/deleteCourse/{id}")
    public ModelAndView deleteCourse(@PathVariable Integer id) {
        Course course = courseService.getCourse(id);
        Boolean error = true;
        Boolean test = true;
        
        List<CourseSession> sessions = courseSessionService.getAllCoursesSession();
        for(CourseSession session : sessions) {
            if(Objects.equals(session.getCourse().getId(), course.getId())){
                test = false;
                break;
            }
        }
        if(!test){
            error = false;
        }else{
            error = true;
            courseService.deleteCourse(id);
            return new ModelAndView("redirect:/courses");
        }
        ModelAndView model = new ModelAndView("body/courses/all");
        model.addObject("error", error);
        
        return model;
    }
    
    //Méthode qui renvoit la vue vers le formulaire d'ajout
    @RequestMapping(method = RequestMethod.GET, value = "/courses/vueAddCourse/")
    public ModelAndView vueAdd() {
    	ModelAndView model = new ModelAndView("body/courses/add");
    	Course course = new Course();
    	model.addObject("courseForm", course);
    	return model;
    }
}