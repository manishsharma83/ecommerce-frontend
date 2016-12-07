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
public class AdminProductController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@RequestMapping (value="/admin/products/list", method = RequestMethod.GET)
	public String getProductList(ModelMap model){
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		model.addAttribute("user", getPrincipal());
		return "admin/products/list";
	}
}
