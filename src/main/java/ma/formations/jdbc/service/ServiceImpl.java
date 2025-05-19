package ma.formations.jdbc.service;

import jakarta.persistence.EntityManager;
import ma.formations.jdbc.dao.IDao;
import ma.formations.jdbc.dao.UserDaoImplJPA;
import ma.formations.jdbc.dao.article.ArticleDaoImplJPA;
import ma.formations.jdbc.dao.article.IArticleDao;
import ma.formations.jdbc.service.model.Article;
import ma.formations.jdbc.service.model.User;
import ma.formations.jdbc.util.JpaUtil;

import java.util.List;

public class ServiceImpl implements IService {
    private IDao dao;
    private IArticleDao daoArticle;

    // constructeur sans argument
    public ServiceImpl() {
        EntityManager em = JpaUtil.getEntityManager(); // Cf. la classe ci-dessous
        this.dao = new UserDaoImplJPA(em);
        this.daoArticle = new ArticleDaoImplJPA(em);
    }

    // Setter pour injecter l'EntityManager après création de l'objet
    public void setEntityManager(EntityManager entityManager) {
        this.dao = new UserDaoImplJPA(entityManager);
        this.daoArticle = new ArticleDaoImplJPA(entityManager);
    }

    @Override
    public Boolean checkAccount(String username, String password) {
        User u = dao.getUserByUsername(username);
        if (u == null)
            return false;
        return (password.equals(u.getPassword()));
    }

    @Override
    public List<Article> getAllArticle() {
        return daoArticle.findAll();
    }

    @Override
    public Article getArticleById(Long id) {
        return daoArticle.findById(id);
    }

    @Override
    public void saveArticle(Article article) {
        daoArticle.save(article);
    }

    @Override
    public void updateArticle(Article article) {
        daoArticle.update(article);
    }

    @Override
    public void deleteArticle(Long id) {
        daoArticle.delete(id);
    }

    @Override
    public List<Article> searchArticles(String description, Double minPrice, Double maxPrice, Double minQuantity, Double maxQuantity) {
        return daoArticle.search(description, minPrice, maxPrice, minQuantity, maxQuantity);
    }
}
