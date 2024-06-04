package com.example.repository;

import com.example.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductRepository {

    private DataSource dataSource;

    @Autowired
    public ProductRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = dataSource.getConnection();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getFloat("price"));
                product.setQuantity(resultSet.getInt("quantity"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product findById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Product product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setPrice(resultSet.getFloat("price"));
                    product.setQuantity(resultSet.getInt("quantity"));
                    return product;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void save(Product product) {
        String sql = "INSERT INTO products (name, price, quantity) VALUES (?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.executeUpdate();

            // Ambil ID yang di-generate
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Gagal mengambil ID yang di-generate.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Product product) {
        String sql = "UPDATE products SET name = ?, price = ?, quantity = ? WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setInt(4, product.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> findByNameContaining(String name) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, "%" + name + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setPrice(resultSet.getFloat("price"));
                    product.setQuantity(resultSet.getInt("quantity"));
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
