package com.universidad.mvc.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/idioma")
public class IdiomaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String lang = req.getParameter("lang");
        if ("es".equals(lang) || "en".equals(lang)) {
            req.getSession(true).setAttribute("lang", lang);
        }

        String referer = req.getHeader("Referer");
        if (referer == null || referer.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/productos");
            return;
        }
        resp.sendRedirect(referer);
    }
}
