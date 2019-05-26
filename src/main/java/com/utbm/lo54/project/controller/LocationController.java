package com.utbm.lo54.project.controller;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.service.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class LocationController {
    @Autowired
    private LocationService locationService;

    @RequestMapping("/locations")
    public List<Location> getAllLocations() {
        return locationService.getAllLocations();
    }

    @RequestMapping("/locations/{id}")
    public Location getLocation(@PathVariable Integer id) {
        return locationService.getLocation(id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/locations")
    public void addLocation(@RequestBody Location location) {
    	locationService.addLocation(location);
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/locations/{id}")
    public void updateLocation(@RequestBody Location location) {
    	locationService.updateLocation(location);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/locations/{id}")
    public void deleteLocation(@PathVariable Integer id) {
    	locationService.deleteLocation(id);
    }
    
}