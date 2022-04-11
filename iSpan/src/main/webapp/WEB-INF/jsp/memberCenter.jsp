<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="https://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet">
<link href="/css/fonts/styles.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="/css/reset.css">
<style type="text/css">
	.list-group {
		padding: 25px 0;
		margin: 25px 0px 0 0;
	}
	
 	.list-group-item{
		text-align: center;
		box-shadow: 0 1px 6px black;
		
	} 
	#menu-user {
	  position: fixed;
	  left: 0;
	  top: 60%;
	  width: 10em;
	  margin-top: -2.5em;
	  background: #eb482d;
	  color: white;
	  font-weight: bold;
	  font-size: large;
	  text-align: left;
      border: solid #eb482d;
  	  border-right: none;
	  padding: 0.5em 0.5em 0.5em 2.5em;
      box-shadow: 0 1px 6px black;
      border-radius: 3em 0.5em 0.5em 3em;
	}


</style>

<style>
	.main-box {
		margin: 25px 0px 30px 100px;
		width: 800px;
		height: 700px;
		padding: 70px;
		box-shadow: 5px 5px 10px #999;
		border: 1px solid #fff;
		text-align: center;
		font-size: 1.3em;
	}
	
	.main-box1 {
		margin: 0 0 30px 100px;
		width: 800px;
		height: 500px;
		padding: 70px;
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
											href="/login/welcome">Home <span class="sr-only">(current)</span></a>
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

										<li class="nav-item"><label class="nav-link">登入帳號：${Useraccount}</label>
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

			<div class="row-cols-1 col-12 col-md-3" id=menu>
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action">購物車</a> 
					<a href="#" class="list-group-item list-group-item-action" aria-current="true">聯絡我們</a> 
					<a href="#" class="list-group-item list-group-item-action">常見問題</a>
					<!-- <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
					<!-- <a class="list-group-item list-group-item-action disabled">A disabled link item</a> -->
				</div>

				<div class="list-group" id=menu-user>
					<a href="#p1" class="list-group-item list-group-item-action">基本資料</a>
					<a href="#p2" class="list-group-item list-group-item-action">帳號管理</a> 
					<a href="#p3" class="list-group-item list-group-item-action">歷史訂單</a>
					<!-- <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
					<!-- <a class="list-group-item list-group-item-action disabled">A disabled link item</a> -->
				</div>
				
				<!-- <div class="list-group">
					<a href="/store/membercenter.controller" class="list-group-item list-group-item-action">後臺管理(權限)</a>
				</div> -->
				
				
				
			</div>

			<div class="g-4 row-cols-1 col-12 col-md-8">

				<!-- tabs分頁 -->
				<div id="tabs">

					<div id="p1">
						<div class="main-box">
							<h3 class="title">基本資料</h3>
							<form id="form-userinfo" action="/Account/User1/membercenterupdate.controller" method="post">
								<div class="mb-3">
									<label class="form-label">帳號</label>
									<input name="Useremailaddress" type="text" class="form-control"
										id="Useremailaddress" value="${Useraccount}" disabled />
								</div>
								<div class="mb-3">
									<label class="form-label">暱稱</label>
									<input name="Nickname" type="text" class="form-control"
										id="Nickname" value="${Nickname}" />
								</div>
								<div class="mb-3">
									<label class="form-label">電話 (09xxxxxxxx)</label>
									<input name="Phone" type="text" class="form-control"
										id="Phone" value="${Phone}" />
								</div>
								<div class="mb-3">
									<label class="form-label">地址</label>
									<input name="Address" type="text" class="form-control"
										id="Address" value="${Address}" />
								</div>
								<div class="mb-3">
									<label class="form-label">生日</label>
									<input name="Birthday" type="date" class="form-control" id="Birthday" value="${Birthday}">
								</div>
								
								<!-- =================生日預設=================== -->
								<script type="text/javascript">
									var now = new Date(); // 給input date設定預設值
									var day = ("0" + now.getDate()).slice(-2); //格式化日，如果小於9，前面補0
									var month = ("0" + (now.getMonth() + 1)).slice(-2); //格式化月，如果小於9，前面補0
									var today = now.getFullYear()+"-"+(month)+"-"+(day) ; //拼裝完整日期格式
									$('#Birthday').val(today); //完成賦值 
								</script>
								
								<div align="center">
									<button value="submit" id="submit" class="btn btn-primary" 
										onclick="processFormData()">送出修改</button>
								</div>
							</form>

							<script type="text/javascript">
								function processFormData() {
									var nickname = $('#Nickname').val();
									var phone = $('#Phone').val();
									var address = $('#Address').val();
									var birthday = $('#Birthday').val();

									alert("您的基本資料已修改\n暱稱：" + nickname + "\n電話："
											+ phone + "\n地址：" + address
											+ "\n生日：" + birthday);
								}
							</script>

						</div>
					</div>
					<div id="p2">
						<div class="main-box1">
							<h3 class="title">修改密碼</h3>
							<form id="form-userinfo" action="/Account/User1/membercenterupdatepwd.controller"method="post">

								<div class="mb-5">
									<label class="form-label">新密碼</label>
									<input name="userpassword" type="password" class="form-control" id="userpassword" required 
											placeholder="請輸入新密碼" onkeyup="KeyUp()" />
								</div>
								<div class="mb-5">
									<label for="userpassword-new" class="form-label">請再次輸入新密碼</label>
									<input name="userpassword-new"  type="password" class="form-control" id="userpassword-new" required 
											placeholder="再次輸入新密碼" onkeyup="KeyUp()" /> 
										<span id="different-pwd"></span>
								</div>
								<div align="center">
									<button type="submit" id="submit1" class="btn btn-primary" disabled
										onclick="processFormDataPwd()">送出修改</button>
								</div>
							</form>
							
							<script type="text/javascript">
								function processFormDataPwd() {
									alert("您的密碼已修改！");
								}
							</script>

							<script>
								function KeyUp() {
									var a = $('#userpassword').val();
									// alert(a); 
									var b = $('#userpassword-new').val();
									// alert(b); 
									if (a == b && a !="") {
										$('#submit1').removeAttr('disabled');
										document.getElementById("different-pwd").innerHTML = "";
									} else {
										$('#submit1').attr('disabled','disabled');
										document.getElementById("different-pwd").innerHTML = "<h5 style='color:red;padding-top:10px;'>兩次密碼不相同，請重新輸入。</h5>";
									}
								}
							</script>

						</div>
					</div>
					<div id="p3">
						<div class="main-box">
							<h3 class="title">歷史訂單</h3>
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

	<!-- ==================================================================================================================== -->


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