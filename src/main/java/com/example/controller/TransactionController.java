package com.example.controller;

import com.example.model.Transaction;
import com.example.model.Customer;
import com.example.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/customer/transactions")
public class TransactionController {

    @Autowired
    private TransactionRepository transactionRepository;

    @GetMapping
    public String viewCustomerTransactions(HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        }
        int customerId = customer.getId();
        List<Transaction> transactions = transactionRepository.findByCustomerId(customerId);
        model.addAttribute("transactions", transactions);
        return "customer/transactions";
    }


}
