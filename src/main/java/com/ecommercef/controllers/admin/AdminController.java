package com.ecommercef.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ecommercef.controllers.BaseController;


@Controller
public class AdminController extends BaseController{
	
	@RequestMapping (value="/admin/dashboard")
	public String getIndex(ModelMap model){
		
		return "admin/admin-dashboard";
	}

}
