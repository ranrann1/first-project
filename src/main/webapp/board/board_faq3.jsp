<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	
a{
	text-decoration-line: none;
	color: black;
}	


div {
	display: block;
}



#sub_div>.inner {
	padding: 65px 0 85px;
}

.inner {
	width: 1200px;
	margin: 0 auto;
	position: relative;
}

.sub_tit_h3 {
	text-align: center;
	font-size: 30px;
	line-height: 1.1;
	font-family: "BR";
}



html, h1, h2, h3, h4, h5, h6, form, fieldset, img {
	margin: 0;
	padding: 0;
	border: 0;
}

h3 {
	display: block;
	font-size: 1.17em;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

.sub_cate {
	text-align: center;
	margin: 65px auto 50px;
	overflow: hidden;
	display: table;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.sub_cate li {
	display: inline-block;
	vertical-align: middle;
	width: 280px;
}

li {
	list-style: none;
}

ol, li, dl, dt, dd {
	margin: 0;
	padding: 0;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.sub_cate {
	text-align: center;
	margin: 65px auto 50px;
	overflow: hidden;
	display: table;
}

/* .sub_cate li.active a {
	font-weight: 600;
	color: #e80000;
} */

.sub_cate li a {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 18px;
	line-height: 1.2;
	font-weight: 400;
	color: #000;
	border-bottom: 4px solid #efefef;
	padding-bottom: 20px;
	position: relative;
	transition: all 0.2s;
}

.notice {
	margin-top: 60px;
}



p {
	margin: 0;
	padding: 0;
	word-break: break-all;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.notice {
	margin-top: 60px;
}

.n_title {
	font-size: 24px;
	margin-bottom: 15px;
}

.n_table table {
	width: 100%;
	border-spacing: 0;
	border-bottom: 1px solid #949494;
}

.n_table table th {
	height: 70px;
	text-align: center;
	font-size: 17px;
	border-top: 2px solid #1a1a1a;
	border-bottom: 1px solid #949494;
}

.n_table table td {
	height: 148px;
	font-size: 17px;
	border-bottom: 1px solid #dcdcdc;
}

.n_table table tr:last-child td {
	border-bottom: 0;
}

.n_table table td.td_num {
	width: 80px;
	text-align: center;
}

.n_table table td.td_thumb {
	width: 145px;
	padding: 13px 0;
	text-align: center;
}

.n_table table td.td_thumb img {
	width: 100%
}

.n_table table td.td_prod {
	width: 355px;
	text-align: left;
	padding-left: 30px;
}

.n_table table td.td_official {
	width: 240px;
	text-align: center;
}

.n_table table td.td_progress {
	width: 240px;
	text-align: center;
}

.n_table table td.td_pay {
	width: 140px;
	text-align: center;
}

.n_table table td .selected_color {
	display: inline-block;
	vertical-align: middle;
	width: 17px;
	height: 17px;
	border-radius: 100%;
	margin-left: 8px;
	border: 1px solid #dfdfdf;
}

.n_table table td.td_official a {
	display: inline-block;
	width: 155px;
	height: 36px;
	line-height: 34px;
	border: 1px solid #000;
	border-radius: 5px;
}

.n_table table td.td_official a.active {
	color: #E80000;
	border-color: #E80000;
}

.n_table table td.td_official a.deactive {
	color: #666;
	border-color: #666;
	pointer-events: none;
}

.n_table table td.td_progress span {
	display: inline-block;
	width: 90px;
	height: 36px;
	line-height: 36px;
	color: #fff;
	background: #000;
	border-radius: 5px;
}

.n_table table td.td_progress span.preparing {
	background: #999;
}

.n_table table td.td_progress span.complete {
	background: #33b06d;
}

.n_table table td.td_progress span.review_write {
	background: #E80000;
	cursor: pointer;
}
#bo_cate {margin:35px 0}
#bo_cate h2 {position:absolute;font-size:0;line-height:0;overflow:hidden}
#bo_cate ul {;zoom:1}
#bo_cate ul:after {display:block;visibility:hidden;clear:both;content:""}
#bo_cate li {display:inline-block;position:relative;}
#bo_cate li::after{content:'';display:block;width:1px;height:13px;background:#dcdcdc;position:absolute;top:50%;right:0;transform:translateY(-50%);}
#bo_cate li:last-child::after{display:none;}
#bo_cate a {display:block;padding:0 20px;font-size:18px;color:#666;}
#bo_cate a:focus, #bo_cate a:hover, #bo_cate a:active {text-decoration:none;background:#f3f3f3}
#bo_cate #bo_cate_on {z-index:2;color:#e80000;}

#faq_wrap {margin:10px 0 30px}
#faq_wrap h2 {position:absolute;font-size:0;line-height:0;overflow:hidden}
.faq_admin {text-align:right}
#faq_wrap ol {margin:0;padding:0;list-style:none}
#faq_wrap li{border:1px solid #d4d4d4;border-top:none;background:#fff;}
#faq_wrap li:first-child{border-top:1px solid #d4d4d4;}
#faq_wrap li h3{font-size:17px;line-height:1.8;font-weight:600;position:relative;}
#faq_wrap li h3 .arr{position:absolute;top:50%;right:24px;margin-top:-8px;transition:0.5s;}
#faq_wrap li h3 .arr.on{transform:rotate(180deg);}
#faq_wrap li h3 .tit_bg{display:inline-block;position:absolute;top:25px;left:28px;text-align:center;font-size:28px;line-height:1.1;font-weight:700;color:#000;}
#faq_wrap li h3 a {display:block;padding:25px;padding-left:94px;}
#faq_con .con_inner{display:none;border-top:1px solid #d4d4d4;padding:25px;padding-left:94px;font-size:15px;line-height:30px;position:relative;background: #f0f0f0;}
#faq_con .con_inner .tit_bg{display:inline-block;position:absolute;top:28px;left:28px;text-align:center;font-size:28px;line-height:1.1;font-weight:700;color:#e80000;}
#faq_con .con_inner .closer_btn{height:25px;font-size:13px;display:inline-block;padding:0 5px;border-radius:5px;background:#fff;cursor:pointer;}
#faq_con .con_closer{text-align:right;}

#faq_sch {text-align:center;border:1px solid #ccc;background:#fff;;padding:30px;margin:10px 0}
#faq_sch form{display:inline-block;position:relative}
#faq_sch .sch_tit{font-size:20px;font-weight:bold;display:inline-block;margin-right:10px;vertical-align:middle}
#faq_sch .frm_input{border-color:#646982;border-radius:0;width:300px}
#faq_sch .btn_submit{padding:0 10px;height:40px;color:#000;font-size:1.083em;font-weight:bold;color:#fff;background:#253dbe;}

</style>
<div id="sub_div">

	
	
	<div class="inner ">
		<div class="sub_top_wrap ">
			<h3 class="sub_tit_h3">FAQ</h3>			<p class="sub_desc_p ">			
				<ul class="sub_cate">
					<li class="active"><a href="index.jsp?workgroup=notice&process=notice_list">공지사항</a></li>
					<li class="active"><a href="index.jsp?workgroup=board&process=board_list">1:1문의</a></li>
					<li class="active"><a href="index.jsp?workgroup=board&process=board_question_list">자주묻는질문</a></li>

				</ul>

		</div>

<!-- FAQ 시작 { -->
<div id="faq_hhtml"></div>
<fieldset id="faq_sch" style="display:none">
    <legend>FAQ 검색</legend>

    <form name="faq_search_form" method="get">
    <span class="sch_tit">FAQ 검색</span>
    <input type="hidden" name="fm_id" value="3">
    <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
    <input type="text" name="stx" value="" required id="stx" class="frm_input " size="15" maxlength="15">
    <button type="submit" value="검색" class="btn_submit"><i class="fa fa-search" aria-hidden="true"></i> 검색</button>
    </form>
</fieldset>


<nav id="bo_cate">
    <h2>자주하시는질문 분류</h2>
    <ul id="bo_cate_ul">
                <li><a href="index.jsp?workgroup=board&process=board_question_list"  >신청·개통문의</a></li>
                <li><a href="index.jsp?workgroup=board&process=board_faq2"  >배송문의</a></li>
                <li><a href="index.jsp?workgroup=board&process=board_faq3"  id="bo_cate_on" ><span class="sound_only"></span>취소·교환·반품문의</a></li>
            </ul>
</nav>

<div id="faq_wrap" class="faq_3">
        <section id="faq_con">
        <h2>취소·교환·반품문의 목록</h2>
        <ol>
                        <li>
                <h3><span class="tit_bg font_mt">Q</span><a href="#none" onclick="return faq_open(this);"><p style="margin-left:0px;">배송 중에도 취소를 할 수가 있나요?</p></a></h3>
                <div class="con_inner">
                    <span class="tit_bg font_mt">A</span>
                    <p>네, 이지폰은 개통 전까지는 <span style="color:rgb(255,0,0);">고객의사를 무조건 반영</span>하여 </p><p><span style="color:rgb(255,0,0);">어떠한 사유로도 취소가 가능</span>합니다.</p><p><br /></p><p>다만, <span style="color:rgb(255,0,0);">선개통 시에는 </span><span style="color:rgb(255,0,0);">단순변심 등으로는 취소가 불가능</span>합니다.</p><p><br /></p><p><span style="color:rgb(102,102,102);font-family:'돋움', Dotum;font-size:9pt;letter-spacing:-1px;background-color:rgb(246,246,246);">[관련법] 이동통신서비스가 개통된 이후에는 전자상거래법 제17조 제2항 제2호, 제3호, 제5호에 따라 이동통신서비스에 관하여 청약을 철회할 수 없습니다. 휴대폰의 청약철회는 전자상거래법에 따르나, 개봉 등의 사정으로 인해 가치가 현저히 감소하거나 다시 판매하기 곤란한 경우에는 청약을 철회할 수 없습니다.<br /></span><br />"배송 중이며 수령 전인 상태"라면 <span style="color:rgb(255,0,0);">이지폰에 취소의사를 밝혀</span> 주신 후</p><p>택배사에 연락하여 <span style="color:rgb(255,0,0);">수취거부</span>를 할 수 있습니다.</p>                    
                </div>
            </li>
                        <li>
                <h3><span class="tit_bg font_mt">Q</span><a href="#none" onclick="return faq_open(this);"><p>배송이 완료 된 후에도 취소가 가능한가요?</p></a></h3>
                <div class="con_inner">
                    <span class="tit_bg font_mt">A</span>
                    <p>네,<span style="color:rgb(255,170,0);"> <b>당근폰</b></span>은 <span style="color:rgb(255,0,0);">개통 전과 수령하신 휴대폰이 <b>미개봉</b> 상태</span>라면</p><p>어떠한 경우에도 <span style="color:rgb(255,0,0);">고객님 의사를 무조건 반영하여 </span></p><p><span style="color:rgb(255,0,0);">취소가 가능합니다.<br /><br /><span style="color:rgb(0,0,0);">﻿이에 따라 고객님께서는 배송이 완료되어도 </span> </span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(255,0,0);">개통전까지는 무조건 배송 받은 휴대폰을</span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);"><span style="color:rgb(255,0,0);"><b>미개봉</b></span> 해주셔야합니다. </span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);"><br /></span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);">개통이 완료 된 상태라도 관련법에 의하여</span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);"><span style="color:rgb(255,0,0);">개통 취소 및 반품이 가능한 상황</span>이 있을 수 있습니다.</span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);"><br /></span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(255,0,0);">개통 완료 전 <b>개봉은 어떠한 사유로도 반품 및 취소 불가능</b>합니다.</span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);">개통 완료 전 개봉 후 개통자체를 희망하지 않으시는 경우</span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);"><br /></span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);">당근폰은 법적 조치를 통하여 고객님께 단말기를 이관하고</span></span></p><p><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);">단말기 출고가를 청구합니다.</span></span></p>                    
                </div>
            </li>
                        <li>
                <h3><span class="tit_bg font_mt">Q</span><a href="#none" onclick="return faq_open(this);"><p>개통 된 이후 취소가 가능한가요?</p></a></h3>
                <div class="con_inner">
                    <span class="tit_bg font_mt">A</span>
                    <p>개통 된 이후는 <span style="color:rgb(255,0,0);">단순변심 또는 고객 개인사정으로 취소가 불가능</span>합니다.<br /><br />사유 : 개통이 된 순간부터 개통을 취소하여도 첫 개통이 된 이력기준으로 as 기간이 시작됨으로<br />다른 고객들께서 as 기간에 피해가 생김.</p>                    
                </div>
            </li>
                        <li>
                <h3><span class="tit_bg font_mt">Q</span><a href="#none" onclick="return faq_open(this);"><p>기기 불량 시 교환이 가능한가요?</p></a></h3>
                <div class="con_inner">
                    <span class="tit_bg font_mt">A</span>
                    <p><span style="color:rgb(0,0,0);font-family:'돋움', Dotum;font-size:9pt;letter-spacing:-1px;background-color:rgb(255,255,255);"><span style="color:rgb(255,0,0);"><span style="color:rgb(0,0,0);"><span style="color:rgb(255,108,0);">﻿이지폰은 100% 미개봉/새제품</span>을 고객님께 보내드리고 있습니다.</span></span></span></p><p><span style="font-family:'돋움', Dotum;font-size:9pt;letter-spacing:-1px;background-color:rgb(255,255,255);">다만 제조사 자체 불량으로 인한 불량품이 간혹 고객님께 배송이 됩니다.</span></p><p><span style="font-family:'돋움', Dotum;font-size:9pt;letter-spacing:-1px;background-color:rgb(255,255,255);">이는 미개봉/새제품인 상태에서 이지폰에서 기기를 개봉하여 검수를 일일히</span></p><p><span style="font-family:'돋움', Dotum;font-size:9pt;letter-spacing:-1px;background-color:rgb(255,255,255);">할 수가 없음에 생기는 사고 입니다.<br /><br /><span style="color:rgb(255,0,0);">통화품질 및 휴대폰 결함 등 기능적 문제</span>가 있고 이를 <span style="color:rgb(255,0,0);">증명할 객관적인 자료</span>가 있다면<br />개통 후 1<span style="color:rgb(255,0,0);">4일 내에 휴대폰을 교환</span>받을 수 있습니다.<br /><br />객관적인 자료란 각 <span style="color:rgb(255,0,0);">휴대폰 제조사 서비스센터에 방문</span>하셔서</span></p><p><span style="color:rgb(0,0,0);font-family:'돋움', Dotum;font-size:9pt;letter-spacing:-1px;background-color:rgb(255,255,255);"><span style="color:rgb(255,0,0);">결함에 관련한 판정서</span>를 발급 받아 첨부해주시면</span></p><p><span style="color:rgb(0,0,0);font-family:'돋움', Dotum;font-size:9pt;letter-spacing:-1px;background-color:rgb(255,255,255);"><span style="color:rgb(255,108,0);">100% 새 기기로 교환</span> 해드립니다.<br /></span></p>                    
                </div>
            </li>
                    </ol>
    </section>
    </div>


<div id="faq_thtml"></div>

<!-- } FAQ 끝 -->


<script src="text/javascript"></script>
<script>
$(function() {
    $(".closer_btn").on("click", function() {
        $(this).closest(".con_inner").slideToggle();
    });
});

function faq_open(el)
{
    var $con = $(el).closest("li").find(".con_inner");

    if($con.is(":visible")) {
        $con.slideUp();
		$(el).siblings(".arr").removeClass("on");
    } else {
        $("#faq_con .con_inner:visible").css("display", "none");
		$(".arr").removeClass("on");

        $con.slideDown(
            function() {
                // 이미지 리사이즈
                $con.viewimageresize2();
            }
        );
				$(el).siblings(".arr").addClass("on");
    }

    return false;
}
</script>	</div>
</div>