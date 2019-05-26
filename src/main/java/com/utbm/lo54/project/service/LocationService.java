package com.utbm.lo54.project.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.utbm.lo54.project.entity.*;
import com.utbm.lo54.project.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationService {

    @Autowired
    private LocationRepository locationRepository;

    public List<Location> getAllLocations() {
        List<Location> locations = new ArrayList<>();
        locationRepository.findAll().forEach(locations::add);
        return locations;
    }

    public Location getLocation(Integer id) {
        return locationRepository.findById(id).orElse(null);
    }

    public void addLocation(Location location) {
    	locationRepository.save(location);
    }

    public void updateLocation(Location location) {
    	locationRepository.save(location);
    }

    public void deleteLocation(Integer id) {
    	locationRepository.deleteById(id);
    }
}