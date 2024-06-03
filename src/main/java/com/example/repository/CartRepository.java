package com.example.repository;

import com.example.model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CartRepository {

    private DataSource dataSource;

    @Autowired
    public CartRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(Cart cart) {
        String sql = "INSERT INTO cart (customer_id, product_id, product_name, price, quantity) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, cart.getCustomerId());
            statement.setInt(2, cart.getProductId());
            statement.setString(3, cart.getProductName());
            statement.setDouble(4, cart.getPrice());
            statement.setInt(5, cart.getQuantity());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Cart cart) {
        String sql = "UPDATE cart SET quantity = ? WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, cart.getQuantity());
            statement.setInt(2, cart.getCartId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int cartId) {
        String sql = "DELETE FROM cart WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, cartId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteByProductIdAndCustomerId(int productId, int customerId) {
        String sql = "DELETE FROM cart WHERE product_id = ? AND customer_id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, productId);
            statement.setInt(2, customerId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteByCustomerId(int customerId) {
        String sql = "DELETE FROM cart WHERE customer_id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, customerId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cart> findByCustomerId(int customerId) {
        List<Cart> cart = new ArrayList<>();
        String sql = "SELECT * FROM cart WHERE customer_id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, customerId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cart cartItem = new Cart();
                cartItem.setCartId(rs.getInt("id"));
                cartItem.setCustomerId(rs.getInt("customer_id"));
                cartItem.setProductId(rs.getInt("product_id"));
                cartItem.setProductName(rs.getString("product_name"));
                cartItem.setPrice(rs.getDouble("price"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cart.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }
}
