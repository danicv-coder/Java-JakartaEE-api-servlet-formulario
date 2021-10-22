package org.danicv.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.Email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/registro") // MAPIN
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String pais = req.getParameter("pais");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");
        String[] idiomas = req.getParameterValues("idioma");
        String habilitar = req.getParameter("habilitar");
        String secreto = req.getParameter("secreto");
        Map<String, String> errores = new HashMap<>();
        if (username == null || username.isBlank()) {
            errores.put("username", "El username es requerido!");
        }
        if (password == null || password.isBlank()) {
            errores.put("password", "El password es requerido!");
        }
        if (email == null || !email.contains("@") || email.isBlank()) {
            errores.put("email", "El email es requerido y debe tener un formato de correo!");
        }
        if (pais == null || pais.equals("") || pais.equals(" ")) {
            errores.put("pais", "El pais es requerido!");
        }
        if (lenguajes == null || lenguajes.length == 0) {
            errores.put("lenguajes", "Debe seleccionar al menos un tema");
        }
        if (roles == null || roles.length == 0) {
            errores.put("roles", "Debe seleccionar al menos un tema");
        }
        if (idiomas == null) {
            errores.put("idiomas", "El idioma es requerido!");
        }
        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {

                out.println("<!Doctype html>");
                out.println("<html>");
                out.println("    <head>");
                out.println("        <meta charset=\"UTF-8\">");
                out.println("        <title>Resultado formulario</title>");
                out.println("    </head>");
                out.println("    <body>");
                out.println("        <h1>Resultado formulario</h1>");
                out.println("        <ul>");
                out.println("<li> Error: + </li>");

                out.println("        <li>Username: " + username + "</li>");
                out.println("        <li>Password: " + password + "</li>");
                out.println("        <li>Email: " + email + "</li>");
                out.println("        <li>Pais: " + pais + "</li>");
                out.println("        <li>Lenguajes: <ul>");
                for (String lenguaje : lenguajes) {
                    out.println("    <li>" + lenguaje + "</li>");
                }
                out.println("        </li></ul>");
                out.println("        <li>Roles: <ul>");
                for (String role : roles) {
                    out.println("    <li>" + role + "</li>");
                }
                out.println("        </li></ul>");
                out.println("        <li>Idiomas: <ul>");
                for (String idioma : idiomas) {
                    out.println("    <li>" + idioma + "</li>");
                }
                out.println("        </li></ul>");
                out.println("<li>Habilitado " + habilitar + "</li>");
                out.println("<li>Secreto: " + secreto + "</li>");

                out.println("        </ul>");
                out.println("    </body>");
                out.println("</html>");
            }
        } else {
              /*  errores.forEach(error ->{
                    out.println("<li>" + error + "</li>");
                });
                out.println("<p><a href=\"/webapp-form/index.jsp\">Volver</a></p>");*/
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
