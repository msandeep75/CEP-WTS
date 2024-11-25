<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    String comment = request.getParameter("comment");

    if (comment != null && !comment.trim().isEmpty()) {
        List<String> comments = (List<String>) application.getAttribute("comments");
        if (comments == null) {
            comments = new ArrayList<>();
        }
        comments.add(comment);
        application.setAttribute("comments", comments);
    }
    response.sendRedirect("index.jsp");
%>

