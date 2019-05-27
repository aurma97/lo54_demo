package com.utbm.lo54.project.entity;

import javax.persistence.*;

@Entity
public class Client {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    
    @Column(nullable=false)
    private String firstName;
    
    @Column(nullable=false)
    private String lastName;
    
    @Column(nullable=false)
    private String address;
    
    @Column(nullable=false)
    private String phone;
    
    @Column
    private String email;
    
    @ManyToOne
    @JoinColumn(name="course_session_id", nullable=false)
    private CourseSession courseSession;

    public Client(){
    	
    }

	public Client(String firstName, String lastName, String address, String phone, String email, CourseSession courseSession) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.courseSession = courseSession;
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
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the courseSession
	 */
	public CourseSession getCourseSession() {
		return courseSession;
	}

	/**
	 * @param courseSession the courseSession to set
	 */
	public void setCourseSession(CourseSession courseSession) {
		this.courseSession = courseSession;
	}
}