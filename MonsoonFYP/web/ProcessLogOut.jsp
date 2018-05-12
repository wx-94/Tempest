<%-- 
    Document   : ProcessLogOut
    Created on : 12 May, 2018, 12:08:23 AM
    Author     : jacky
--%>
<%
    session.invalidate();
    response.sendRedirect("Login.jsp");
%>