<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko"><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CrudSystem</title>
<link rel="stylesheet" href="/css/common/pop_template.css" type="text/css">
<link rel="stylesheet" href="/css/popup/agr_easy.css" type="text/css">
<!-- 이메일 수신거부 신규 CSS 추가 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function emailrefusal(rcv_yn){
		if('Y' == rcv_yn){
			var custno = form1.custno.value;
			var emaillogid = form1.emaillogid.value;
			var param = {"custno":custno,"emaillogid":emaillogid};
		    $.ajax({
	            url: '/mail/deny',
		        type: 'POST',
		        data: param,
		        cache: false,
	            success: function(data) {
	            	debugger;
	            	if(data == "" || data == 0){
	            		 alert("이메일 수신거부 등록 중 오류가 발생했습니다.\n잠시후 다시 이용해 주세요.");
			        	 return;
			        }
					if(data == "SUCCESS") {
	                    alert("이메일 수신거부 등록이 완료되었습니다.");
			        }else if(data=="FAIL"){
			            alert("이메일 수신거부 등록 오류가 발생했습니다.\n잠시후 다시 이용해 주세요.");
			        }
				},
				error: function() {
					alert( '정보 연동 중 오류가 발생했습니다.\n잠시후 다시 이용해 주세요.' );
				}
			});
		}
	}
</script>
</head>

<body>
	<form name="form1">
	<input type="hidden" name="custno" value="${custno }">
	<input type="hidden" name="emaillogid" value="${emaillogid }">
		<div id="pop_bodyWrap" class="agr_easy_wrap">
			<div class="biwrap">
				<h1>
					<span>11번가</span>
				</h1>
			</div>
			<div id="popLayWrap">
				<div id="popHead">
					<div class="popHeadEnd">
						<h2>11번가 이메일 수신거부</h2>
					</div>
				</div>
				<div class="popbody_con">
					<!-- 팝업 내용입력부분 ============================= -->
					<!-- 수신거부 전 -->
					<div class="mail_agree_wrap">
						<div class="infotop_center borderboxtype1">
							<span>11번가 이메일을 <em class="bold">수신거부</em>하시겠습니까?
							</span>
						</div>
						<ul class="bul_squ_gray">
							<li>이메일을 수신거부하시면 CrudSystem의 정보를 받아보실 수
								없습니다.</li>
							<li>수신거부 후, 다시 메일을 수신하고 싶으실 때에는 11번가 사이트에 접속하여 로그인 후, <em>나의 11번가 &gt; 회원정보
									변경</em> 에서 이메일 수신여부를 [수신동의] 로 변경하여 주시기 바랍니다.
							</li>
						</ul>
						<div class="infotop_center borderboxtype0">
							<span><strong>이메일주소</strong> : agdwlsduf@naver.com</span>
						</div>
						<div class="btn_wrap">
							<a href="javascript:emailrefusal('Y');" class="defbtn_lar ladtype5"><span>예</span></a> 
							<a href="#" onclick="window.open('','_self').close();" class="defbtn_lar ladtype7"><span>아니오</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>