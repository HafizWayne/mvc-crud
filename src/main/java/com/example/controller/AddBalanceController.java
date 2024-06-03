package com.example.controller;

import com.example.model.Customer;
import com.example.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer/addbalance")
public class AddBalanceController {

    private final CustomerRepository customerRepository;

    @Autowired
    public AddBalanceController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    // Handler for displaying the add balance form
    @GetMapping
    public String showAddBalanceForm(Model model, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            // Handle the case when no customer is logged in
            return "redirect:/login"; // Redirect to the login page
        }
        model.addAttribute("customer", customer);
        return "/customer/addbalance"; // Return the name of the JSP file containing the form
    }

    // Handler for processing the form submission
    @PostMapping
    public String processAddBalanceForm(@RequestParam double balance, HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            // Handle the case when no customer is logged in
            return "redirect:/login"; // Redirect to the login page
        }
        // Update the customer's balance
        customer.setBalance(customer.getBalance() + balance);
        customerRepository.update(customer); // Pastikan metode update memperbarui data pelanggan di repository
        session.setAttribute("customer", customer);
        model.addAttribute("customer", customer);
        return "redirect:/customer/home"; // Redirect to the home page after processing the form
    }
}
