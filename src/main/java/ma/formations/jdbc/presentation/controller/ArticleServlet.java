package ma.formations.jdbc.presentation.controller;

import java.io.IOException;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ma.formations.jdbc.service.IService;
import ma.formations.jdbc.service.ServiceImpl;
import ma.formations.jdbc.service.model.Article;

@WebServlet("/articles.do")
public class ArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("myJpaUnit");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = emf.createEntityManager(); //
        try {
            ServiceImpl service = new ServiceImpl();
            service.setEntityManager(em); // Injecter le nouvel EntityManager

            List<Article> articles = service.getAllArticle();
            request.setAttribute("articles", articles);
            request.getRequestDispatcher("/view/welcome.jsp").forward(request, response);
        } finally {
            if (em.isOpen()) em.close(); // 🔒 Libérer l'EntityManager après usage
        }
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) emf.close();
    }
}