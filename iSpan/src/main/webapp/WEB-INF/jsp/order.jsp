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
     


        $.each(lsContent, function(i,n){

    $('#123').append(n.name);
        }); 
        return lsContent;
    };

	
  
</script>


</head>
<body>
<a id ="123">  321</a>
</body>
</html>