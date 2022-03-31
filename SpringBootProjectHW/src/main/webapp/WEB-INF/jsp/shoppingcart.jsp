<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
		<div class="modal-content">
			<div class="modal-header border-bottom-0">
				<h5 class="modal-title" id="exampleModalLabel">購物車</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-image">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">產品名稱</th>
							<th scope="col">單價</th>
							<th scope="col">數量</th>
							<th scope="col">總價</th>
							<th scope="col">移除</th>
						</tr>
					</thead>
					<tbody id="cartItem"></tbody>
				</table>
				<div class="d-flex justify-content-end" id="total">
					<h5>
						<span class="price text-success">Total</span>
					</h5>
				</div>
			</div>
			<div class="modal-footer border-top-0 d-flex justify-content-between">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
				<button type="button" class="clearCart" onclick="clearCart()">清空購物車</button>
				<button type="button" class="btn btn-success" onclick="checkout()">結帳</button>
			</div>
		</div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
	<script src="/js/shoppingcart.js"></script>
	
</body>
</html>