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
@RequestMapping("/customer/register")
public class RegistrationController {

    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping
    public String showRegistrationForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "/customer/register";
    }

    @PostMapping
    public String registerCustomer(@ModelAttribute Customer customer, Model model) {
        String errorMessage = validateCustomer(customer);
        if (errorMessage != null) {
            model.addAttribute("errorMessage", errorMessage);
            return "/customer/register";
        }

        try {
            customerRepository.registerCustomer(customer);
            model.addAttribute("successMessage", "Registration successful!");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "An error occurred while registering the customer.");
        }
        return "/customer/register";
    }

    private String validateCustomer(Customer customer) {
        if (customer.getName() == null || customer.getName().isEmpty()) {
            return "Please provide your name";
        }
        if (customer.getEmail() == null || customer.getEmail().isEmpty() || !customer.getEmail().contains("@")) {
            return "Please provide a valid email";
        }
        if (customer.getPassword() == null || customer.getPassword().length() < 8 || customer.getPassword().length() > 12) {
            return "Password must be between 8 and 12 characters";
        }
        return null;
    }
}
