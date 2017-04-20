<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
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
        String req = "pages/student"+".jsp";

        if (request.getParameterMap().containsKey("p")) {
            String p = "pages/" + request.getParameter("p") + ".jsp";
            String relativeWebPath = "/" + p;
            String absoluteDiskPath = request.getServletContext().getRealPath(relativeWebPath);
            File file = new File(absoluteDiskPath);

            if (file.exists()) {
                req = p;
            }else{
                req = "errors/404.jsp";
            }
        }

    %>
    <jsp:include page="<%= req %>" />

</section>
<%@ include file="template/footer.jsp" %>
