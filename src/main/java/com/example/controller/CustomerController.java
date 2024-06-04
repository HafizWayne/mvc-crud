package com.example.controller;

import com.example.model.Customer;
import com.example.model.Product;
import com.example.repository.CustomerRepository;
import com.example.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/customers")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping
    public String listCustomers(Model model) {
        model.addAttribute("customers", customerRepository.findAll());
        return "admin/customers";
    }

    @GetMapping("/{id}")
    public String viewCustomer(@PathVariable("id") int id, Model model) {
        Customer customer = customerRepository.findById(id);
        if (customer == null) {
            return "redirect:/admin/customers";
        }
        model.addAttribute("customer", customer);
        model.addAttribute("products", productRepository.findAll());
        return "admin/customer";
    }

    @GetMapping("/edit/{id}")
    public String editCustomer(@PathVariable("id") int id, Model model) {
        Customer customer = customerRepository.findById(id);
        if (customer == null) {
            return "redirect:/admin/customers";
        }
        model.addAttribute("customer", customer);
        return "admin/edit_customer";
    }

    @PostMapping("/update/{id}")
    public String updateCustomer(@PathVariable int id, @ModelAttribute Customer customer) {
        customer.setId(id); // Set ID dari path variable ke objek Customer
        customerRepository.update(customer);
        return "redirect:/admin/customers";
    }

    @GetMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable("id") int id) {
        customerRepository.delete(id);
        return "redirect:/admin/customers";
    }

    @PostMapping("/buy")
    public String buyProduct(@RequestParam("customerId") int customerId,
                             @RequestParam("productId") int productId,
                             @RequestParam("quantity") int quantity,
                             Model model) {
        Customer customer = customerRepository.findById(customerId);
        Product product = productRepository.findById(productId);

        if (customer == null || product == null || quantity <= 0) {
            return "redirect:/admin/customers";
        }

        double totalCost = product.getPrice() * quantity;

        if (customer.getBalance() >= totalCost && product.getQuantity() >= quantity) {
            customer.setBalance(customer.getBalance() - totalCost);
            product.setQuantity(product.getQuantity() - quantity);
            customerRepository.update(customer);
            productRepository.update(product);
        }

        return "redirect:/admin/customers/" + customerId;
    }
}
