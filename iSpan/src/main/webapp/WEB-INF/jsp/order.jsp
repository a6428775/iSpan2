<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		getLSContent();
		
	});
	function getLSContent() {
        const lsContent = JSON.parse(localStorage.getItem("products"))
                || [];
        console.log(lsContent)
        return lsContent;
    };

    <!--   $(function displayProductDetail() {

    	const lsContent = getLSContent();
    	let productMarkup = "";
    	    if (lsContent !== null) {
    	        for (let product of lsContent) {
    	            productMarkup += 
    	             <tr>
    	                <td id="pid" data-id=\${product['id']} store-id=\${product.storeid}></td>
    	                  <td id="name">\${product['name']} </td>
    	                 <td id="productPrice">\${product['price']}</td>
    	                 <td id="productQty">\${product['quantity']}</td>
    	                  <td id="itemTotalPrice">\${product['price']*product['quantity']}</td>
    	              </tr>
    	            ;

    	            }
    	        } else {
    	            productMarkup = "Your cart is empty.";
    	        }
    	        document.getElementById("cartItem").innerHTML = productMarkup;
    	        console.log(productMarkup)
    	        });

-->
</script>


</head>
<body>
productMarkup
</body>
</html>