package com.ecommercef.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;


@Controller
public class ProductController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@RequestMapping (value="/product/{id}")
	public String getProductDetails(ModelMap model, @PathVariable("id") int id){
		Product product = productService.getProduct(id);
		model.addAttribute("product", product);
		model.addAttribute("user", getPrincipal());
		return "product-details";
	}
}
