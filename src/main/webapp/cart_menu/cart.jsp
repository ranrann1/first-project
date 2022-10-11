<%@page import="ez_phone.dao.*"%>
<%@page import="ez_phone.dto.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String workgroup = request.getParameter("workgroup");
if (workgroup == null) {
	workgroup = "main";
}

String process = request.getParameter("process");
if (process == null) {
	process = "main";
}

String contentFilePath = workgroup + "/" + process + ".jsp";




%> 
<%
	//cart 테이블에 저장된 모든 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<CartDTO> cartList=CartDAO.getDAO().selectCartList();
	int order_moeny=0;
	int num=0;
	
	String p_code=request.getParameter("p_code");
	CartDTO cartProduct=CartDAO.getDAO().selectProduct(p_code);
%>  
<%@include file="/security/login_url.jspf" %>
<style type="text/css">
		
		.txt-s20 {
		    font-size: 1.8vw;
		    letter-spacing: -0.0000vw;
		}
		
		label {
			font-size:16px;
		}
		
		i {
		    font-size: 2rem;
		    color: #000000;
		}
		
		a{
			text-decoration: none;
			color: black;
		}
		
		.container {
			 display: flex;
			 flex-flow: row nowrap;
		}
		
		.cart-payment-area empty {
			 width: 20%;
			 height: 400px;
			 position: sticky;
			 top: 0; 
		}
		
		#container {
		    position: relative;
		    width: 100%;
		    text-align: left;
		}

		.opt-select main-cart{
		display: flex;
		}
		
		.opt-select .opt-select-right {
			float: right;
		}
		
		.blind {
		    position: absolute;
		    overflow: hidden;
		    border: 0;
		    width: 0.0909vw;
		    height: 0.0909vw;
		    clip: rect(0.0909vw, 0.0909vw, 0.0909vw, 0.0909vw);
		    clip-path: inset(50%);
		}
		
		.empty-cart {
		    min-height: 18.1818vw;
		    margin-bottom: 9.0909vw;
		    background: #f7f7f7;
	        position: relative;
		    display: none;
		    min-height: 200px;
		    margin-bottom: 100px;
		    text-align: center;
		    border-top: 2px solid #191919;
		    
		}
		
		.empty-cart .empty-text {
			position: absolute;
		    display: inline-block;
		    left: 50%;
		    top: 50%;
		    font-size: 16px;
		    font-weight: bold;
		    vertical-align: middle;
		    transform: translate(-50%, -50%);
		}
	
		.cart-btn-box {
		    display: none;
		    padding-top: 25px;
			padding-bottom: 12px;
		    text-align: center;
		}
		
		.chk-form{
			border-bottom: 2px solid #191919;
		}
		
		.cart-tbl{
			border-bottom: 1px solid #141414;
		}
		
		.cart-tbl .cart-td {
		    position: relative;
		    display: table-cell;
		    text-align: left;
		    vertical-align: top;
		    font-size: 1.1111vw;
		    height: 7.4583vw;
		    padding: 1.5vw 15px 1.5vw 15px;
		}
		
		.cart-image {
		    width: 21.5%;
		}
		.cart-name {
		    width: 23.8%;
 		   padding-right: 1.6667vw;
		}
		.cart-spec {
		    width: 26.2%;
		    padding-right: 1.6667vw;
		}
		.cart-count {
		    width: 15%;
		}
		.cart-price {
		    width: 13.5%;
		    padding-right: 0;
		}
		
		.o-title {
			margin-bottom: 0vw;
		}
		
		.o-label {
			margin-top: 0.4167vw;
		    font-size: 0.8333vw;
		}
		
		.btn {
		    display: inline-block;
		    margin: 0 4px;
		    padding-left: 24px;
		    padding-right: 24px;
		    font-weight: bold;
		    text-align: center;
		    vertical-align: middle;
		    border: 1px solid rgba(33,36,37,.6);
		    background: #fff;
		    overflow: hidden;
		}
		
		.btn-d {
		    min-width: 96px;
		    height: 40px;
		    line-height: 38px;
		    font-size: 14px;
		    border-radius: 20px;
		}
		
		.btn-type1 {
		    color: #212425;
		    background: #fff;
		    border: 1px solid #212425;
		}
		
		.cart-content {
		    position: relative;
		    max-width: 1440px;
		    min-height: 620px;
		    padding-right: 410px;
		}
		
		.content {
		    max-width: 1440px;
		    margin: auto;
		}
		
		.cart-content {
		    max-width: 130.9091vw;
		    padding-right: 26vw;
		}
		
		.cart-payment-area {
		    position: absolute;
		    right: 24px;
		    top: 156px;
		    width: 100%;
		    max-width: 330px;
		    background: #fff;
		    border-top: 2px solid #191919;
		    z-index: 10;
		}
		
		.cart-payment-area {
		    right: 2.1818vw;
		    top: 14.1818vw;
		    width: 100%;
		    max-width: 20vw;
		    background: #fff;
		}
		
		.cart-payment-area.empty {
		    top: 6vw;
		    font-size: 1vw;
		}
		
		ol, ul, li {
		    list-style: none;
		}
		
		.delivery-change {
		    position: relative;
		    min-height: 120px;
		    padding: 24px 19px;
		    text-align: center;
		    background-color: #f7f7f7;
		    border-bottom: 1px solid #d9d9d9;
		    overflow: hidden;
		}
		
		.delivery-change .delivery-tit {
		    position: relative;
		    min-height: 24px;
		    margin-bottom: 16px;
		    padding: 4px 0;
		    padding-left: 40px;
		    font-size: 16px;
		    color: #000;
		    font-weight: bold;
		    text-align: left;
		}
		
		.cart-payment-area .payment-listup {
		    padding: 1.1818vw 0;
		    border-bottom: 0.0909vw solid #eaeaea;
		    overflow: hidden;
		    margin: 0;
		}
		
		.cart-payment-area .payment-listup > li > .head {
		    float: left;
		    width: 50%;
		}
		
		.cart-payment-area .payment-listup > li > .text {
		    text-align: right;
		}
		
		.cart-payment-area .payment-listup > li > span {
		    display: block;
		    padding: 0.2727vw 0;
		    color: #707070;
		}
		
		.cart-payment-area .payment-listup > li {
		    clear: both;
		    margin-bottom: 1.0909vw;
		    overflow: hidden;
		}
		
		.cart-foot {
			font-size: 1.0909vw;
		    line-height: 1.5;
			position: relative;
		    width: 100%;
		    max-width: 130.9091vw;
		    margin: 0 auto;
		    border-top: 0.1818vw solid #000;
		}
		
		.cart-foot .cart-foot-right {
		    float: right;
		    text-align: right;
		}
		
		.cart-foot .cart-foot-left {
		    float: left;
		}
		
		.cart-foot p {
		    font-size: 0.8vw;
		    line-height: 1.5;
		    color: #707070;
		    padding: 0;
		}
		
		.cart-payment-area .cost-listup {
		    padding: 1.4545vw 0;
		    padding-bottom: 0;
		    border-bottom: 0;
		    overflow: hidden;
		    margin: 0;
		}
		
		.cart-payment-area .cost-listup > li > .text {
	    	float: right;
	    	width: 50%;
	   		color: #000;
	    	text-align: right;
		}
		
		.btn-type3 {
		    background: #2189FF;
		}
		
		.cart-payment-area .btn-l {
		    width: 99%;
		    margin-top: 0.2727vw;
		    color: #fff;
		    min-width: 0.6364vw;
		    height: 3.5455vw;
		    line-height: 2.3636vw;
		    padding-left: 2.7273vw;
		    padding-right: 2.7273vw;
		    font-size: 1vw;
		    border: 0.1818vw solid;
		    border-radius: 2.7273vw;
		}
		
</style>
<body>
	<!-- Main content -->	
	    <div id="container" class='' >		
			<div id="editor"></div>
			<form action="index.jsp?workgroup=order&process=order-area"name="cart_form" id="cart_form">
				<div class="content cart-content">
					<div class="tit-box cart-title">
					    <h1 class="txt-s20">장바구니</h1>
					</div>
					<div class="cart-elec-area">
					<!-- s : 전체선택 -->
						<div class="opt-select main-cart">
							<div class="chk-form">
							    <input type="checkbox" id="allCheck" data-type="main" name="cart_check_box_all" value="N" title="">
							    <label for="cart_check_box_all">전체선택</label>
								<div class="opt-select-right">
									<button type="button" data-type="main" id=removeBtn>선택 삭제</button>
								</div>
							</div>
					<!-- e : 전체선택 -->
					<!-- s : 주문상품 -->
							<div class="cart-area main-cart">
						   		<h2 class="blind">주문상품</h2>
						   		<% if(cartList.isEmpty()) { %>
									<div class="empty-cart" style="display:block;">	 
										<div id="message" style="color: black;" class=removeMg>
			        						<span class="empty-text">장바구니에 담겨있는 상품이 없습니다.</span>
		        						</div>
									</div>
								<% } else { %>
									<% for(CartDTO cart:cartList) { %>
										<div class="cart-tbl">
											<input type="checkbox" id = "checkId" name="checkId" value="<%=cart.getP_code() %>" class="check">
											<div class="cart-td cart-image">
												<img src="<%=request.getContextPath()%>/images_product_all/<%=cart.getP_image() %>" width="100" height="100">
											</div>
											<div class="cart-td cart-name">
												<p class=o-title><%=cart.getP_name() %></p>
												<p class=o-label><%=cart.getP_code() %></p>
											</div>
											<div class="cart-td cart-spec">
												<p>색상 : <%=cart.getP_color() %></p>
												<p>용량 : <%=cart.getP_size() %> GB</p>
											</div>
											<div class="cart-td cart-count"><p>1개</p></div>
											<div class="cart-td cart-price"><p><%=DecimalFormat.getCurrencyInstance().format(cart.getP_price()) %></p></div>
										</div>
										<% order_moeny+=cart.getP_price(); %>
										<% num+=1; %>
									<% } %>
								<% } %>
								
								
						       	<div class="cart-btn-box" style="display:block;">
						        	<a href="index.jsp?workgroup=main&process=main" class="btn btn-d btn-type1">홈으로</a>
						       	</div>
						   	</div>
					<!-- e : 주문상품 -->
						</div>
					</div>        
		<!-- s : Sticky Sidebar -->                
	        <div class="cart-payment-area empty">
	        	<h2 class="blind delivery-title">배송지 추가/변경</h2>
		    	<!-- s : 배송지 정보 -->
		    	<div class="delivery-change" id="deliveryChange">
		        	<div id="memberNoDeliveryAddress" style="display:none">
		        		<p class="entry-add">배송지를 등록해 주세요.</p>
		        		<button type="button" class="btn btn-d btn-type1" id="dlvrInsertBtn" name="dlvrInsertBtn" data-type="I" onclick="fnOnClickSaveBtn(this);">배송지 등록</button>
		        	</div>
		        	<div id="memberDefaultDeliveryAddress">
						<p class="delivery-tit"><span id="spanAdrsNm">기본 배송지 : 주소</span></p>
						<p class="delivery-txt"><span id="spanRoadAddr">[<%=loginMember.getZipcode() %>]<%=loginMember.getAddress_1() %></span></p>
						<p class="delivery-txt"><span id="spanRoadDtlAddr"><%=loginMember.getAddress_2() %></span></p>
					</div>
		        	<div id="memberDeliveryAddress" style="display:none"></div>
		        </div>
		 		<!-- e : 배송지 정보 -->
		 		<!-- s : 결제 정보 -->
			 	<h2 class="blind">결제 정보</h2>
					<ul class="payment-listup cart-bcart-top">
						<li>
					   	    <span class="head">전체 상품</span>
					        <span class="text"><strong><%=num %></strong>개</span>
					    </li>
					    <li>
					        <span class="head">주문 금액</span>
					        <span class="text"><strong><%=order_moeny%></strong> 원</span>
					    </li>
					</ul>
				    <ul class="cost-listup">
					    <li>
					      	<span class="head"><strong>결제 예정 금액</strong></span>
					        <span class="text"><strong><%=order_moeny%></strong> 원</span>
						</li>
						<li>
							
					   		<a href="index.jsp?workgroup=order&process=order-area" id="buy" >
							<button id="btnCartOrder" type="button" class="btn btn-l btn-type3">결제하기</button>
					   		</a>
							
					   	</li>
				    </ul>
				<!-- e : 결제 정보 -->
	        </div>
		<!-- e : Sticky Sidebar -->
		<!-- s : cart-foot-->
			    <div class="cart-foot">
				    <div class="cart-foot-inner">
				    	<div class="cart-foot-left">
					        <p>고객센터<strong class="txt-small"> 1588-6084</strong>평일 09시 ~ 18시 / 토요일 09시 ~ 13시 (일요일, 공휴일은 운영하지 않습니다.)</p>
					        <p>큐커 식품관 고객센터 <strong class="txt-small">1811-9228</strong> 평일 09시~ 18시(주말, 공휴일은 운영하지 않습니다.)</p>
					    </div>
				    </div>
				</div>
		<!-- e : cart-foot-->
		    </div>
		</form>
	   	</div>	   	
	<!-- e : Main content -->
	
<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").length==0) {
		alert("선택된 상품이 없습니다.");
		return;
	}
	
	$("#cart_form").attr("action","index.jsp?workgroup=cart_menu&process=cart_remove");
	$("#cart_form").attr("method","post");
	$("#cart_form").submit();
});


</script>
	
	