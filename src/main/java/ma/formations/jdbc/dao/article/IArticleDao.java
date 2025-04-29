package ma.formations.jdbc.dao.article;

import java.util.List;
import ma.formations.jdbc.service.model.Article;

public interface IArticleDao {
    List<Article> findAll();
    Article findById(Long id);
    void save(Article article);
    void update(Article article);
    void delete(Long id);
    List<Article> search(String description, Double minPrice, Double maxPrice, Double minQuantity, Double maxQuantity);
}