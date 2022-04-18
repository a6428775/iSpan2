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
<script type="text/javascript">

$(document).ready(function(){
	login()
});

function login(){


    $.ajax({
        type:'post',
        url:'/Auth.controller',
        dataType:'JSON',
        contentType:'application/json',
        success: function(data){
        	var member = "<li class='nav-item'><a class='nav-link' href='/verifyIdentity.controller' style='font-size:18px;'>會員中心</a></li>"
            var logout = "<li class='nav-item'><a class='nav-link' href='/logout' id='logout' style='font-size:18px;'>登出</a></li>"
                
        	$('#loginlogout').append(member);
        	$('#loginlogout').append(logout);
			

            },
   		error : function(){

   	   		var login = "<li class='nav-item'><a class='nav-link' href='/login/page' id='login'  style='font-size:18px;'>登入</a></li>"
   			$('#loginlogout').append(login);
   	   		}
    });
}	

async function sendmail(){
	const { value: email } = await Swal.fire({
		  title: '請輸入您的信箱',
		  input: 'email',
		  inputLabel: 'Your email address',
		  inputPlaceholder: 'Enter your email address'
		})

		if (email) {
			
		  	   $.ajax({
	           type:'post',
	           url:'/sendmail.controller?email='+email,
		  	 }); 
		  
		  Swal.fire(`訂閱成功!`)
		}
};     
</script>
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
								<a href="/login/welcome"><img src="/images/logo-2.png"
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
									<!-- header 標題列///////////////////////////////////////////////////////////////////// -->
									<ul class="navbar-nav" id="loginlogout" >
<!--  										<li class="nav-item active"><a class="nav-link"
											href="/login/welcome">Home <span class="sr-only">(current)</span></a>
										</li>-->	
										<li class="nav-item" ><a class="nav-link" href="/aboutus" style="font-size:18px;">關於我們</a></li>
										<li class="nav-item"><a class="nav-link" href="/events" style="font-size:18px;">最新消息</a></li>
										<li class="nav-item"><a class="nav-link" href="welcome" style="font-size:18px;">餐廳列表</a></li>						
										<li class="nav-item"><a class="nav-link" href="/faq" style="font-size:18px;">常見問題</a></li>
										<li class="nav-item"><a class="nav-link" href="javascript:sendmail()" style="font-size:18px;">訂閱我們</a></li>
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
					<form action="/createuser1.controller" method="post" >


						<div class="mb-3">
							<label class="form-label">帳號(請輸入正確信箱)：</label>
							<input class="form-control" type="email" 
								id="useremailaddress" name="useremailaddress" placeholder="" value="@gmail.com" required />
						</div>
						<div class="mb-3">
							<label class="form-label">密碼：</label>
							<input class="form-control" type="password" 
								id="userpassword" name="userpassword" placeholder="" required onkeyup="KeyUp()" />
						</div>
						<div class="mb-3">
							<label class="form-label">請再次輸入密碼：</label> <input
								class="form-control" type="password" 
								id="password1" placeholder="" required onkeyup="KeyUp()" />
						</div>

						<div class="mb-3">
							<label class="form-label">請選擇註冊身分：</label> 
								<select id="userrole" name="userrole">

								    <option>USER</option>
								    <option>STORE</option>
								</select>
						</div>

						<span id="different-pwd"></span>
						<div align="center">
							<button class="btn btn-primary" id="submit" value="Submit">送出</button>
							<span style="margin: auto;">${errors.account}</span>
						</div>


					</form>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	
</body>
</html>