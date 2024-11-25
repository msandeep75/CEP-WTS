<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%
    String title = request.getParameter("title");
    Map<String, String> posts = (Map<String, String>) application.getAttribute("posts");
    List<String> deletedPosts = (List<String>) session.getAttribute("deletedPosts");

    if (posts != null && title != null) {
        // Remove the post from the Map
        String content = posts.remove(title);
        application.setAttribute("posts", posts);

        // Save the deleted post content in session for restoration
        if (deletedPosts == null) {
            deletedPosts = new java.util.ArrayList<>();
        }
        deletedPosts.add(title);  // Store the title of the deleted post
        session.setAttribute("deletedPosts", deletedPosts);

        // Save content of the deleted post for restoration
        session.setAttribute("deletedPostContent_" + title, content);
    }
    response.sendRedirect("uindex.jsp"); // Redirect to home page after deleting
%>
