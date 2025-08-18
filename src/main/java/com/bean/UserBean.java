package com.bean;

import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public class UserBean {
	private Integer userId;
	
	@NotBlank(message = "Please Enter First Name")
	@Pattern(regexp = "[a-zA-Z]+", message = "Please Enter Valid First Name")
	private String firstName;
	
	@NotBlank(message = "Please Enter Last Name")
	@Pattern(regexp = "[a-zA-Z]+", message = "Please Enter Valid Last Name")
	private String lastName;
	
	@NotBlank(message = "Please Enter Email")
	@Email(message = "Please Enter Valid Email")
	private String email;
	
	@NotBlank(message = "Please Enter Password")
	@Length(min = 8, max = 25, message = "Password Length must be between 8 and 25")
	private String password;

	private String confirmPassword;
	
	private String role;
	
	private String createdAt;
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}