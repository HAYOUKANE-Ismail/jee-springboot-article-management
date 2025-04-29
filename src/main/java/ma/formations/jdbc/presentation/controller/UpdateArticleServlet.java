package ma.formations.jdbc.presentation.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ma.formations.jdbc.service.IService;
import ma.formations.jdbc.service.ServiceImpl;
import ma.formations.jdbc.service.model.Article;

@WebServlet("/updateArticle.do")
public class UpdateArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IService service = new ServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Article article = service.getArticleById(id);
        request.setAttribute("article", article);
        request.getRequestDispatcher("/view/article-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            String description = request.getParameter("description");
            Double quantite = Double.parseDouble(request.getParameter("quantite"));
            Double price = Double.parseDouble(request.getParameter("price"));

            Article article = new Article(id, description, quantite, price);
            service.updateArticle(article);

            response.sendRedirect(request.getContextPath() + "/articles.do");
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Invalid input format or missing ID");
            request.getRequestDispatcher("/view/article-form.jsp").forward(request, response);
        }
    }
}
