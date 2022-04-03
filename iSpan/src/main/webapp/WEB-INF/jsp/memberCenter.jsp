<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>會員中心</title>
<!-- STYLE CSS -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail"
	rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="/css/reset.css">
<style type="text/css">
.list-group {
	padding: 25px 0;
}

.list-group-item{
	background-color:#eb482d;
}

</style>

<style>
.main-box {
	margin: 0 0 30px 100px;
	width: 800px;
	height: 700px;
	padding: 100px;
	box-shadow: 5px 5px 10px #999;
	border: 1px solid #fff;
	text-align: center;
	font-size: 1.3em;
}
</style>

<style type="text/css">
.toTop-arrow {
	width: 2.5rem;
	height: 2.5rem;
	border-radius: 33%;
	opacity: 0.6;
	background: #000;
	cursor: pointer;
	position:fixed;
	right: 1rem;
	bottom: 1rem;
	display: none;
}
.toTop-arrow::before, .toTop-arrow::after {
	width: 18px;
	height: 5px;
	border-radius: 3px;
	background: #f90;
	position: absolute;
	content: "";
}
.toTop-arrow::before {
	transform: rotate(-45deg) translate(0, -50%);
	left: 0.5rem;
}
.toTop-arrow::after {
	transform: rotate(45deg) translate(0, -50%);
	right: 0.5rem;
}
.toTop-arrow:focus {outline: none;}
</style>
<script type="text/javascript">
$(document).ready(function(){

	load();

});



function load(){
	 $.ajax({
     type:'post',
     //透過id 查詢產品
     url:'/userInformation.controller',
     dataType:'JSON',
     contentType:'application/json',
     success: function(data){
         
         var json = JSON.stringify(data, null, 4);
         console.log('success:' + json);
         var jsonArray = JSON.parse(json);
          
         if(json==null){
//             $('table').prepend('<tr><td colspan="2">No Result</td></tr>');
         }else{
             
        	 $('#nickname').attr({"value":jsonArray.nickname});
        	 $('#phone').attr({"value":jsonArray.phone});
        	 $('#address').attr({"value":jsonArray.address});
        	 $('#birthday').attr({"value":jsonArray.birthday});


         }
     }
	   });
}
</script>
<title>會員中心</title>
</head>

<body>

	<div id="page" class="hfeed site">
		<!-- start page wrapper -->

		<header id="masthead" class="site-header navbar-fixed-top">
			<div class="header-navigation">
				<div class="container-fluid">

					<div class="row">

						<div class="col col-md-2">
							<div class="site-branding navbar-brand">
								<!-- 左上logo圖片 //////////////////////////////////////////////////////////////////////////-->
								<a href="#"><img src="/images/logo-2.png"
									alt="Food Recipe Web Template" title="Taplak"></a>
							</div>
							<!-- end logo -->
						</div>
						<!-- end col-md-3 -->

						<div class="col-12 col-md-8">
							<nav class="site-navigation navbar navbar-expand-lg navbar-light">

								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#navbarSupportedContent"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>

								<div class="collapse navbar-collapse"
									id="navbarSupportedContent">
									<!-- header 標題列 //////////////////////////////////////////////////////////////////////////-->
									<ul class="navbar-nav">
										<li class="nav-item active"><a class="nav-link"
											href="/home.controller">Home <span class="sr-only">(current)</span></a>
										</li>
										<!-- <li class="nav-item"><a class="nav-link"
											href="about.html">關於我們</a></li> -->
										<li class="nav-item"><a class="nav-link"
											href="typography.html">最新消息</a></li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown1" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">餐點資訊</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
												<a class="dropdown-item" href="recipes.html">Recipe List</a>
												<a class="dropdown-item" href="recipe-single.html">Recipe
													Single</a> <a class="dropdown-item" href="recipe-index.html">Recipe
													Index</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="submit-recipe.html">Submit
													Recipe</a>
											</div></li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown1" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">店家資訊</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
												<a class="dropdown-item" href="recipes.html">Recipe List</a>
												<a class="dropdown-item" href="recipe-single.html">Recipe
													Single</a> <a class="dropdown-item" href="recipe-index.html">Recipe
													Index</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="submit-recipe.html">Submit
													Recipe</a>
											</div></li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown4" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">服務資源</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
												<a class="dropdown-item" href="contact.html">聯絡我們</a> <a
													class="dropdown-item" href="faq.html">FAQ</a>
											</div></li>

										<!-- <li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown4" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">會員中心</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
												<a class="dropdown-item" href="/login/page">登入</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#">註冊</a>
											</div></li> -->
										<li class="nav-item"><a class="nav-link"
											href="typography.html">購物車</a></li>

										<li class="nav-item"><label class="nav-link">登入帳號：${Useremailaddress}</label>
										</li>
										<li class="nav-item"><a class="nav-link" href="/logout">登出</a>
										</li>
									</ul>
								</div>
								<!-- end navbar-collapse -->
							</nav>
							<!-- end site-navigation -->
						</div>
						<!-- end col-md-8 -->

						<!-- 刪除社群icon、搜尋icon-->

					</div>
					<!-- end row -->

				</div>
				<!-- end container-fluid -->
			</div>
			<!-- end header-navigation -->
		</header>
		<!-- end #masthead -->
	</div>
	<!-- end #page hfeed site -->
	<!-- ====================================================自由發揮區==================================================== -->
	<div class="container">
		<div class="row">

			<div class="row-cols-1 col-12 col-md-3">
				<div class="list-group">
					<a href="/users/orders/ormainaction.controller" class="list-group-item list-group-item-action">購物車</a> 
					<a href="#" class="list-group-item list-group-item-action" aria-current="true">聯絡我們</a> 
					<a href="#" class="list-group-item list-group-item-action">常見問題</a>
					<!-- <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
					<!-- <a class="list-group-item list-group-item-action disabled">A disabled link item</a> -->
				</div>

				<div class="list-group">
					<a href="#p1" class="list-group-item list-group-item-action">基本資料</a>
					<a href="#p2" class="list-group-item list-group-item-action"
						aria-current="true">帳號管理</a> <a href="#p3"
						class="list-group-item list-group-item-action">歷史訂單</a>
					<!-- <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
					<!-- <a class="list-group-item list-group-item-action disabled">A disabled link item</a> -->
				</div>
				<div class="list-group">
					<a href="/admin/membercenter.controller" class="list-group-item list-group-item-action">後臺管理(權限)</a>
				</div>
				
				
				
			</div>

			<div class="g-4 col-12 col-md-8">

				<!-- tabs分頁 -->
				<div id="tabs">

					<div id="p1">
						<div class="main-box">
							<h3 class="title">基本資料</h3>
							<form id="form-userinfo" >

								<div class="mb-5">
									<label path="nickname" class="form-label">暱稱</label>
									<input path="nickname" type="text" class="form-control"
										id="nickname" aria-describedby="nameHelp" value="" />
									<div id="nameHelp" class="form-text"></div>
								</div>
								<div class="mb-5">
									<label path="phone" class="form-label">電話 (09xxxxxxxx)</label>
									<input path="phone" type="text" class="form-control"
										id="phone" value="" />
								</div>
								<div class="mb-5">
									<label path="address" class="form-label">地址</label>
									<input path="address" type="text" class="form-control"
										id="address" value="" />
								</div>
								<div class="mb-5">
									<label path="birthday" class="form-label">生日(19xx-xx-xx)</label>
									<input path="birthday" type="text" class="form-control"
										id="birthday" value="" />
								</div>
								<div align="center">
									<button value="submit" id="submit" class="btn btn-primary"
										onclick="processFormData()">送出修改</button>
								</div>
							</form>

							<script type="text/javascript">
								function processFormData() {
									var nickname = $('#nickname').val();
									var phone = $('#phone').val();
									var address = $('#address').val();
									var birthday = $('#birthday').val();

									alert("您的基本資料已修改\n暱稱：" + nickname + "\n電話："
											+ phone + "\n地址：" + address
											+ "\n生日：" + birthday);


									  var params = {
										  	    
									          "nickname":nickname,
									          "birthday":birthday,
									          "phone":phone,
									          "address":address,

									  }
									  
									  console.log("SUCCESS : ", JSON.stringify(params));
									  $.ajax({
										   type:'post',
										   url:'/user1/membercenterupdate.controller',
										   dataType:'JSON',
										   contentType:'application/json',
										   data: JSON.stringify(params),
										   success: function(data) {
										      var json = JSON.stringify(data);
										      
										      console.log("SUCCESS : ", json);
//										      $('#feedback').html("新增成功");
										      
										      var parsedObjinArray = JSON.parse(json);
										      $.each(parsedObjinArray, function(index, value) {
										          console.log(value);
										      });
										   },
										   error: function() {
										      console.log("error");
									      }
									  });

/////////////////////////////////////////

									
								}
							</script>

						</div>
					</div>

					</div>  -->
					<div id="p3">
						<div class="main-box">
							<h3 class="title">
								<a href="/users/orders/ordersList.controller">歷史訂單 </a>
							</h3>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- =================回到頂端=================== -->
	
	<button type="button" id="BackTop" class="toTop-arrow"></button>
	<script>
	$(function(){
		$('#BackTop').click(function(){ 
			$('html,body').animate({scrollTop:0}, 333);
		});
		$(window).scroll(function() {
			if ( $(this).scrollTop() > 300 ){
				$('#BackTop').fadeIn(222);
			} else {
				$('#BackTop').stop().fadeOut(222);
			}
		}).scroll();
	});
	</script>

	<!-- ====================================================自由發揮區==================================================== -->


	<div class="bottom">
		<div class="container">
			<!-- 頁尾 //////////////////////////////////////////////////////////////////////////-->
			<div class="row no-gutters">
				<div class="col-md-6">
					<div class="copy">
						<p>
							&copy; copyright 2022 by iii-Java-123-group1 <i
								class="fas fa-heart"></i>
						</p>
					</div>
					<!-- end copy -->
				</div>
				<!-- end col -->
				<div class="col-md-6">
					<ul class="bottom-nav">
						<li><a href="http://www.bootstrapmb.com/">Home</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms and Conditions</a></li>
					</ul>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end bottom -->



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/js/fonts/modernizr-3.7.1.min.js"></script>
	<script src="/js/fonts/jquery-3.4.1.min.js"></script>

	<!-- Include all compiled plugins(below),or include individual files as needed -->
	<script src="/js/fonts/bootstrap.bundle.min.js"></script>
	<script src="/js/fonts/plugin.js"></script>
	<script src="/js/fonts/main.js"></script>

</body>
</html>