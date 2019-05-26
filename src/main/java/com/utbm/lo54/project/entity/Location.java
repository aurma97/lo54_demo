package com.utbm.lo54.project.entity;

import java.util.Set;

import javax.persistence.*;

@Entity
public class Location {

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
	
    @Column(nullable=false)
    private String city;
    
    @OneToMany(mappedBy = "location")
    Set<CourseSession> courseSession;
    
    public Location() {
    	
    }
    
	public Location(Integer id, String city) {
		this.id = id;
		this.city = city;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}


}