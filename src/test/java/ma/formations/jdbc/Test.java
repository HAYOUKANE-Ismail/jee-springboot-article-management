package ma.formations.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import ma.formations.jdbc.dao.DatabaseManager;
import ma.formations.jdbc.service.model.Article;
import ma.formations.jdbc.service.model.User;

public class Test {
    public static void main(String[] args) {
        initTableUsers(Arrays.asList(
                new User(null, "user01", "user01"), // Set id to null, it will auto-generate
                new User(null, "user02", "user02"),
                new User(null, "user03", "user03"),
                new User(null, "user04", "user04")
        ));

        initTableArticles(Arrays.asList(
                new Article(null, "PC PORTABLE HP", 30D, 15000D), // Set id to null, it will auto-generate
                new Article(null, "PC PORTABLE DELL", 20D, 12000D),
                new Article(null, "TV LG", 100D, 7500D),
                new Article(null, "TV SONY", 10D, 8500D),
                new Article(null, "CAMERA SONY", 12D, 2500D),
                new Article(null, "DD 100G", 27D, 500D)
        ));
    }

    private static void initTableUsers(List<User> users) {
        String sql = "INSERT INTO `user` (username, password) VALUES (?, ?)";

        try (Connection connection = DatabaseManager.getInstance().getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            connection.setAutoCommit(false);

            for (User user : users) {
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                ps.addBatch();
            }

            ps.executeBatch();
            connection.commit();
            System.out.println("Liste des utilisateurs insérée avec succès.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void initTableArticles(List<Article> articles) {
        String sql = "INSERT INTO `article` (description, quantite, price) VALUES (?, ?, ?)";

        try (Connection connection = DatabaseManager.getInstance().getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            connection.setAutoCommit(false);

            for (Article article : articles) {
                ps.setString(1, article.getDescription());
                ps.setDouble(2, article.getQuantite());
                ps.setDouble(3, article.getPrice());
                ps.addBatch();
            }

            ps.executeBatch();
            connection.commit();
            System.out.println("Liste des articles insérée avec succès.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
