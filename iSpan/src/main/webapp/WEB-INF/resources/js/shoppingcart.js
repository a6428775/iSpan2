// 本地資源取得

function getLSContent() {
	// get contents from local storage.
	// if nothing is there, create an empty array
	const lsContent = JSON.parse(localStorage.getItem("products")) || [];
	return lsContent;
}

function setLSContent(lsContent) {
	// save content inside local storage
	localStorage.setItem("products", JSON.stringify(lsContent));
}



function displayProducts() {
	// display all products in the cart

	// get contents from local storage
	const lsContent = getLSContent();
	let productMarkup = "";
	// if local storage is not empty, build the
	// cart items markup and the appropriate details
	if (lsContent !== null) {
		for (let product of lsContent) {
			productMarkup += `
          <tr>
          <td id="pid" data-id=${product.id} store-id=${product.storeid}></td>
          <td id="name">${product.name} </td>
          <td id="productPrice">${product.price}</td>
		  <td>
		  <input class="min" type="button" value="-">
		  <input id="num" name="num" type="text" value='${product.quantity}' readonly="true" onchange="setTotal(e);">
		  <input class="add" type="button" value="+">
		  </td>
		  <td id="itemTotalPrice">${product.price}</td>
          <td><a href="#" data-id="${product.id}" class="remove">X</a></td>
          </tr>
        `;
		}
	} else {
		// if no content is in local storage, alert user
		productMarkup = "Your cart is empty.";
	}
	// add markup to DOM
	document.getElementById("cartItem").innerHTML = productMarkup;
	
	
}

function addQty(clickedBtn){
	var qty = $(clickedBtn.closest('tr').querySelector("#num"))
	var pid = clickedBtn.closest('tr').querySelector("#pid").getAttribute('data-id')
	qty.val(parseInt(qty.val())+1)
	setTotal(clickedBtn)
	updateLSContent(pid, 1)
}

function minQty(clickedBtn){
	var qty = $(clickedBtn.closest('tr').querySelector("#num"))
	var pid = clickedBtn.closest('tr').querySelector("#pid").getAttribute('data-id')
	if(qty.val()>1){
		qty.val(parseInt(qty.val())-1);
		updateLSContent(pid, -1)
	} else {
		alert("至少須購買一件!")
	}
	setTotal(clickedBtn)
	
}

function updateLSContent(pid, qty){
	let lsContent = getLSContent();
	var productIndex;
	lsContent.forEach(function(product, index){
		if (product.id === pid){
			productIndex = index;
			lsContent[productIndex].quantity = lsContent[productIndex].quantity + qty;
		}
	})

	setLSContent(lsContent);
}


function setTotal(event){
	var price = event.closest('tr').querySelector("#productPrice").innerText
	var qty = $(event.closest('tr').querySelector("#num"))
	var itemTotalPrice = event.closest('tr').querySelector("#itemTotalPrice")
	itemTotalPrice.innerHTML = price * qty.val()

}


function getCartItemPrices(){
	const prices = []
	let nums = document.getElementById("cartItem").querySelectorAll("tr td:nth-child(5)")
	let total = 0;
	if(nums.length > 0){
		for (let cell=0; cell< nums.length; cell++){
		 	let num = nums[cell].innerText;
			num = num.replace(/[^\d]/g, "");
			num = parseInt(num);
			prices.push(num);
		}

		for(let i=0 ; i<prices.length;i++){
			total = total +prices[i];
		}
		return total;
	} else{
		return;
	}
}

function displayCartTotal() {
    // display the total cost in the cart
    const prices = getCartItemPrices();
    if (prices>0) {
		var total = document.getElementById("total")
		total.innerHTML = `
		<h5>
			<span class="price text-success">Total: ${prices}NTD</span>
		</h5>
			`
    } else {
		var total = document.getElementById("total")
		total.innerHTML = `
		<h5>
			<span class="price text-success">Total: 0</span>
		</h5>
		`
    }
  }



function saveProduct(clickedBtn) {
	// save selected product in local storage and display it in the cart together

	// vars
	let isProductInCart = false;
	let isSameStore = false;
	
	var productId = clickedBtn.closest('div').querySelector('#pid').innerText
	var productName = clickedBtn.closest('div').querySelector('#name').innerText
	var productPrice = clickedBtn.closest('div').querySelector('#price').innerText
	var storeid = clickedBtn.closest('div').querySelector("#sid").innerText




	// get local storage array
	const lsContent = getLSContent();

	lsContent.forEach(function(product) {
		if(!(product.storeid === storeid)){
			alert("不同店家的商品需分開結帳!請先清空購物車!")
			isSameStore = true;
		} 
		
	})

	// to avoid user adds the same course twice, check
	// the product is not in LS already before adding it
	lsContent.forEach(function(product) {
		if (product.id === productId) {
			alert("此項商品已在購物車內!");
			isProductInCart = true;
		}
	});
	

	// only if the product is not already in the cart,
	// create an object representing selected product info
	// and push it into local storage array
	if (!isProductInCart && !isSameStore) {
		lsContent.push({
			id: productId,
			name: productName,
			price: productPrice,
			quantity : 1,
			storeid: storeid
		});

		

		// add product into into local storage
		setLSContent(lsContent);
		// update the display of courses in the shopping cart
		displayProducts();
		displayCartTotal();
	}
}

function removeProduct(productId) {
	// remove product from cart (and from local storage)

	// retrieve list of products from LS
	const lsContent = getLSContent();

	// get the index of the product item to remove
	// inside the local storage content array
	let productIndex;
	lsContent.forEach(function(product, i) {
		if (product.id === productId) {
			productIndex = i;
		}
	});

	// modify the items in local storage array
	// to remove the selected product item

	lsContent.splice(productIndex, 1);
	// update local storage content
	setLSContent(lsContent);

	displayProducts();
	displayCartTotal();
}

function clearCart() {
	// clear all products from cart (and local storage)

	// retrieve list of products from LS
	const lsContent = getLSContent();
	// empty array in local storage
	lsContent.splice(0, lsContent.length);
	// update local storage
	setLSContent(lsContent);
	// display cart content again
	displayProducts();
	displayCartTotal();
}

function checkout() {
	// checkout: just clear the cart
	// after user confirms the checkout process
	const cartProducts = document.getElementById("cartItem").innerHTML;
	let url = "/product/checkout.controller"
	if (cartProducts !== "" && confirm("您確定要結帳嗎？")) {
		window.location.href= url;

	} else {
		return;
	}
}


// BIND EVENTS AND CALL FUNCTIONS

// Page load:
document.addEventListener("DOMContentLoaded", function(e) {
	// display list of products in cart, if any, on page load
	displayProducts();
	// display cart total
	displayCartTotal();
});

// Save product in cart and Local Storage
// when add to cart button is clicked
document.addEventListener("click", function(e) {
	if (e.target.classList.contains("add-to-cart")) {
		e.preventDefault();
		const clickedBtn = e.target;
		saveProduct(clickedBtn);
	}
});


// bind removeProduct to click event of the cartContent table
document.getElementById("cartItem").addEventListener("click", function(e) {
	e.preventDefault();
	// identify the button that was clicked
	const clickedBtn = e.target;
	// if it's a remove button
	if (e.target.classList.contains("remove")) {
		// get the value of the data-id property, which contains the
		// id of the selected product
		const productId = clickedBtn.getAttribute("data-id");
		// use the id to remove the selected product
		removeProduct(productId);
		// display products in the cart again,
		// now the list should be displayed with 1 less product
		// or empty if no products are left in the cart

		// adjust the total
		
	}
	if (e.target.classList.contains("add")){
		addQty(clickedBtn);
	}
	if (e.target.classList.contains("min")){
		minQty(clickedBtn);
	}
	displayCartTotal()



});

