<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Product List</title>
<link rel="stylesheet" href="/css/ordersystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    var indexPage = 1;

    $(document).ready(function(){
          loadPage(indexPage);
    });

    function loadPage(indexPage){
       $.ajax({
           type:'post',
           url:'/product/queryByPage/' + indexPage,
           dataType:'JSON',
           contentType:'application/json',
           success: function(data){
               console.log(data);
               
               $('#showproduct').empty("");
               
               if(data==null){
            	   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
               }else{
            	   var table = $('#showproduct'); 
            	   table.append("<tr id='ptitle'><th>ID</th><th>Product Name</th><th>Product Price</th>><th>Note</th></tr>");

            	   //data:jsonArray n:jsonObject
            	   $.each(data, function(i,n){
            		   var tr = "<tr align='center'>" + 
            		            "<td><a href='/users/order/purchaseOrderProduct.controller?pid=" + n.id + "'>" + n.id + "</a></td>" +
            		            "<td>" + n.pname + "</td>" + "<td>" + n.price + "</td>" +
            		            "<td>" + n.note + "</td>" +
            		            "</tr>";
            		   table.append(tr);
                   });           	   
               }
           }
       });
    }

    function change(page){
    	indexPage = page;
    	loadPage(indexPage);
    } 
</script>
</head>
<body>
<div id="productListTitle">PurchaseOrder System</div>
<table id="showproduct" border="1"></table>
<table id="showpage">
   <tr>
      <td>Total Pages:${totalPages} Total Records:${totalElements}</td>
      <td colspan="3" align="right">Previous
         <c:forEach var="i" begin="1" end="${totalPages}" step="1">
             <button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
         </c:forEach>Next
      </td>
      <tr>
   		<td align="right"><a href="/login/welcome">首頁</a></td>
   	  </tr>
   </tr>
</table>
</body>
</html>