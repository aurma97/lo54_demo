package com.utbm.lo54.project.entity;

import java.util.Set;

import javax.persistence.*;


@Entity
public class Course {

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable=false)
    private String title;
    
    @OneToMany(mappedBy = "course")
    Set<CourseSession> courseSession;
    
    public Course() {
    	
    }
    
	public Course(Integer id, String title) {
		this.id = id;
		this.title = title;
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
    
   
}