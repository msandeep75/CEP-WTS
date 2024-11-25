<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%
    String title = request.getParameter("title");
    String updatedContent = request.getParameter("content");
    Map<String, String> posts = (Map<String, String>) application.getAttribute("posts");

    if (posts != null && title != null && updatedContent != null) {
        posts.put(title, updatedContent); // Update the post content
        application.setAttribute("posts", posts); // Save the updated Map back
    }
    response.sendRedirect("uindex.jsp"); // Redirect to home page after updating
%>
