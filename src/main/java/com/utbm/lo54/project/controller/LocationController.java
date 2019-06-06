package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LocationController {
    @Autowired
    private LocationService locationService;

    @RequestMapping("/locations")
    public ModelAndView getAllLocations() {
        List<Location> locations = locationService.getAllLocations();
      //Envoi de tous les cours à la vue
    	ModelAndView model = new ModelAndView("body/locations/all");
    	model.addObject("locations", locations);
    	return model;
    }

    @RequestMapping("/locations/{id}")
    public Location getLocation(@PathVariable Integer id) {
        return locationService.getLocation(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/locations/addLocation")
    public ModelAndView addLocation(@ModelAttribute("locationForm") Location location) {
    	locationService.addLocation(location);
    	return new ModelAndView("redirect:/locations");
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/locations/updateLocation/{id}")
    public ModelAndView updateLocation(@PathVariable Integer id) {
    	//locationService.updateLocation(location);
    	Location location = locationService.getLocation(id);
    	ModelAndView model = new ModelAndView("body/locations/add");
     	model.addObject("locationForm", location);
     	return model;
    	
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/locations/deleteLocation/{id}")
    public ModelAndView deleteLocation(@PathVariable Integer id) {
    	locationService.deleteLocation(id);
    	return new ModelAndView("redirect:/locations");
    }
    //Méthode qui renvoit la vue vers le formulaire d'ajout
    @RequestMapping(method = RequestMethod.GET, value = "/locations/vueAddLocation/")
    public ModelAndView vueAddLocation() {
    	ModelAndView model = new ModelAndView("body/locations/add");
    	Location location = new Location();
    	model.addObject("locationForm", location);
    	return model;
    }
    
}