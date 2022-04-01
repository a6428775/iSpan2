<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- STYLE CSS -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yellowtail"
	rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">
<style type="text/css">
</style>
<title>註冊</title>
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
										<li class="nav-item"><a class="nav-link"
											href="about.html">關於我們</a></li>
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

										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#"
											id="navbarDropdown4" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">會員中心</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
												<a class="dropdown-item" href="/login/page">登入</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="/user1main.controller">註冊</a>
											</div></li>
										<li class="nav-item"><a class="nav-link"
											href="typography.html">購物車</a></li>
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

		<!-- ====================================================自由發揮區==================================================== -->


		<div class="container">
			<div class="row">
				<div class="offset-sm-3 col-sm-6 my-5 p-5 border shadow">
					<h3 align="center">註冊</h3>
					<form:form action="/createuser1.controller" method="post" modelAttribute="user1">
						<div class="mb-3">
							<form:label path="useremailaddress" class="form-label">帳號(請輸入正確信箱)：</form:label>
							<form:input class="form-control" type="text" path="useremailaddress"
								id="useremailaddress" placeholder="" required="true" />
						</div>
						<div class="mb-3">
							<form:label path="userpassword" class="form-label">密碼：</form:label>
							<form:input class="form-control" type="password" path="userpassword"
								id="userpassword" placeholder="" required="true" onkeyup="KeyUp()" />
						</div>
						<div class="mb-3">
							<label path="password1" class="form-label">請再次輸入密碼：</label> <input
								class="form-control" type="password" path="password1"
								id="password1" placeholder="" required="true" onkeyup="KeyUp()" />
						</div>
						<div class="mb-3">
							<form:label path="nickname" class="form-label">姓名：</form:label>
							<form:input class="form-control" type="text" path="nickname"
								id="nickname" placeholder="" required="true" />
						</div>
						<div class="mb-3">
							<form:label path="phone" class="form-label">電話：</form:label>
							<form:input class="form-control" type="text" path="phone"
								id="phone" placeholder="" required="true" />
						</div>
						<div class="mb-3">
							<form:label path="address" class="form-label">地址：</form:label>
							<form:input class="form-control" type="text" path="address"
								id="address" placeholder="" required="true" />
						</div>
						<div class="mb-3">
							<form:label path="birthday" class="form-label">生日：</form:label>
							<form:input class="form-control" type="text" path="birthday"
								id="birthday" placeholder="" required="true" />
						</div>
						<span id="different-pwd"></span>
						<div align="center">
							<form:button class="btn btn-primary" id="submit" value="Submit">送出</form:button>
							<span style="margin: auto;">${errors.account}</span>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<script>
			function KeyUp() {
				var a = $('#userpassword').val();
				// alert(a); 
				var b = $('#password1').val();
				// alert(b); 
				if (a == b) {
					$('#submit').removeAttr('disabled');
					document.getElementById("different-pwd").innerHTML = "";
				} else {
					$('#submit').attr('disabled', 'disabled');
					document.getElementById("different-pwd").innerHTML = "<h4 style='color:red;font-size:20px'>兩次密碼不相同</h4>";
				}
			}
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

	</div>
	<!-- end #page hfeed site -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/js/fonts/modernizr-3.7.1.min.js"></script>
	<script src="/js/fonts/jquery-3.4.1.min.js"></script>

	<!-- Include all compiled plugins(below),or include individual files as needed -->
	<script src="/js/fonts/bootstrap.bundle.min.js"></script>
	<script src="/js/fonts/plugin.js"></script>
	<script src="/js/fonts/main.js"></script>
</body>
</html>