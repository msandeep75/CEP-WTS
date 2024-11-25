<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map, java.util.HashMap" %>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    if (title != null && !title.trim().isEmpty() && content != null && !content.trim().isEmpty()) {
        // Retrieve the posts Map from the application scope
        Map<String, String> posts = (Map<String, String>) application.getAttribute("posts");
        if (posts == null) {
            posts = new HashMap<>(); // Initialize if null
        }
        posts.put(title, content); // Add the title and content
        application.setAttribute("posts", posts); // Save the updated Map back to the application scope
    }
    response.sendRedirect("index.jsp"); // Redirect to the logged-in home page
%>

