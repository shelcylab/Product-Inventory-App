<%-- 
    Document   : user-form
    Created on : 13 Dec, 2020, 10:52:42 AM
    Author     : shelc
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

    <head>
        <title>Product Inventory Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>

        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blanchedalmond">
                <div>
                    <a href="https://www.javaguides.net" class="navbar-brand"> Product Management </a>
                </div>

                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Products</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${product != null}">
                        <form action="update" method="post">
                        </c:if>
                        <c:if test="${product == null}">
                            <form action="insert" method="post">
                            </c:if>

                            <caption>
                                <h2>
                                    <c:if test="${product != null}">
                                        Edit Product details
                                    </c:if>
                                    <c:if test="${product == null}">
                                        Add New Product
                                    </c:if>
                                </h2>
                            </caption>

                            <c:if test="${product != null}">
                                <input type="hidden" name="id" value="<c:out value='${product.id}' />" />
                            </c:if>
                            <fieldset class="form-group">
                                <label>Product Name</label> <input type="text" value="<c:out value='${product.name}' />" class="form-control" name="name" required="required">
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Location</label> <input type="text" value="<c:out value='${product.location}' />" class="form-control" name="location">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Quantity</label> <input type="text" value="<c:out value='${product.quantity}' />" class="form-control" name="quantity">
                            </fieldset>

                            <button type="submit" class="btn btn-success">Save</button>
                        </form>
                </div>
            </div>
        </div>
    </body>

</html>
