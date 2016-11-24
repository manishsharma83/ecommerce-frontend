package com.ecommercef.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;


@Controller
@RequestMapping ("/admin")
public class AdminController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@RequestMapping (value="/")
	public String getIndex(ModelMap model){
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		model.addAttribute("user", getPrincipal());
		return "admin-dashboard";
	}
}
