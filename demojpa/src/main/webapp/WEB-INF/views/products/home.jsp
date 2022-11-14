
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head><%@ page isELIgnored="false" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRUD Spring MVC</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
 <div class="container">
  <div class="col-md-offset-1 col-md-10">
   <h2>Spring và MySql</h2>
   <hr />

   <input type="button" value="Thêm sản phẩm"
    onclick="window.location.href='new'; return false;"
    class="btn btn-primary" />
    <br/><br/>
   <div class="panel panel-info">
    <div class="panel-heading">
     <div class="panel-title">Danh sách sản phẩm</div>
    </div>
    <div class="panel-body">
    
     <table class="table table-striped table-bordered">
      <tr>
       <th>Name</th>
       <th>Description</th>
       <th>Price</th>
       <th>Create Date</th>
       <th>Category</th>
       <th>Tag</th>
         <th>Action</th>
      </tr>

      <!-- loop over and print our customers -->
      <c:forEach var="product" items="${products}">
       <tr>
        <td>${product.name}</td>
        <td>${product.description}</td>
        <td>${product.price}</td>
        <fmt:formatDate var="dateString" pattern="dd/MM/yyyy"
									value="${product.createDate}" />
         <td>
         ${dateString}
         
		</td>
        <td>${product.category.name}</td>
         <td>
         	<c:forEach var="tag" items="${product.tags}">
         	 	<p>${tag.tagName}</p>
         	  </c:forEach>
         </td>

        <td>
          <a href="<c:url value="/product/update/${product.id}"/>">Update</a>
         | <a href="<c:url value="/product/delete/${product.id}"/>"
         onclick="if (!(confirm('Bạn có chắc chắn muốn xóa ?'))) return false">Delete</a>
        </td>

       </tr>

      </c:forEach>

     </table>

    </div>
   </div>
  </div>

 </div>
</body>
</html>