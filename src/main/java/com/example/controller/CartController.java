package com.example.controller;

import com.example.model.Cart;
import com.example.model.Product;
import com.example.model.Customer; // Import Customer model
import com.example.model.Receipt;
import com.example.repository.CartRepository;
import com.example.repository.CustomerRepository;
import com.example.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/customer/cart")
public class CartController {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping
    public String viewCart(HttpSession session, Model model) {
        // Get customer ID from session
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            // Handle case where customer is not logged in
            return "redirect:/login";
        }
        int customerId = customer.getId(); // Assuming getId() returns the customer ID

        List<Cart> cart = cartRepository.findByCustomerId(customerId); // Get cart by customer ID
        session.setAttribute("cart", cart);

        // Calculate total cost
        double totalCost = cart.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();

        model.addAttribute("cart", cart);
        model.addAttribute("totalCost", totalCost);
        return "/customer/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam("productId") int productId, @RequestParam("quantity") int quantity, HttpSession session, Model model) {
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart != null) {
            for (Cart cartItem : cart) {
                if (cartItem.getProductId() == productId) {
                    if (quantity <= 0) {
                        cart.remove(cartItem);
                        cartRepository.delete(cartItem.getCartId());
                    } else {
                        cartItem.setQuantity(quantity);
                        cartRepository.update(cartItem);
                    }
                    break;
                }
            }
            session.setAttribute("cart", cart);
        }
        return "redirect:/customer/cart";
    }

    @PostMapping("/delete")
    public String deleteFromCart(@RequestParam("productId") int productId, HttpSession session, Model model) {
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(cartItem -> cartItem.getProductId() == productId);
            // Get customer ID from session
            Customer customer = (Customer) session.getAttribute("customer");
            int customerId = customer.getId(); // Assuming getId() returns the customer ID
            cartRepository.deleteByProductIdAndCustomerId(productId, customerId);
            session.setAttribute("cart", cart);
        }
        return "redirect:/customer/cart";
    }

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


    @PostMapping("/buy")
    public String buyProduct(HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/customer/login";
        }

        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
            double totalCost = cart.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
            if (customer.getBalance() >= totalCost) {
                customer.setBalance(customer.getBalance() - totalCost);
                for (Cart cartItem : cart) {
                    Product product = productRepository.findById(cartItem.getProductId());
                    if (product != null && product.getQuantity() >= cartItem.getQuantity()) {
                        product.setQuantity(product.getQuantity() - cartItem.getQuantity());
                        productRepository.update(product);
                    }
                }
                cartRepository.deleteByCustomerId(customer.getId());
                session.removeAttribute("cart");
                customerRepository.update(customer);

                // Create receipt
                Receipt receipt = new Receipt(customer, cart, totalCost);
                model.addAttribute("receipt", receipt);
                model.addAttribute("success", "Purchase successful");
                return "customer/receipt"; // This should be the name of your receipt JSP page
            } else {
                model.addAttribute("error", "Insufficient balance");
                return "redirect:/customer/cart";
            }
        } else {
            model.addAttribute("error", "Cart is empty");
            return "redirect:/customer/cart";
        }
    }
}

