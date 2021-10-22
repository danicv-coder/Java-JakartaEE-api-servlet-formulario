<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
    Map<String, String> errores = (Map<String,String>)request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuario</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h1>Formulario</h1>
<%
    if(errores != null && errores.size() > 0){
%>
<ul class="alert alert-danger mx-5">
<%
    for(String error : errores.values()){%>
    <li><%=error%></li>
    <%}%>
</ul>
<%}%>
<div class=" container">
<form action="/webapp-form/registro" method="post">
    <div class="row mb-3">
        <label for="username" class="col-form-label col-sm-2">Username</label>
        <div class="col-sm-4"><input type="text" name="username" id="username" class="form-control"></div>
        <%
        if(errores != null && errores.containsKey("username")){
            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("username") + "</small");
        }
        %>
    </div>
    <div class="row mb-3">
        <label for="password" class="col-form-label col-sm-2">Password</label>
        <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control"></div>
           <%
                if(errores != null && errores.containsKey("password")){
                    out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("password") + "</small");
                }
                %>
    </div>
    <div class="row mb-3">
        <label for="email" class="col-form-label col-sm-2">Email</label>
        <div class="col-sm-4"><input type="email" name="email" id="email" class="form-control"></div>
         <%
                        if(errores != null && errores.containsKey("email")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("email") + "</small");
                        }
                        %>
    </div>
    <div class="row mb-3">
        <label for="pais" class="col-form-label col-sm-2">Pais</label>
        <div class="col-sm-4">
            <select name="pais" id="pais" class="form-select">
                <option value="">-- Seleccionar --</option>
                <option value="argentina"> Argentina</option>
                <option value="bolivia">Bolivia</option>
                <option value="colombia">Colombia</option>
                <option value="venezuela">Venezuela</option>
            </select>
        </div>
         <%
                        if(errores != null && errores.containsKey("pais")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("pais") + "</small");
                        }
                        %>
    </div>
    <div class="row mb-3">
        <label for="lenguajes" class="col-form-label col-sm-2">Lenguaje de programacion</label>
        <div class="col-sm-4">
            <select name="lenguajes" id="lenguajes" multiple class="form-select">
                <option value="argentina"> JavaEE</option>
                <option value="bolivia">Javascript</option>
                <option value="colombia">Typescript</option>
                <option value="venezuela">Angular</option>
                <option value="argentina"> JavaEE</option>
                <option value="bolivia">Javascript</option>
                <option value="colombia">Typescript</option>
                <option value="venezuela">Spring Boot</option>
            </select>
        </div>
         <%
                        if(errores != null && errores.containsKey("lenguajes")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("lenguajes") + "</small");
                        }
                        %>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Roles</label>
        <div class="form-check">
            <input type="checkbox" name="roles" value="Role_admin" class="form-check-input">
            <label "form-check-label">Administrador</label>
        </div>
        <div class="form-check">
            <input type="checkbox" name="roles" value="Role_user" class="form-check-input">
            <label "form-check-label">Usuario</label>
        </div>
        <div class="form-check">
            <input type="checkbox" name="roles" value="Role_moderator" class="form-check-input">
            <label "form-check-label">Modelador</label>
        </div>
         <%
                        if(errores != null && errores.containsKey("roles")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("roles") + "</small");
                        }
                        %>
    </div>

    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Idiomas</label>
        <div class="form-check">
            <input type="radio" name="idioma" value="Español" class="form-check-input">
            <label "form-check-label">Español</label>
        </div>
        <div class="form-check">
            <input type="radio" name="idioma" value="ingles" class="form-check-input">
            <label "form-check-label">Ingles</label>
        </div>
        <div class="form-check">
            <input type="radio" name="idioma" value="frances" class="form-check-input">
            <label "form-check-label">Frances</label>
        </div>
        <div class="row mb-3">
            <input type="radio" name="idioma" value="italiano" class="form-check-input">
            <label "form-check-label">Italiano</label>
        </div>
        <div class="form-check">
            <input type="radio" name="idioma" value="aleman" class="form-check-input">
            <label class="form-check-label">Aleman</label>
        </div>
         <%
                        if(errores != null && errores.containsKey("idioma")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("idioma") + "</small");
                        }
                        %>
    </div>
    <div class="row mb-3">
        <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
        <div>
            <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
        </div>
    </div>
    <div class="">
        <button type="submit" value="Enviar" class="btn btn-primary">Enviar</button>
    </div>
    <input type="hidden" name="secreto" value="12345">
</form>
</div>
</body>
</html>