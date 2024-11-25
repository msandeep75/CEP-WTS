<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%
    String title = request.getParameter("title");
    Map<String, String> posts = (Map<String, String>) application.getAttribute("posts");
    String content = (posts != null) ? posts.get(title) : null;
%>

<%
    if (content != null) {
%>
    <h1><%= title %></h1>
    <p><%= content %></p>
    <a href="uindex.jsp">Back to Home</a>
<%
    } else {
%>
    <p>Post not found.</p>
    <a href="uindex.jsp">Back to Home</a>
<%
    }
%>