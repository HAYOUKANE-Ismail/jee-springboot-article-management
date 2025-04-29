package ma.formations.jdbc.presentation.controller;

import java.io.IOException;
import java.util.List;
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
    private IService service = new ServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/search-form.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String description = request.getParameter("description");

        Double minPrice = null;
        if (request.getParameter("minPrice") != null && !request.getParameter("minPrice").isEmpty()) {
            minPrice = Double.parseDouble(request.getParameter("minPrice"));
        }

        Double maxPrice = null;
        if (request.getParameter("maxPrice") != null && !request.getParameter("maxPrice").isEmpty()) {
            maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
        }

        Double minQuantity = null;
        if (request.getParameter("minQuantity") != null && !request.getParameter("minQuantity").isEmpty()) {
            minQuantity = Double.parseDouble(request.getParameter("minQuantity"));
        }

        Double maxQuantity = null;
        if (request.getParameter("maxQuantity") != null && !request.getParameter("maxQuantity").isEmpty()) {
            maxQuantity = Double.parseDouble(request.getParameter("maxQuantity"));
        }

        List<Article> articles = service.searchArticles(description, minPrice, maxPrice, minQuantity, maxQuantity);
        request.setAttribute("articles", articles);
        request.getRequestDispatcher("/view/search-results.jsp").forward(request, response);
    }
}