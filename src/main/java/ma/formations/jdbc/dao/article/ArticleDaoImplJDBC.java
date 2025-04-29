package ma.formations.jdbc.dao.article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import ma.formations.jdbc.dao.DatabaseManager;
import ma.formations.jdbc.service.model.Article;

public class ArticleDaoImplJDBC implements IArticleDao {

    @Override
    public List<Article> findAll() {
        List<Article> articles = new ArrayList<>();
        try {
            Connection connection = DatabaseManager.getInstance().getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM article");

            while (rs.next()) {
                articles.add(new Article(
                        rs.getLong("id"),
                        rs.getString("description"),
                        rs.getDouble("quantite"),
                        rs.getDouble("price")
                ));
            }

            rs.close();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return articles;
    }

    @Override
    public Article findById(Long id) {
        Article article = null;
        try {
            Connection connection = DatabaseManager.getInstance().getConnection();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM article WHERE id=?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                article = new Article(
                        rs.getLong("id"),
                        rs.getString("description"),
                        rs.getDouble("quantite"),
                        rs.getDouble("price")
                );
            }

            rs.close();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return article;
    }

    @Override
    public void save(Article article) {
        try {
            Connection connection = DatabaseManager.getInstance().getConnection();
            PreparedStatement stmt = connection.prepareStatement(
                    "INSERT INTO article (description, quantite, price) VALUES (?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );

            stmt.setString(1, article.getDescription());
            stmt.setDouble(2, article.getQuantite());
            stmt.setDouble(3, article.getPrice());

            stmt.executeUpdate();

            // Récupérer l'ID généré automatiquement
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                article.setId(generatedKeys.getLong(1));
            }

            generatedKeys.close();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    @Override
    public void update(Article article) {
        try {
            Connection connection = DatabaseManager.getInstance().getConnection();
            PreparedStatement stmt = connection.prepareStatement(
                    "UPDATE article SET description=?, quantite=?, price=? WHERE id=?"
            );

            stmt.setString(1, article.getDescription());
            stmt.setDouble(2, article.getQuantite());
            stmt.setDouble(3, article.getPrice());
            stmt.setLong(4, article.getId());

            stmt.executeUpdate();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    @Override
    public void delete(Long id) {
        try {
            Connection connection = DatabaseManager.getInstance().getConnection();
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM article WHERE id=?");
            stmt.setLong(1, id);
            stmt.executeUpdate();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    @Override
    public List<Article> search(String description, Double minPrice, Double maxPrice, Double minQuantity, Double maxQuantity) {
        List<Article> articles = new ArrayList<>();
        try {
            Connection connection = DatabaseManager.getInstance().getConnection();

            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM article WHERE 1=1");
            List<Object> parameters = new ArrayList<>();

            if (description != null && !description.isEmpty()) {
                queryBuilder.append(" AND description LIKE ?");
                parameters.add("%" + description + "%");
            }
            if (minPrice != null) {
                queryBuilder.append(" AND price >= ?");
                parameters.add(minPrice);
            }
            if (maxPrice != null) {
                queryBuilder.append(" AND price <= ?");
                parameters.add(maxPrice);
            }
            if (minQuantity != null) {
                queryBuilder.append(" AND quantite >= ?");
                parameters.add(minQuantity);
            }
            if (maxQuantity != null) {
                queryBuilder.append(" AND quantite <= ?");
                parameters.add(maxQuantity);
            }

            PreparedStatement stmt = connection.prepareStatement(queryBuilder.toString());

            for (int i = 0; i < parameters.size(); i++) {
                Object param = parameters.get(i);
                if (param instanceof String) {
                    stmt.setString(i + 1, (String) param);
                } else if (param instanceof Double) {
                    stmt.setDouble(i + 1, (Double) param);
                }
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                articles.add(new Article(
                        rs.getLong("id"),
                        rs.getString("description"),
                        rs.getDouble("quantite"),
                        rs.getDouble("price")
                ));
            }

            rs.close();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }

        return articles;
    }

    private void handleSQLException(SQLException e) {
        System.out.println("SQLException: " + e.getMessage());
        System.out.println("SQLState: " + e.getSQLState());
        System.out.println("VendorError: " + e.getErrorCode());
    }
}
