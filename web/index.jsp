<%--
  Created by IntelliJ IDEA.
  User: Chee
  Date: 30/11/2018
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp" %>
<%@ include file="components/navBar/navBar.jsp" %>
<%@ include file="components/sideBar/sideBar.jsp" %>

<link rel="stylesheet" type="text/css" href="index.css"/>
<div id="main-body">
  <%
      double num = Math.random();
      if (num > 0.95) {
    %>
    <h2>You'll have a luck day!</h2><p>(<%= num %>)</p>
    <%
    } else {
    %>
    <h2>Well, life goes on ... </h2><p>(<%= num %>)</p>
    <%
      }
    %>
    <a href="<%= request.getRequestURI() %>"><h3>Try Another</h3></a>
</div>
<%@ include file="includes/footer.jsp" %>
