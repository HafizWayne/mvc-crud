package com.example.controller;

import com.example.model.Customer;
import com.example.repository.CustomerRepository;
import com.example.repository.ProductRepository;
import com.example.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/customer/home")
public class HomeController {

    private final ProductRepository productRepository;
    private final CustomerRepository customerRepository;

    @Autowired
    public HomeController(ProductRepository productRepository, CustomerRepository customerRepository) {
        this.productRepository = productRepository;
        this.customerRepository = customerRepository;
    }

    @GetMapping
    public String home(Model model, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            model.addAttribute("customer", customer);
        }
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "customer/home";
    }

    @GetMapping("/addbalance")
    public String showAddBalanceForm(Model model) {
        // Add any necessary data to the model
        return "customer/addbalance"; // Return the name of the JSP file containing the form
    }

    @PostMapping("/addbalance")
    public String addBalance(@RequestParam double balance, HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            customer.setBalance(customer.getBalance() + balance);
            customerRepository.update(customer); // Ensure this updates the customer in the repository
            session.setAttribute("customer", customer);
            model.addAttribute("customer", customer);
        }
        return "redirect:/customer/home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Invalidate session to perform logout
        session.invalidate();
        return "redirect:/"; // Redirect to home page or login page
    }


}
