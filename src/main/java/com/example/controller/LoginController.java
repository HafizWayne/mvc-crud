package com.example.controller;

import com.example.model.Customer;
import com.example.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/customer/login")
public class LoginController {

    private final CustomerRepository customerRepository;

    @Autowired
    public LoginController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @PostMapping
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        Customer customer = customerRepository.findByEmailAndPassword(email, password);
        if (customer != null) {
            // Login berhasil, arahkan ke halaman utama atau halaman lain yang sesuai
            // Misalnya:
            // return "redirect:/home";
            model.addAttribute("message", "Login berhasil!");
            return "redirect:/admin/customers";
        } else {
            // Login gagal, arahkan kembali ke halaman login dengan pesan kesalahan
            model.addAttribute("error", "Email atau kata sandi salah!");
            // Kembalikan halaman login dengan pesan kesalahan
            return "customer/login";
        }
    }
}
