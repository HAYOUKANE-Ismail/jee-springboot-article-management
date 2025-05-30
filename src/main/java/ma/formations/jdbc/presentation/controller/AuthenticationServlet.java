package ma.formations.jdbc.presentation.controller;

import java.io.IOException;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ma.formations.jdbc.service.IService;
import ma.formations.jdbc.service.ServiceImpl;

public class AuthenticationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IService service;
    private EntityManagerFactory emf;
    private EntityManager em;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("myJpaUnit");
        em = emf.createEntityManager();
        ServiceImpl s = new ServiceImpl();
        s.setEntityManager(em);   // injection de l'EntityManager
        this.service = s;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (!service.checkAccount(username, password)) {
            request.setAttribute("AccountIncorrect", "Login or password incorrect !");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("username", username);
            request.getRequestDispatcher("/view/main-template.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        if (em != null && em.isOpen()) em.close();
        if (emf != null && emf.isOpen()) emf.close();
    }
}
