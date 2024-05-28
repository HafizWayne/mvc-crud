package com.example.service;

import com.example.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findById(int id);
    void save(Product product);
    void update(Product product);
    void deleteById(int id);
}