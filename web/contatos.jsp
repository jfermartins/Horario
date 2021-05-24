<%-- 
    Document   : contatos
    Created on : 24 de mai. de 2021, 14:54:40
    Author     : Fernanda
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatec.Database"%>
<%@page import="br.com.fatec.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html
    <%
    if(request.getParameter("user.add") != null){
        Contato newContato = new Contato(
                request.getParameter("contato.name"),
                request.getParameter("contato.email"),
                request.getParameter("contato.telefone")                
        
        );
        Database.addContato(newContato);
        response.sendRedirect(request.getRequestURI());
    } else if (request.getParameter("contato.remove") != null) {
        String email = request.getParameter("contato.email");
        Database.removeContato(email);
        response.sendRedirect(request.request.getRequestURI());
    }
    ArrayList<Contato> contatos = Database.getContatos();
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Usuários</h2>
        <% if(session.getAttribute("session.name") == null) { %>
            <p>É preciso estar autenticado para acessar o conteúdo da página.</p>
            <p></p>
            <p>Favor fazer Login!</p>
        <% } else { %>
        <form method="post">
            Nome: <input type="text" name="contato.name"/>
            Email: <input type="text" name="contato.email"/>
            Telefone: <input type="text" name="contato.telefone"/>
            <input type="submit" name="user.add" value="Adicionar"/>
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Exclusão</th>
            </tr>
            <% for(Contato contato: contatos){ %>
            <tr>
                <td><%= contato.getName()%></td>
                <td><%= contato.getEmail() %></td>
                <td><%= contato.getTelefone()%></td>
                <td>
                    <form>
                        <input type="hidden" name="contato.email" value="<%= contato.getEmail() %>"/>
                        <input type="submit" name="contato.remove" value="Remover"/>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
        <% } %>
       <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
