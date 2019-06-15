/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Roméo NGOULA
 */


@RestController
public class NumberController {
    @Autowired
    private ClientService clientService;
    
    @Autowired
    private CourseService courseService;
    
    @Autowired
    private LocationService locationService;

    @Autowired
    private CourseSessionService courseSessionService;
    
    @Autowired
    private NotificationService notificationService;
   
    //Nombre de clients
    @RequestMapping("")
    public ModelAndView getNumbers(){
        List<Client> clients = clientService.getAllClients();
        List<Course> course = courseService.getAllCourses();
        List<CourseSession> courseSession = courseSessionService.getAllCoursesSession();
        List<Location> location = locationService.getAllLocations();
        
        //Nombre de clients
        Integer nbClient = clientService.numClient();
        //Nombre de cours
        Integer nbCourse = courseService.numCourse();
        //Nombre de session
        Integer nbSession = courseSessionService.numSession();
        //Nombre de location
        Integer nblocation = locationService.numLocation();
        
        ModelAndView index = new ModelAndView("index");
        index.addObject("nbClient",nbClient);
        index.addObject("nbCourse", nbCourse);
        index.addObject("nbSession", nbSession);
        index.addObject("nbLocation", nblocation);
        
        return index;
    };


    
}
