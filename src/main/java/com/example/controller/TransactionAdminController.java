package com.example.controller;

import com.example.model.Transaction;
import com.example.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/transactions")
public class TransactionAdminController {

    @Autowired
    private TransactionRepository transactionRepository;

    @GetMapping
    public String viewAllTransactions(Model model) {
        List<Transaction> transactions = transactionRepository.findAll();
        model.addAttribute("transactions", transactions);
        return "admin/transactions";
    }
}
