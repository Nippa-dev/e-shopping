<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>
<%@page import="GreenSupermarket.dao.OrderDao" %>
<%@page import="GreenSupermarket.connection.DbCon" %>
<%@page import="GreenSupermarket.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if(auth != null) {
     request.setAttribute("auth", auth);
     orders = new  OrderDao(DbCon.getConnection()).userOrders(auth.getId());
    } else {
     response.sendRedirect("login.jsp");
    }
    double total = 0.00;
    Object totalFromCart = session.getAttribute("totalFromCart");
    if (totalFromCart != null) {
        total = (Double) totalFromCart;
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null) {
     request.setAttribute("cart_list", cart_list);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Orders Page</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container">
<div class="card-header my-3">All Orders</div>
<table class="table table-light">
<thead>
<tr>
<th scope="col">Date</th>
<th scope="col">Name</th>
<th scope="col">Category</th>
<th scope="col">Quantity</th>
<th scope="col">Price</th>
<th scope="col">Cancel</th>
</tr>
</thead>
<tbody>
<%
if(orders != null) {
 for(Order o:orders){%>
 <tr>
  <td><%= o.getDate() %> </td>
  <td><%= o.getName() %> </td>
  <td><%= o.getCategory() %> </td>
  <td><%= o.getQuantity() %> </td>
  <td>Rs <%= dcf.format(o.getPrice()) %> </td>
  <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%= o.getOrderId() %>">Cancel</a></td>
 </tr> 
 <%}
}
%>
</tbody>
</table>


<h1>Total: Rs <%= dcf.format(total) %></h1>

<button style="margin:auto; display:flex;width:10%;text-align: center;justify-content: center;padding:10px" id="purchaseButton" onclick="Purchase()">Purchase</button>
<div style="display:none;width: 400px;margin:auto;border:2px solid #575757; border-radius: 10px; padding: 10px" id="paypalButtons"></div>

</div>
<script src="https://www.paypal.com/sdk/js?client-id=ASrhVxw9kkGtT0vh5xuu0PRqMhlyC7Tz-j4G5JIiq-ptpfVNx2MepiTMp9IVkuEQwQUgeeU08b7GS0sX"></script>
<script>
  function Purchase(){
    document.getElementById("purchaseButton").style.display = "none";
    document.getElementById("paypalButtons").style.display = "block";
  }
  paypal.Buttons({
        createOrder: function(data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: '<%= total %>'
                    }
                }]
            });
        },
        onApprove: function(data, actions) {
            
            return actions.order.capture().then(function(details) {
                
            });
        },
        onError: function(err) {
            
        }
    }).render('#paypalButtons');
</script>

<%@include file="includes/footer.jsp"%>
</body>
</html>
