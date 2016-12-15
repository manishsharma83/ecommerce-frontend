package com.ecommercef.controllers.admin;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.model.Product;
import com.ecommerce.model.ProductCategory;
import com.ecommerce.service.ProductCategoryService;
import com.ecommerce.service.ProductService;
import com.ecommercef.controllers.BaseController;


@Controller
public class AdminProductController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductCategoryService productCategoryService;
	
	@RequestMapping (value="/admin/products/list", method = RequestMethod.GET)
	public String getProductList(ModelMap model){
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		model.addAttribute("user", getPrincipal());
		return "admin/products/list";
	}
	
	@RequestMapping (value="/admin/products/view/{productId}", method = RequestMethod.GET)
	public String viewProduct(@PathVariable int productId, ModelMap model){
		Product product = productService.getProduct(productId);
		model.addAttribute("product", product);
		model.addAttribute("user", getPrincipal());
		return "admin/products/view";
	}
	
	@RequestMapping (value="/admin/products/add", method = RequestMethod.GET)
	public String addProduct(ModelMap model){
		List<ProductCategory> productCategories = productCategoryService.getAllProductCategories();
		model.addAttribute("productCategories", productCategories);
		model.addAttribute("user", getPrincipal());
		return "admin/products/edit";
	}
	
	@RequestMapping (value="/admin/products/add", method = RequestMethod.POST)
	public String addProductSubmit(@ModelAttribute("product") Product product, BindingResult result, ModelMap model){
		System.out.println("add post -> addProductSubmit executed");
		ProductCategory productCategory = productCategoryService.getProductCategory(product.getProductCategory().getId());
		//System.out.println("add post -> productCategory.getName()" + productCategory.getName());
		product.setProductCategory(productCategory);		
		productService.addProduct(product);
		model.addAttribute("user", getPrincipal());
		return "admin/products/edit";
	}
	
	@RequestMapping (value="/admin/products/edit/{productId}", method = RequestMethod.GET)
	public String editProduct(@PathVariable int productId, ModelMap model){
		List<ProductCategory> productCategories = productCategoryService.getAllProductCategories();
		model.addAttribute("productCategories", productCategories);
		Product product = productService.getProduct(productId);
		model.addAttribute("product", product);
		model.addAttribute("user", getPrincipal());
		return "admin/products/edit";
	}
	
	@RequestMapping (value="/admin/products/edit/{productId}", method = RequestMethod.POST)
	public String editProductSubmit(@PathVariable int productId, ModelMap model){
		List<ProductCategory> productCategories = productCategoryService.getAllProductCategories();
		model.addAttribute("productCategories", productCategories);
		Product product = productService.getProduct(productId);
		model.addAttribute("product", product);
		model.addAttribute("user", getPrincipal());
		return "admin/products/edit";
	}
	
	@RequestMapping (value="/admin/products/confirm-delete/{productId}", method = RequestMethod.GET)
	public String confirmProductDelete(@PathVariable int productId, ModelMap model){
		Product product = productService.getProduct(productId);
		model.addAttribute("product", product);
		model.addAttribute("user", getPrincipal());
		return "admin/products/confirm-delete";
	}

	@RequestMapping (value="/admin/products/delete/{productId}", method = RequestMethod.POST)
	public String productDelete(@PathVariable int productId, ModelMap model){
		boolean productDeleted = productService.deleteProduct(productId);
		model.addAttribute("productDeleted", productDeleted);
		model.addAttribute("user", getPrincipal());
		return "admin/products/confirm-delete";
	}

}
