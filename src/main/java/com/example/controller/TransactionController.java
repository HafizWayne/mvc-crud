package com.example.controller;

import com.example.model.Transaction;
import com.example.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/admin")
public class TransactionController {

    @Autowired
    private TransactionRepository transactionRepository;

    @GetMapping
    public String showAdminPage(Model model) {
        // Menambahkan atribut model jika perlu
        model.addAttribute("adminData", new Object());
        return "admin"; // Pastikan ada file view 'admin.html'
    }

    @GetMapping("/transactions")
    public String listTransactions(Model model) {
        model.addAttribute("transactions", transactionRepository.findAll());
        return "admin/transactions";
    }

    @GetMapping("/transactions/new")
    public String newTransactionForm(Model model) {
        model.addAttribute("transaction", new Transaction());
        return "admin/new-transaction";
    }

    @PostMapping("/transactions")
    public String saveTransaction(@ModelAttribute Transaction transaction) {
        transactionRepository.save(transaction);
        return "redirect:/admin/transactions";
    }

    @GetMapping("/transactions/edit/{id}")
    public String editTransactionForm(@PathVariable int id, Model model) {
        model.addAttribute("transaction", transactionRepository.findById(id));
        return "admin/edit-transaction";
    }

    @PostMapping("/transactions/update/{id}")
    public String updateTransaction(@PathVariable int id, @ModelAttribute Transaction transaction) {
        transactionRepository.update(id, transaction);
        return "redirect:/admin/transactions";
    }

    @GetMapping("/transactions/delete/{id}")
    public String deleteTransaction(@PathVariable int id) {
        transactionRepository.delete(id);
        return "redirect:/admin/transactions";
    }
}

