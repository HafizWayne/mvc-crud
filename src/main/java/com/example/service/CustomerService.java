package com.example.service;

import com.example.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    Customer findById(int id);
    void save(Customer customer);
    void update(Customer customer);
    void deleteById(int id);
}
