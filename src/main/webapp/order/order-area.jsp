<%@page import="ez_phone.dao.*"%>
<%@page import="ez_phone.dto.*" %>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_url.jspf" %>
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
	//MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<CartDTO> cartList=CartDAO.getDAO().selectCartList();

	int order_money=0;
	int num=0;
%>  

<style type="text/css">
.txt-s20 {
    font-size: 1.8vw;
    letter-spacing: -0.0000vw;
}

html #wrap {
    max-width: none;
    overflow: visible;
}

#container {
    position: relative;
    width: 100%;
    text-align: left;
}

form {
    display: block;
    margin-top: 0em;
}

.content {
	max-width: 1440px;
	margin: auto;
}

.order-content {
	position: relative;
    max-width: 130.9091vw;
    min-height: 620px;
    padding-right: 26vw;
}

.order-content .content {
    min-height: 704px;
    max-width: 130.9091vw;
    padding: 4.5455vw 37.2727vw 0 2.1818vw;
    position: relative;
}

.order-content .order-area {
    margin-bottom: 3.0909vw;
}

.order-content .order-tbl {
    display: flex;
    width: 100%;
}

.order-content .order-tbl .order-td {
    position: relative;
    display: table-cell;
    text-align: left;
    vertical-align: top;
    font-size: 1.1111vw;
    height: 7.4583vw;
    padding: 1.5vw 15px 1.5vw 15px;
}

.order-content .order-tbl .order-image {
    width: 26%;
    padding-right: 1.3636vw;
}
.order-content .order-tbl .order-spec {
    width: 26%;
    padding-right: 1.1818vw;
}
.order-content .order-tbl .order-count {
    width: 27%;
    padding-right: 1.1818vw;
}
.order-content .order-tbl .order-price {
    width: 21%;
    text-align: right;
}

.order-box {
 	position: relative;
    display: table-cell;
    text-align: left;
    vertical-align: top;
    font-size: 1.1111vw;
    height: 7.4583vw;
}
.order-content .order-area > h2 {
    padding-bottom: 0.4167vw;
    line-height: 1.3em;
    font-size: 1.3889vw;
    color: #000;
    font-weight: bold;
    border-bottom: 1px solid #191919;
}

ol, ul, li {
    list-style: none;
    padding-inline-start: 0px;
}
.order-info-box > li {
    padding: 2.0833vw 0;
    padding-left: 16.3889vw;
    position: relative;
    border-bottom: 1px solid #eaeaea;
}
.order-info-box .head {
    left: 0;
    top: 2.0833vw;
    width: 18%;
    max-width: 8.1944vw;
    padding: 0.5556vw 0;
    position: absolute;
    color: #444;
}
.input-type-small {
    width: 100%;
    max-width: 39.3056vw;
}

.input-type-ul .s-head, .input-type-div .s-head {
    left: 0;
    width: 37%;
    padding: 0.6944vw 0;
    position: absolute;
    color: #444;
}
.input-type-ul > li, .input-type-div > div {
    min-height: 2.2222vw;
    margin-bottom: 1.3889vw;
    padding: 0;
    position: relative;
    padding-left: 37%;
}
.order-content .payment-area {
    right: 7vw;
    top: 12.5vw;
    width: 100%;
    max-width: 20vw;
    background: #fff;
    position: fixed;
    z-index: 10;
    font-size: 1vw;
}

.order-content .payment-area > h2 {
    padding-bottom: 0.5455vw;
    border-bottom: 2px solid #191919;
    margin: 0;
}

.order-content .payment-area .payment-listup {
    padding: 1vw 0;
    border-bottom: 1px solid #eaeaea;
    margin: 0;
}

.order-content .payment-area .payment-listup > li {
    display: flex;
}

.order-content .payment-area .payment-listup > li > span {
    width: 50%;
    font-size: 1vw;
    letter-spacing: 0;
}

.order-content .payment-area .payment-listup > li > .text {
    color: #000;
    text-align: right;
    line-height: 21px;
}

.order-content .payment-area .payment-listup > li ~ li {
    margin-top: 1.0909vw;
}

.order-content .payment-area .cost-listup {
    padding-top: 0.1818vw;
    font-size: 1vw;
}

.order-content .payment-area .terms-box {
    padding-top: 1.0909vw;
	position: relative;
	border-top: 1px solid #191919;
}

.order-content .payment-area .terms-box > h2 {
    line-height: 1.3em;
    padding-bottom: 0.5818vw;
    font-size: 1vw;
    margin: 0;
}

.order-content .payment-area .terms-box .chk-form ~ .chk-form {
    margin-top: 1.4545vw;
}

.order-content .payment-area .btn {
    width: 100%;
    font-size: 1vw;
    font-weight: normal;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    overflow: hidden;
}

.btn-l {
    min-width: 13.6364vw;
    height: 3.5455vw;
    line-height: 3.3636vw;
    padding-left: 2.7273vw;
    padding-right: 2.7273vw;
    font-size: 1vw;
    border: 0.1818vw solid;
    border-radius: 2.7273vw;
}

.btn-type3 {
    color: #fff;
    background: #2189FF;
}

button {
    -webkit-tap-highlight-color: transparent;
    outline: none;
}

.order-info-box .order-btn {
	position: absolute;
    right: 0;
    top: 2vw;
    padding: 0.7273vw 0;
}

.order-info-detail > li {
    margin: 0vw;
    padding: 0.5455vw 0;
}
.error {
	color: red;
	position: relative;
	display: none;	
}
</style>
<body>
<script type="text/javascript">
function checkForm() {
	var mobile2Reg=/\d{3,4}/;
	var mobile3Reg=/\d{4}/;
	if($(".check").filter(":checked").length==0) {
		alert("약관에 동의해 주세요.");
		return false;
	} else if($(".check").filter(":checked").length==1) {
		alert("약관에 동의해 주세요.");
		return false;
	} else if($("#card_number2").val()=="" || $("#card_number3").val()==""
			|| $("#card_number4").val()==""|| $("#card_number5").val()=="") {
		$("#cardMsg").css("display","block");
		return false;
	} else if(!card2Reg.test($("#card_number2").val()) || !card3Reg.test($("#card_number3").val())
			|| !card4Reg.test($("#card_number4").val())|| !card5Reg.test($("#card_number5").val())) {
		$("#cardRegMsg").css("display","block");
		return false;
	}
	alert("결제가 완료되었습니다.");
	return true;
};

</script>

<div id="wrap">
	<div id="container" class='' >
		<div id="editor"></div>
		<form  action="index.jsp?workgroup=order&process=order_add" id="order_payment_form" name="order_payment_form" method="post"
			onsubmit="return checkForm()">
			
			<input type="hidden" name="zipcode" value="<%=loginMember.getZipcode() %>">
			<input type="hidden" name="address_1" value="<%=loginMember.getAddress_1() %>">
			<input type="hidden" name="address_2" value="<%=loginMember.getAddress_2() %>">
			<div class="content order-content" data-sticky-container>
				<!-- title -->
				<div class="tit-box cart-title">
					<h1 class="txt-s20">주문/결제</h1>
				</div>
				<!-- title -->
				
				<!-- S : 주문상품 -->
				<div class="order-area order-m-area">
					<h2>주문상품</h2>
					
					<% for(CartDTO cart:cartList) { %>
					<div class="order-tbl order-page buy-target-goods p-bespoke watch-opt cartListRst">
						<!-- S : 이미지  -->
						<div class="order-td order-image">
							<img src="<%=request.getContextPath()%>/images_product_all/<%=cart.getP_image() %>" width="100" height="100">
						</div>
						<!-- E : 이미지  -->
						<!-- S : 모델명 -->
						<div class="order-td order-name">
							<p class="o-title"><%=cart.getP_name() %></p>
							<input type="hidden" name="p_code" id="p_code"value="<%=cart.getP_code() %>">
		           			<p class="o-label"><%=cart.getP_code() %></p>
						</div>
						<!-- E : 모델명 -->
						<!-- S : 갯수 -->
						<div class="order-td order-spec">
							<p>색상 : <%=cart.getP_color() %></p>
							<p>용량 : <%=cart.getP_size() %> GB</p>
						</div>
							<input type="hidden" name="buyQtyOrd" value="1" /> 		  
						<!-- E : 갯수 -->
						<div class="order-td order-count">
							<p>1개</p>
						</div>
						<!-- S : 가격 -->
						<div class="order-td order-price">
							<p><%=DecimalFormat.getCurrencyInstance().format(cart.getP_price()) %></p>
						</div>
						
						<!-- E : 가격 -->
					</div>	
					<%order_money+=cart.getP_price(); %>
					<% num+=1; %>
				<% } %>				
				</div>
				<!-- E : 주문상품 -->
				<div class="order-area">
				<!-- s : 배송정보 -->
					<h2 class="m-secon-tit">배송 정보</h2>
					<div class="order-box">
						<ul class="order-info-box">
		    			<!-- s : 회원 주문자 정보 -->
			       			<li id="liMemberInfo" style="display:;">
			        		    <span class="head">주문자 정보</span>
			        			    <ul class="order-info-detail info-order">
			                			<li>이름 : <span id="spanMbrNm"><%=loginMember.getName() %></span></li>
			               				<li>휴대폰 : <span id="spanMbrMobile"><%=loginMember.getPhone_number() %></span></li>
			                			<li>이메일 : <span id="spanMbrEmail"><%=loginMember.getE_mail() %></span></li>
			            			</ul>
			        		</li>
			        	<!-- e : 회원 주문자 정보 -->
						<!-- s : 배송지 정보 -->
							<li>
								<span class="head">배송지 정보</span>
						<!-- s : 단일 배송 -->
								<div id="delivery-tab-view1" class="tab-view delivery-tab-view info-delivery-single" style="display:block">	
								    <ul class="order-info-detail info-order">
								        <li>이름 : <span id="spanOrdAdrsNm"><%=loginMember.getName() %></span></li>
								        <li>연락처 : <span id="spanOrdAdrsMobile"><%=loginMember.getPhone_number() %></span></li>
								        <li>배송지 : <span id="spanOrdGbNm"><%=loginMember.getAddress_2() %></span></li>
								        <li>주소 : <span id="spanOrdRoadAddr">[<%=loginMember.getZipcode() %>]&nbsp;<%=loginMember.getAddress_1() %>&nbsp;</span></li>
							        <li data-dlvr-msg="default">
										<input type="text" name="odrDeliveryMsg" placeholder="배송메시지를 입력해 주세요." title="배송 메시지를 입력해 주세요." class="inp-line" maxlength="50" style="display:none" onKeyDown="fnOnLimitInputValAtDtlAddr(this);" onKeyUp="fnOnLimitInputValAtDtlAddr(this);">
									</li>
							    	</ul>
							    	<span class="order-btn"><a href="index.jsp?workgroup=mypage&process=sujung">주문자 정보 변경</a></span>
							    <!-- e : 단일배송 정보 변경(신규 배송지) -->
								</div>
						<!-- e : 단일 배송 -->   
							</li>
	
						</ul> <!-- end order-info-box -->
					    	<ul class="info-ul">
				    			<li>고객센터<strong class="txt-small"> 1588-6084</strong>평일 09시 ~ 18시 / 토요일 09시 ~ 13시 (일요일, 공휴일은 운영하지 않습니다.)</li>
								<li>큐커 식품관 고객센터 <strong class="txt-small">1811-9228</strong> 평일 09시~ 18시(주말, 공휴일은 운영하지 않습니다.)</li>
					    	</ul>
					</div> <!-- end order-box -->
				<!-- e : 배송정보 -->	
				<!-- s : 결제 정보 -->
					<div class="payment-area">
						<h2>결제 정보</h2>
						
							<ul class="payment-listup">
					            <li>
					                <span class="head">상품 수</span>
					                <span class="text"><strong id="goods_cnt"><%=num %></strong>개</span>
					            </li>
					            <li>
					                <span class="head">주문 금액</span>
					                <span class="text"><strong id="order_payment_total_goods_amt_view"><%=order_money %></strong>원</span>
					            </li>
							</ul>
							<ul class="cost-listup">
					            <li>
					                <label for="cart_number">결제 카드 선택</label>
									<select name="cart_number1">
										<option value="우리은행" selected>&nbsp;우리은행&nbsp;</option>
										<option value="카카오뱅크">&nbsp;카카오뱅크&nbsp;</option>
										<option value="신한은행">&nbsp;신한은행&nbsp;</option>
										<option value="국민은행">&nbsp;국민은행&nbsp;</option>
										<option value="농협은행">&nbsp;농협은행&nbsp;</option>
									</select>
									
					            </li>
							</ul>
							<ul>
								<li>
									<input type="text" name="card_number2" id="card_number2" size="4" maxlength="4">
									- <input type="text" name="card_number3" id="card_number3" size="4" maxlength="4">
									- <input type="text" name="card_number4" id="card_number4" size="4" maxlength="4">
									- <input type="text" name="card_number5" id="card_number5" size="4" maxlength="4">
									<div id="cardMsg" class="error">카드번호를 입력해 주세요.</div>
									<div id="cardRegMsg" class="error">카드번호는 4 자리의 숫자로만 입력해 주세요.</div>
								</li>
							</ul>
							
							<ul class="cost-listup">
					            <li>
					                <span class="head"><strong>결제 예정 금액</strong></span>
					                <span class="text"><strong id="order_payment_total_pay_amt_view"><%=order_money %></strong>원</span>
					            </li>
							</ul>
							<div class="terms-box">
								<h2>
									약관 동의<i class="required-item">*</i>
								</h2>
								<div class="chk-form allChk-box">
									<label ><input type="checkbox" class="check">주문 상품정보 및 전자금융거래 이용약관에 모두 동의하십니까?</label>
								</div>
								<div class="chk-form">
									<label ><input type="checkbox" class="check">개인정보 수집&middot;이용 및 제3자 제공에 모두
											동의하십니까?</label>
								</div>
							</div>
						<button type="submit" class="btn btn-l btn-type3" id="orderPaymentBtn">
							<strong id="order_payment_total_pay_amt_final_view"><%=order_money %></strong><span>원 결제하기</span>
						</button>
					</div>
					<!-- e : 결제 정보 -->			
				</div><!-- end order-area -->
			</div><!-- end content order-content -->
		</form>
	</div><!-- container -->
</div>
</body>

