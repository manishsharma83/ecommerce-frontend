package com.ecommercef.controllers.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import com.ecommercef.controllers.BaseController;


@Controller
public class AdminController extends BaseController{
	
	@RequestMapping (value="/admin/dashboard")
	public String getIndex(ModelMap model){
		
		return "admin/admin-dashboard";
	}

}
