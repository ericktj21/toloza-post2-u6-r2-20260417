package com.universidad.mvc.controller;

import com.universidad.mvc.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if ("logout".equals(accion)) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Usuario usuario = autenticar(username, password);
        if (usuario == null) {
            req.setAttribute("error", "Credenciales invalidas.");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(true);
        session.setAttribute("usuarioActual", usuario);
        session.setAttribute("lang", "es");
        session.setMaxInactiveInterval(1800);
        resp.sendRedirect(req.getContextPath() + "/productos");
    }

    private Usuario autenticar(String username, String password) {
        if ("admin".equals(username) && "Admin123!".equals(password)) {
            return new Usuario("admin", "admin@universidad.edu", "ADMIN");
        }
        if ("viewer".equals(username) && "View456!".equals(password)) {
            return new Usuario("viewer", "viewer@universidad.edu", "VIEWER");
        }
        return null;
    }
}
