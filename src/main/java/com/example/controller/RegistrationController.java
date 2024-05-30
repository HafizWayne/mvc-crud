package com.example.controller;

import com.example.model.Customer;
import com.example.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping
    public String showRegistrationForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "register";
    }

    @PostMapping
    public String registerCustomer(@ModelAttribute("customer") Customer customer, Model model) {
        String errorMessage = validateCustomer(customer);
        if (errorMessage != null) {
            model.addAttribute("errorMessage", errorMessage);
            return "register";
        }
        customerRepository.save(customer);
        model.addAttribute("message", "Customer registered successfully!");
        return "success";
    }

    private String validateCustomer(Customer customer) {
        if (customer.getName() == null || customer.getName().isEmpty()) {
            return "Please provide your name";
        }
        if (customer.getEmail() == null || customer.getEmail().isEmpty() || !customer.getEmail().contains("@")) {
            return "Please provide a valid email";
        }
        if (customer.getBalance() < 0) {
            return "Balance must be positive";
        }
        return null;
    }
}
