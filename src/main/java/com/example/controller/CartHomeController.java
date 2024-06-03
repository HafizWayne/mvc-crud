package com.example.controller;

import com.example.model.Cart;
import com.example.model.Customer;
import com.example.model.Product;
import com.example.repository.CartRepository;
import com.example.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CartHomeController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CartRepository cartRepository;

    @PostMapping("/addtocart")
    public String addToCart(@RequestParam("productId") int productId, HttpSession session, Model model) {
        // Get product from repository
        Product product = productRepository.findById(productId);

        // Get customer ID from session
        Customer customer = (Customer) session.getAttribute("customer");
        int customerId = customer.getId(); // Assuming getId() returns the customer ID

        if (product != null) {
            // Get cart from session or create new cart
            List<Cart> cart = (List<Cart>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

            // Check if the product is already in the cart
            Cart existingCartItem = null;
            for (Cart item : cart) {
                if (item.getProductId() == productId) {
                    existingCartItem = item;
                    break;
                }
            }

            int totalQuantityInCart = existingCartItem != null ? existingCartItem.getQuantity() : 0;

            if (product.getQuantity() > totalQuantityInCart) {
                if (existingCartItem != null) {
                    // Update the quantity of the existing cart item
                    existingCartItem.setQuantity(existingCartItem.getQuantity() + 1);
                    // Update the cart item in the database
                    cartRepository.update(existingCartItem);
                } else {
                    // Add new item to cart
                    Cart cartItem = new Cart();
                    cartItem.setCustomerId(customerId); // Set customer ID from session
                    cartItem.setProductId(product.getId());
                    cartItem.setProductName(product.getName());
                    cartItem.setPrice(product.getPrice());
                    cartItem.setQuantity(1); // Assuming adding one quantity each time
                    cart.add(cartItem);

                    // Save new cart item to database
                    cartRepository.save(cartItem);
                }

                // Success message
                model.addAttribute("message", "Product added to cart successfully.");
            } else {
                // Error message if not enough stock
                model.addAttribute("error", "Product out of stock. Unable to add more to cart.");
            }
        } else {
            // Error message if product not found
            model.addAttribute("error", "Product not available.");
        }

        // Return to home page
        return "redirect:/customer/home";
    }

}

