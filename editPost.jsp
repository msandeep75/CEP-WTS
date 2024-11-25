<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%
    String title = request.getParameter("title");
    Map<String, String> posts = (Map<String, String>) application.getAttribute("posts");
    String content = (posts != null) ? posts.get(title) : null;

    if (title == null || content == null) {
        response.sendRedirect("uindex.jsp"); // Redirect if no post found
    }
%>

<h1>Edit Post: <%= title %></h1>
<form action="updatePost.jsp" method="post">
    <input type="hidden" name="title" value="<%= title %>"/>
    <label for="content">Content:</label><br>
    <textarea name="content" rows="10" cols="30"><%= content %></textarea><br>
    <input type="submit" value="Update Post"/>
</form>
<a href="uindex.jsp">Back to Home</a>
