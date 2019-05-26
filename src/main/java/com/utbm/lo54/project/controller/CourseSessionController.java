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

    @RequestMapping("/courseSession")
    public List<CourseSession> getAllCourseSessions() {
        return courseSessionService.getAllCoursesSession();
    }

    @RequestMapping("/courses-session/{id}")
    public CourseSession getCourseSession(@PathVariable Integer id) {
        return courseSessionService.getCourseSession(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/courses/{courseId}/session/{locationId}")
    public void addCourseSession(@RequestBody CourseSession courseSession, @PathVariable Integer courseId, @PathVariable Integer locationId ) {
    	courseSession.setCourse(new Course(courseId, ""));
    	courseSession.setLocation(new Location (locationId, ""));
        courseSessionService.addCourseSession(courseSession);
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/courses/{courseId}/session/{locationId}/{id}")
    public void updateCourseSession(@RequestBody CourseSession courseSession, @PathVariable Integer courseId, @PathVariable Integer locationId) {
    	courseSession.setCourse(new Course(courseId, ""));
    	courseSession.setLocation(new Location(locationId, ""));
    	courseSessionService.updateCourseSession(courseSession);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/courses/{courseId}/session/{locationId}/{id}")
    public void deleteCourseSession(@PathVariable Integer id) {
        courseSessionService.deleteCourseSession(id);
    }
}