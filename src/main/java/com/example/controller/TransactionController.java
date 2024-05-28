package com.example.controller;

import com.example.model.Transaction;
import com.example.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/transactions")
public class TransactionController {

    @Autowired
    private TransactionRepository transactionRepository;

    @GetMapping
    public String listTransactions(Model model) {
        model.addAttribute("transactions", transactionRepository.findAll());
        return "admin/transactions";
    }

    @GetMapping("/new")
    public String newTransactionForm(Model model) {
        model.addAttribute("transaction", new Transaction());
        return "admin/new-transaction";
    }

    @PostMapping
    public String saveTransaction(@ModelAttribute Transaction transaction) {
        transactionRepository.save(transaction);
        return "redirect:/transactions";
    }

    @GetMapping("/edit/{id}")
    public String editTransactionForm(@PathVariable int id, Model model) {
        model.addAttribute("transaction", transactionRepository.findById(id));
        return "admin/edit-transaction";
    }

    @PostMapping("/update/{id}")
    public String updateTransaction(@PathVariable int id, @ModelAttribute Transaction transaction) {
        transactionRepository.update(id, transaction);
        return "redirect:/transactions";
    }

    @GetMapping("/delete/{id}")
    public String deleteTransaction(@PathVariable int id) {
        transactionRepository.delete(id);
        return "redirect:/transactions";
    }
}
