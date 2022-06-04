function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart === null) {
        //no cart

        let products = [];

        let product = {

            productId: pid,
            productName: pname,
            productQuantity: 1,
            productPrice: price

        };

        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product add 1");
        showToast("Item is added to cart");

    } else {
        //cart is already present

        let pCart = JSON.parse(cart);

        let oldProduct = pCart.find((item) => item.productId === pid);
        if (oldProduct) {
            // we have to increse the quantity
            
            oldProduct.productQuantity = oldProduct.productQuantity+1;
            pCart.map((item)=>{
                if(item.productId === oldProduct.productId){
                    item.productQuantity = oldProduct.productQuantity;
                }
                    
            });
                
            localStorage.setItem("cart",JSON.stringify(pCart));
            console.log("Quantity increased");
            showToast("Product Quantity increased");

        } else {
            //we have to add the quantity

            let product = {

                productId: pid,
                productName: pname,
                productQuantity: 1,
                productPrice: price

            };
            
            pCart.push(product);
            localStorage.setItem("cart",JSON.stringify(pCart));
            console.log("product ");
            showToast("Item is added to cart");

        }

    }
    
    
}

//update cart:

function updateCart(){
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart==null || cart.length==0){
        console.log("cart is Empty");
        $(".cart-items").html("0");
        $(".cart-body").html("<h3>Cart does not have any item<h3>");
        $(".checkout-btn").addClass("disabled");
    }else{
        console.log(cart);
        
        $(".cart-items").html(`${cart.length}`);
        
        let table=`
                    <table class='table'>
                    <thread class='thread-light'>
                        <tr>
                        
                        <th> Item Name </th>
                        <th> price </th>
                        <th> Quantity </th>
                        <th> Total Price </th>
                        <th> Action </th>
        
                        </tr>
                    
                    
                    </thread> 
                    
                    `;
        
        let totalPrice = 0;
        
        cart.map((item)=>{
            
           table+=`
                    <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity*item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                    </tr>
                    `;
                totalPrice+=item.productPrice*item.productQuantity;
        });
        
        table = table+`
                    <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price: ${totalPrice} </td></tr>
                    </table>`;
         $(".cart-body").html(table);
         
    }
    
}

function deleteItemFromCart(pid){

    let cart = JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item)=>item.productId!=pid);
    localStorage.setItem('cart',JSON.stringify(newCart));
    showToast("Item is removed from cart");
    updateCart();
}


$(document).ready(function (){
    updateCart();
});


function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

function goTOCheckout(){
    window.location = "checkOut.jsp";
}