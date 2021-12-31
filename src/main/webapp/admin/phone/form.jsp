<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.exam.entity.Phone" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/admin/include/header.jsp">
        <jsp:param name="title" value="Phone form"/>
        <jsp:param name="description" value="Phone form"/>
        <jsp:param name="keywords" value="admin, page...."/>
    </jsp:include>
    <style>
        .msg-error {
            color: red;
        }
    </style>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/admin/include/left-menu.jsp"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Add new Phone</h1>
                </div>

                <div class="w3-padding w3-margin-bottom">
                    <form action="/admin/phone/create" method="post" class="w3-container w3-padding w3-card-4 w3-margin">

                        <div class="w3-margin">
                            <label>Name</label>
                            <input class="w3-input" type="text" name="name"  value="${phone.getName()}">
                            <c:if test="${errors != null && errors.containsKey('phone')}">
                                <span class="msg-error"><c:out value="${errors.get('name')}"/></span>
                            </c:if>
                        </div>

                        <div class="w3-margin">
                            <label>Price</label>
                            <input class="w3-input" type="number" name="price" required value="${phone.getPrice()}">
                        </div>
                        <div class="w3-margin">
                            <label>Description</label>
                            <input class="w3-input" type="text" name="description" required  value="${phone.getDescription()}">

                        </div>
                        <div class="w3-margin">
                            <label>Brand</label>
                            <select class="w3-input" name="brand">
                                <option>Apple</option>
                                <option>Samsung</option>
                                <option>Nokia</option>
                                <option>Others</option>
                            </select>
                        </div>
                        <button class="w3-btn w3-blue w3-margin" value="Save">Submit</button>
                        <button class="w3-btn w3-yellow w3-margin" value="Reset">Reset</button>
                    </form>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <jsp:include page="/admin/include/footer.jsp"/>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/admin/include/script.jsp"/>
</body>

</html>