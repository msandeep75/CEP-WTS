<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page session="true" %>  <!-- Ensures that sessions are available -->
<%
    // Retrieve the posts Map from the application context
    Map<String, String> posts = (Map<String, String>) application.getAttribute("posts");

    // If posts map is null, initialize it
    if (posts == null) {
        posts = new java.util.HashMap<>();
    }

    // Retrieve the deleted posts from the session
    List<String> deletedPosts = (List<String>) session.getAttribute("deletedPosts");

    // Restore post logic: Restore the post if the 'restore' parameter is present
    String restoreTitle = request.getParameter("restore");
    if (restoreTitle != null && deletedPosts != null && deletedPosts.contains(restoreTitle)) {
        deletedPosts.remove(restoreTitle); // Remove from deleted list
        String content = (String) session.getAttribute("deletedPostContent_" + restoreTitle); // Retrieve content from session

        if (content != null) {
            posts.put(restoreTitle, content); // Restore the post
            application.setAttribute("posts", posts); // Update the posts map
            session.setAttribute("deletedPosts", deletedPosts); // Update the deleted posts list
        }
    }

    // Logout logic: Invalidate session if 'logout' parameter is present
    String logout = request.getParameter("logout");
    if (logout != null && logout.equals("true")) {
        session.invalidate();  // Invalidate the session to log out
        response.sendRedirect("login.jsp");  // Redirect to login page
        return;  // Ensure the rest of the code doesn't execute after logout
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Latest Posts</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Header Section -->
    <div class="header-container">
        <h1>Latest Posts
            <a href="?logout=true">
                <button class="logout-btn">Logout</button>
            </a>
        </h1>
    </div>

    <!-- Dustbin for Deleted Posts -->
    <div class="dustbin-container">
        <h2>Recently Deleted</h2>
        <%
            // Check if there are recently deleted posts to display
            if (deletedPosts != null && !deletedPosts.isEmpty()) {
                for (String deletedTitle : deletedPosts) {
        %>
                    <div class="dustbin-item">
                        <%= deletedTitle %>
                        <a href="?restore=<%= deletedTitle %>">Restore</a>
                    </div>
        <%
                }
            } else {
        %>
            <p>No posts in the dustbin.</p>
        <%
            }
        %>
    </div>

    <!-- Posts Section -->
    <div class="content-container">
        <%
            // Check if there are posts to display
            if (posts != null && !posts.isEmpty()) {
        %>
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
                        <p><%= (content != null && !content.isEmpty()) 
                                ? content.substring(0, Math.min(content.length(), 100)) + "..." 
                                : "No content available." %></p>
                        <a href="viewPost.jsp?title=<%= title %>">Read More</a> |
                        <a href="editPost.jsp?title=<%= title %>">Edit</a> |
                        <a href="deletePost.jsp?title=<%= title %>">Delete</a>
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
    </div>
</body>
