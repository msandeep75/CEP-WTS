<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Platform</title>
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
    <header>
        <h1>Blog Platform</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="writePost.jsp">Write a Post</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>

    <main>
     

     
<%
    // Retrieve the posts Map from the application scope
    Map<String, String> posts = (Map<String, String>) application.getAttribute("posts");

    if (posts != null && !posts.isEmpty()) {
%>
    <h1>Latest Posts</h1>
    <ul>
    <%
        // Iterate through the posts Map and display them
        for (Map.Entry<String, String> entry : posts.entrySet()) {
            String title = entry.getKey();
            String content = entry.getValue();
            content = content.replace("\n", "<br>");
    %>
        <li>
            <h2><%= title %></h2>
            <p><%= content.substring(0, Math.min(content.length(), 100)) %>...</p>
            <a href="viewPost.jsp?title=<%= title %>">Read More</a>
        </li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>No posts available.</p>
<%
    }
%>


    </main>

    <footer>
        <p>&copy; 2024 Blog Platform</p>
    </footer>
</body>
</html>