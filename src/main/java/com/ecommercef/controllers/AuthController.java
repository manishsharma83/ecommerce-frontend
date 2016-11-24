package com.ecommercef.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController extends BaseController{
	
	@RequestMapping (value="/login")
	public String getLoginForm(ModelMap map){
		return "login";
	}
	
	@RequestMapping (value="/access_denied")
	public String getAccessDeniedForm(ModelMap map){
		return "access_denied";
	}
}
