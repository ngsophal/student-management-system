<%@ include file="template/header.jsp" %>
<!-- Head -->
<%@ include file="template/head.jsp" %>
<!-- #Head -->
<section>
    <!-- Left Sidebar -->
    <%@ include file="template/left.jsp" %>
    <!-- #END# Left Sidebar -->
</section>

<section class="content">
    <%
        String req = "pages/welcome.jsp";
        if (request.getParameterMap().containsKey("p")) {
            req = "pages/" + request.getParameter("p");
        }
    %>
    <jsp:include page="<%= req %>" />

</section>
<%@ include file="template/footer.jsp" %>
