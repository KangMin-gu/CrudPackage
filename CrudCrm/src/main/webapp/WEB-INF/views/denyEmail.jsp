<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko"><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CrudSystem</title>
<link rel="stylesheet" href="/css/common/pop_template.css" type="text/css">
<link rel="stylesheet" href="/css/popup/agr_easy.css" type="text/css">
<!-- �̸��� ���Űź� �ű� CSS �߰� -->
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
	            		 alert("�̸��� ���Űź� ��� �� ������ �߻��߽��ϴ�.\n����� �ٽ� �̿��� �ּ���.");
			        	 return;
			        }
					if(data == "SUCCESS") {
	                    alert("�̸��� ���Űź� ����� �Ϸ�Ǿ����ϴ�.");
			        }else if(data=="FAIL"){
			            alert("�̸��� ���Űź� ��� ������ �߻��߽��ϴ�.\n����� �ٽ� �̿��� �ּ���.");
			        }
				},
				error: function() {
					alert( '���� ���� �� ������ �߻��߽��ϴ�.\n����� �ٽ� �̿��� �ּ���.' );
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
					<span>11����</span>
				</h1>
			</div>
			<div id="popLayWrap">
				<div id="popHead">
					<div class="popHeadEnd">
						<h2>11���� �̸��� ���Űź�</h2>
					</div>
				</div>
				<div class="popbody_con">
					<!-- �˾� �����Էºκ� ============================= -->
					<!-- ���Űź� �� -->
					<div class="mail_agree_wrap">
						<div class="infotop_center borderboxtype1">
							<span>11���� �̸����� <em class="bold">���Űź�</em>�Ͻðڽ��ϱ�?
							</span>
						</div>
						<ul class="bul_squ_gray">
							<li>�̸����� ���Űź��Ͻø� CrudSystem�� ������ �޾ƺ��� ��
								�����ϴ�.</li>
							<li>���Űź� ��, �ٽ� ������ �����ϰ� ������ ������ 11���� ����Ʈ�� �����Ͽ� �α��� ��, <em>���� 11���� &gt; ȸ������
									����</em> ���� �̸��� ���ſ��θ� [���ŵ���] �� �����Ͽ� �ֽñ� �ٶ��ϴ�.
							</li>
						</ul>
						<div class="infotop_center borderboxtype0">
							<span><strong>�̸����ּ�</strong> : agdwlsduf@naver.com</span>
						</div>
						<div class="btn_wrap">
							<a href="javascript:emailrefusal('Y');" class="defbtn_lar ladtype5"><span>��</span></a> 
							<a href="#" onclick="window.open('','_self').close();" class="defbtn_lar ladtype7"><span>�ƴϿ�</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>