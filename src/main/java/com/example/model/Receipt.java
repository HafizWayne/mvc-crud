package com.example.model;

import java.util.List;


    public class Receipt {
        private Customer customer;
        private List<Cart> cartItems;
        private double totalCost;

        public Receipt(Customer customer, List<Cart> cartItems, double totalCost) {
            this.customer = customer;
            this.cartItems = cartItems;
            this.totalCost = totalCost;
        }

        public Customer getCustomer() {
            return customer;
        }

        public void setCustomer(Customer customer) {
            this.customer = customer;
        }

        public List<Cart> getCartItems() {
            return cartItems;
        }

        public void setCartItems(List<Cart> cartItems) {
            this.cartItems = cartItems;
        }

        public double getTotalCost() {
            return totalCost;
        }

        public void setTotalCost(double totalCost) {
            this.totalCost = totalCost;
        }
// Getters and Setters
    }


