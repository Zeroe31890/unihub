<%@include file="/andy/auth_headers.jsp" %>

<html>
<head>
    <%@include file="header.jsp" %>
</head>

<body>
    <% if (myCookie == null) { %>
    <div class="well well-large">
    <li>No School set yet.
    <% } else { %> 
       <li>Your current university is <%=sc%>
       <li>Your current location is <%=st%>.<br>
    <% } %>
    <div>
</body>
