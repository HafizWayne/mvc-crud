package com.example.controller;

import com.example.model.Product;
import com.example.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping
    public String showAdminPage(Model model) {
        // Menambahkan atribut model jika perlu
        model.addAttribute("adminData", new Object());
        return "admin"; // Pastikan ada file view 'admin.html'
    }

    @GetMapping("/products")
    public String listProducts(Model model) {
        model.addAttribute("products", productRepository.findAll());
        return "admin/products";
    }

    @GetMapping("/products/new")
    public String newProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "admin/new-product";
    }

    @PostMapping("/products")
    public String saveProduct(@ModelAttribute Product product) {
        productRepository.save(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/products/edit/{id}")
    public String editProductForm(@PathVariable int id, Model model) {
        model.addAttribute("product", productRepository.findById(id));
        return "admin/edit-product";
    }

    @PostMapping("/products/update/{id}")
    public String updateProduct(@PathVariable int id, @ModelAttribute Product product) {
        product.setId(id); // Set ID dari path variable ke objek Product
        productRepository.update(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable int id) {
        productRepository.delete(id);
        return "redirect:/admin/products";
    }
}
