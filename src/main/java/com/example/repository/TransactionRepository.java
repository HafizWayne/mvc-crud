package com.example.repository;

import com.example.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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


    public List<Transaction> findByCustomerId(int customerId) {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE customer_id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, customerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Transaction transaction = new Transaction();
                    transaction.setId(resultSet.getInt("id"));
                    transaction.setCustomerId(resultSet.getInt("customer_id"));
                    transaction.setCustomerName(resultSet.getString("customer_name"));
                    transaction.setProductId(resultSet.getInt("product_id"));
                    transaction.setProductName(resultSet.getString("product_name"));
                    transaction.setQuantity(resultSet.getInt("quantity"));
                    transaction.setTotalPrice(resultSet.getDouble("total_price"));
                    transaction.setPurchaseDate(resultSet.getTimestamp("purchase_date").toLocalDateTime());
                    transactions.add(transaction);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

    public List<Transaction> findAll() {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM transactions";
        try (Connection conn = dataSource.getConnection();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(resultSet.getInt("id"));
                transaction.setCustomerId(resultSet.getInt("customer_id"));
                transaction.setCustomerName(resultSet.getString("customer_name"));
                transaction.setProductId(resultSet.getInt("product_id"));
                transaction.setProductName(resultSet.getString("product_name"));
                transaction.setQuantity(resultSet.getInt("quantity"));
                transaction.setTotalPrice(resultSet.getDouble("total_price"));
                transaction.setPurchaseDate(resultSet.getTimestamp("purchase_date").toLocalDateTime());
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
