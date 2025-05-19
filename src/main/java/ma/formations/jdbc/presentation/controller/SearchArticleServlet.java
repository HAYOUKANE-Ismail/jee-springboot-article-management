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

@WebServlet("/searchArticles.do")
public class SearchArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("myJpaUnit");
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) emf.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/search-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = emf.createEntityManager(); // 🔥 Nouveau EM à chaque requête
        try {
            ServiceImpl service = new ServiceImpl();
            service.setEntityManager(em); // injection du EM à chaud

            String description = request.getParameter("description");

            Double minPrice = parseDouble(request.getParameter("minPrice"));
            Double maxPrice = parseDouble(request.getParameter("maxPrice"));
            Double minQuantity = parseDouble(request.getParameter("minQuantity"));
            Double maxQuantity = parseDouble(request.getParameter("maxQuantity"));

            List<Article> articles = service.searchArticles(description, minPrice, maxPrice, minQuantity, maxQuantity);

            request.setAttribute("articles", articles);
            request.getRequestDispatcher("/view/search-results.jsp").forward(request, response);

        } finally {
            if (em.isOpen()) em.close(); // 💡 Toujours fermer après usage
        }
    }

    private Double parseDouble(String param) {
        return (param != null && !param.isEmpty()) ? Double.parseDouble(param) : null;
    }
}
