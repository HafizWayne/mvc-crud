package com.example.service;

import com.example.model.Product;
import com.example.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
    @Service
    public class ProductServiceImpl implements ProductService {

        @Autowired
        private ProductRepository productRepository;

        @Override
        public List<Product> findAll() {
            return productRepository.findAll();
        }

        @Override
        public Product findById(int id) {
            return productRepository.findById(id);
        }

        @Override
        public void save(Product product) {
            productRepository.save(product);
        }

        @Override
        public void update(Product product) {
            productRepository.update(product);
        }

        @Override
        public void deleteById(int id) {
            productRepository.delete(id);
        }
    }
