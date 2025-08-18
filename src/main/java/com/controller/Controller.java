package com.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.bean.UserBean;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	JdbcTemplate stmt;

	@GetMapping("signup")
	public String signup() {
		return "Signup";
	}
	
	@PostMapping("saveuser")
	public String saveUser(@Validated UserBean user, BindingResult result, Model model) {
		if(!user.getPassword().equals(user.getConfirmPassword())) {
			result.rejectValue("confirmPassword","error.confirmPassword","Password and Confirm Password Must be Same");
		}
		
		if(result.hasErrors()) {
			model.addAttribute("result",result);
			model.addAttribute("user",user);
			return "Signup";
		}
		
		try {
			stmt.queryForObject("SELECT * FROM USERS WHERE email = ?", new BeanPropertyRowMapper<>(UserBean.class), user.getEmail());
			model.addAttribute("signupError","<div class='alert alert-danger text-center'>Email Id Already exists</div>");
			model.addAttribute("user",user);
			return "Signup";
		} catch (Exception e) {
			stmt.update("INSERT INTO USERS (firstName, lastName, email, password, role, createdAt) VALUES (?, ?, ?, ?, ?, ?)",user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(), "Student" ,LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));
			return "Login";
		}
	}
	
	@GetMapping("login")
	public String login() {
		return "Login";
	}
	
	@PostMapping("validateuser")
	 public String validateUser(@Validated UserBean user, BindingResult result, Model model) {
        boolean isError = false;

        if (result.getFieldErrorCount("email") != 0) {
            isError = true;
        }

        if (result.getFieldErrorCount("password") != 0) {
            isError = true;
        }

        if (isError) {
            model.addAttribute("result", result);
            model.addAttribute("user", user);
            return "Login";
        } else {
            try {
                UserBean newUser = stmt.queryForObject("SELECT * FROM users WHERE email = ? AND password = ?",new BeanPropertyRowMapper<>(UserBean.class),user.getEmail(), user.getPassword());
                model.addAttribute("user", newUser);
                if(newUser.getRole().equals("Admin")) {
                	return "redirect:/adminhome";
                }
                else {
                	return "StudentHome";
                }

            } catch (org.springframework.dao.EmptyResultDataAccessException e) {
                model.addAttribute("result", result);
                model.addAttribute("user", user);
                model.addAttribute("credentialError", "<div class='alert alert-danger text-center'>Invalid Email or Password</div>");
                return "Login";
            }
        }
	}
	
	@GetMapping("adminhome")
	public String adminHome() {
		return "AdminHome";
	}
	
	@GetMapping("adduser")
	public String addUser() {
		return "AddUser";
	}
	
	@PostMapping("registeruser")
	public String registerUser(@Validated UserBean user, BindingResult result, Model model) {
		if(!user.getPassword().equals(user.getConfirmPassword())) {
			result.rejectValue("confirmPassword","error.confirmPassword","Password and Confirm Password Must be Same");
		}
		
		if(result.hasErrors()) {
			model.addAttribute("result",result);
			model.addAttribute("user",user);
			return "AddUser";
		}
		
		try {
			stmt.queryForObject("SELECT * FROM USERS WHERE email = ?", new BeanPropertyRowMapper<>(UserBean.class), user.getEmail());
			model.addAttribute("signupError","<div class='alert alert-danger text-center'>Email Id Already exists</div>");
			model.addAttribute("user",user);
			return "AddUser";
		} catch (Exception e) {
			stmt.update("INSERT INTO USERS (firstName, lastName, email, password, role, createdAt) VALUES (?, ?, ?, ?, ?, ?)",user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(), user.getRole() ,LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));
			return "redirect:/adminhome";
		}
	}
	
	@GetMapping("liststudents")
	public String listStudents(Model model) {
		List<UserBean> users = stmt.query("select * from users where role = ?",new BeanPropertyRowMapper<>(UserBean.class), new Object[] {"Student"});
		model.addAttribute("users",users);
		return "ListStudents";
	}
}