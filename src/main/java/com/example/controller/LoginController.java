package com.example.controller;

import com.example.model.Customer;
import com.example.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer/login")
public class LoginController {

    private final CustomerRepository customerRepository;

    @Autowired
    public LoginController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @PostMapping
    public String login(@RequestParam String email, @RequestParam String password,  Model model, HttpSession session) {
        Customer customer = customerRepository.findByEmailAndPassword(email, password);
        if (customer != null) {
            session.setAttribute("customer", customer);
            return "redirect:/customer/home";
        } else {
            model.addAttribute("error", "Email atau kata sandi salah!");
            return "customer/login";
        }
    }
}
