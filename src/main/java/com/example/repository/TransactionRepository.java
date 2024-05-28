package com.example.repository;

import com.example.model.Transaction;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Repository
public class TransactionRepository {
    private List<Transaction> transactions = new ArrayList<>();
    private AtomicInteger idCounter = new AtomicInteger();

    public List<Transaction> findAll() {
        return transactions;
    }

    public Transaction findById(int id) {
        return transactions.stream().filter(t -> t.getId() == id).findFirst().orElse(null);
    }

    public void save(Transaction transaction) {
        transaction.setId(idCounter.incrementAndGet());
        transactions.add(transaction);
    }

    public void update(int id, Transaction transaction) {
        delete(id);
        transaction.setId(id);
        transactions.add(transaction);
    }

    public void delete(int id) {
        transactions.removeIf(t -> t.getId() == id);
    }
}
