package com.ecommercef.controllers.admin;

import java.util.List;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.model.Inventory;
import com.ecommerce.model.Role;
import com.ecommerce.model.User;
import com.ecommerce.model.UserSupplier;
import com.ecommerce.service.InventoryService;
import com.ecommerce.service.RoleService;
import com.ecommerce.service.UserService;
import com.ecommerce.service.UserSupplierService;
import com.ecommercef.controllers.BaseController;

@Controller
public class SupplierController extends BaseController {
	
	@Autowired
	private User user;
	
	@Autowired
	private Role role;
	
	@Autowired
	private UserSupplier userSupplier;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserSupplierService userSupplierService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private InventoryService inventoryService;

	@RequestMapping (value="/admin/suppliers/list", method = RequestMethod.GET)

	public String getSupplierList(ModelMap model){
		List<UserSupplier> suppliers = userSupplierService.getAllSuppliers(); 
		model.addAttribute("suppliers", suppliers);
		model.addAttribute("loggedInUser", getPrincipal());
		return "admin/suppliers/list";
	}
	
	@RequestMapping(value = "/admin/suppliers/add", method = RequestMethod.GET)
	public String getAddUserSupplierForm(ModelMap model) {
		model.addAttribute("userSupplier", userSupplier);
		model.addAttribute("loggedInUser", getPrincipal());
		return "admin/suppliers/edit";
	}

	@RequestMapping(value = "/admin/suppliers/add", method = RequestMethod.POST)
	public String submitAddUserSupplierForm(@Valid @ModelAttribute("userSupplier") UserSupplier userSupplier) {
		user = userSupplier.getUser();
		Role role = roleService.getRole(2); // 2 role belongs to supplier
		user.setRole(role);
		System.out.println("submitAddUserSupplierForm : " + userSupplier.toString());
		//user.setFirst_name(userSupplier.user.first_name);
		userService.addUser(user);
		userSupplier.setUser(user);
		userSupplierService.addSupplier(userSupplier);
		System.out.println("Supplier added successfully!!!");
		return "redirect:/admin/suppliers/list";
	}
	
	@RequestMapping(value = "/admin/suppliers/edit/{userSupplierId}", method = RequestMethod.GET)
	public String getEditUserSupplierForm(@PathVariable int userSupplierId, ModelMap model) {
		UserSupplier userSupplier = userSupplierService.getSupplier(userSupplierId);
		model.addAttribute("userSupplier", userSupplier);
		model.addAttribute("loggedInUser", getPrincipal());
		return "admin/suppliers/edit";
	}

	@RequestMapping(value = "/admin/suppliers/edit/{userSupplierId}", method = RequestMethod.POST)
	public String submitEditUserSupplierForm(@PathVariable int userSupplierId, @Valid @ModelAttribute("userSupplier") UserSupplier userSupplierForm) {
		UserSupplier userSupplier = userSupplierService.getSupplier(userSupplierId);
		System.out.println("userSupplier fetched" + userSupplier.toString());
		userSupplierForm.setId(userSupplier.getId());
		userSupplierForm.getUser().setId(userSupplier.getUser().getId());
		userSupplierForm.getUser().setRole(userSupplier.getUser().getRole());
		userSupplierService.updateSupplier(userSupplierForm);
		System.out.println("Supplier added successfully!!!");
		return "redirect:/admin/suppliers/list";
	}
	
	@RequestMapping(value = "/admin/suppliers/{userSupplierId}/inventory/list", method = RequestMethod.GET)
	public String getEditUserSupplierInventoryList(@PathVariable int userSupplierId, ModelMap model) {
		UserSupplier userSupplier = userSupplierService.getSupplier(userSupplierId);
		List<Inventory> inventoryList = inventoryService.getAllInventoryBySupplier(userSupplierId);
		model.addAttribute("userSupplier", userSupplier);
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("loggedInUser", getPrincipal());
		return "admin/suppliers/inventory/list";
	}

	@RequestMapping(value = "/admin/suppliers/{userSupplierId}/inventory/add", method = RequestMethod.GET)
	public String getAddUserSupplierInventoryForm(@PathVariable int userSupplierId, ModelMap model) {
		UserSupplier userSupplier = userSupplierService.getSupplier(userSupplierId);
		model.addAttribute("userSupplier", userSupplier);
		model.addAttribute("loggedInUser", getPrincipal());
		return "admin/suppliers/inventory/edit";
	}

	@RequestMapping(value = "/admin/suppliers/{userSupplierId}/inventory/add", method = RequestMethod.POST)
	public String submitAddUserSupplierInventoryForm(@PathVariable int userSupplierId, @Valid @ModelAttribute("inventory") Inventory inventory) {
		UserSupplier userSupplier = userSupplierService.getSupplier(userSupplierId);
		user = userSupplier.getUser();
		Role role = roleService.getRole(2); // 2 role belongs to supplier
		user.setRole(role);
		System.out.println("submitAddUserSupplierForm : " + userSupplier.toString());
		//user.setFirst_name(userSupplier.user.first_name);
		userService.addUser(user);
		userSupplier.setUser(user);
		inventoryService.addProductInventory(inventory);
		System.out.println("Supplier inventory added successfully!!!");
		return "redirect:/admin/suppliers/" + userSupplierId +"/inventory/list";
	}
	
	@RequestMapping(value = "/admin/suppliers/{userSupplierId}/inventory/edit/{userSupplierInventoryId}", method = RequestMethod.GET)
	public String getEditUserSupplierInventoryForm(@PathVariable int userSupplierId, @PathVariable int userSupplierInventoryId, ModelMap model) {
		UserSupplier userSupplier = userSupplierService.getSupplier(userSupplierId);
		model.addAttribute("userSupplier", userSupplier);
		model.addAttribute("loggedInUser", getPrincipal());
		return "admin/suppliers/inventory/edit";
	}

	@RequestMapping(value = "/admin/suppliers/{userSupplierId}/inventory/edit/{userSupplierInventoryId}", method = RequestMethod.POST)
	public String submitEditUserSupplierInventoryForm(@PathVariable int userSupplierId, @PathVariable int userSupplierInventoryId, @Valid @ModelAttribute("userSupplier") UserSupplier userSupplierForm) {
		UserSupplier userSupplier = userSupplierService.getSupplier(userSupplierId);
		System.out.println("userSupplier fetched" + userSupplier.toString());
		userSupplierForm.setId(userSupplier.getId());
		userSupplierForm.getUser().setId(userSupplier.getUser().getId());
		userSupplierForm.getUser().setRole(userSupplier.getUser().getRole());
		userSupplierService.updateSupplier(userSupplierForm);
		System.out.println("Supplier added successfully!!!");
		return "redirect:/admin/suppliers/" + userSupplierId +"/inventory/list";
	}
}
