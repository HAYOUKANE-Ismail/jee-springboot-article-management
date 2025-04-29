package ma.formations.jdbc.service;

import java.util.List;
import ma.formations.jdbc.service.model.Article;

public interface IService {
    Boolean checkAccount(String username, String password);
    List<Article> getAllArticle();
    Article getArticleById(Long id);
    void saveArticle(Article article);
    void updateArticle(Article article);
    void deleteArticle(Long id);
    List<Article> searchArticles(String description, Double minPrice, Double maxPrice, Double minQuantity, Double maxQuantity);
}