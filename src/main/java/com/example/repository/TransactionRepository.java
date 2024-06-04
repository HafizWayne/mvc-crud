package com.example.repository;

import com.example.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Repository
public class TransactionRepository {

    private DataSource dataSource;

    @Autowired
    public TransactionRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(Transaction transaction) {
        String sql = "INSERT INTO transactions (customer_id, customer_name, product_id, product_name, quantity, total_price, purchase_date) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, transaction.getCustomerId());
            statement.setString(2, transaction.getCustomerName());
            statement.setInt(3, transaction.getProductId());
            statement.setString(4, transaction.getProductName());
            statement.setInt(5, transaction.getQuantity());
            statement.setDouble(6, transaction.getTotalPrice());
            statement.setTimestamp(7, java.sql.Timestamp.valueOf(transaction.getPurchaseDate()));
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
