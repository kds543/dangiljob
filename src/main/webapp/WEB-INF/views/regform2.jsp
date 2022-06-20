<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>회원가입 이용약관</title>
 
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
 
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
      <!-- Toastr style -->
 <link href="/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="/resources/css/animate.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/plugins/steps/jquery.steps.css" rel="stylesheet">
   <link href="/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
 <script src="/resources/js/kcommon.js?ver=1"></script>
 <link href="/resources/css/plugins/sweetalert/sweetalert.css?ver=1" rel="stylesheet">
                     <!-- Sweet alert -->
    <script src="/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
 
  <!-- Toastr -->
  
   <script src="/resources/js/jquery-3.1.1.min.js"></script>
   <script src="/resources/js/bootstrap.min.js"></script>
       <script src="/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/resources/js/plugins/toastr/toastr.min.js"></script>
      <script src="/resources/js/plugins/iCheck/icheck.min.js"></script>
      <script src="/resources/js/plugins/steps/jquery.steps.min.js"></script>
         <!-- Jquery Validate -->
    <script src="/resources/js/plugins/validate/jquery.validate.min.js"></script>
     <style>

        .wizard > .content {
      		  height : 800px !important;
      		  background : #fff;
      		  border : 2px solid #eee;
        }

    </style>
</head>

<body class="gray-bg" style="vertical-align: middle;margin: 0 auto;">
    <div class="loginColumns animated fadeInDown ibox-content" style="padding-top:0px;margin-top:62px;border-radius:20px">
    	<div class="row" id="l_top">
			<div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title" style="border:0px">
                        <h5>당일Job 회원가입</h5>
                    </div>
                    <div class="ibox-content" style="padding:0px">
                        <p>
                                                  회원가입을 진심으로 환영합니다.
                        </p>
                         <div class="rows">
                         	<input type="checkbox" id="check1">개인정보 이용에 동의 하시겠습니까?
                         </div>
                        <div class="rows">
                        	<div class="col-md-12" style='height:150px;width:100%;border:1px solid;margin:0px;border-radius: 10px;overflow: auto;'>
                        		<pre>
							      개인정보 취급 방침

배턴존(BATON ZONE)이 개발, 운영하는 '당일Job(당일Job, www.dangil1009.co.kr, 이하 회사)'는 웹(Web)과 앱(App)의 온라인 운영체제를 통해, 실시간 또는 특정 일시 간 근로요청하는 구인자 회원과 이에 대해 근로지원함으로써 근로를 수행하는 구직자 상호 간의 거래가 원활하도록, 제 3자로서 중개·매칭(Matching-연결)하는 서비스(이하 플랫폼-Platform)입니다.

회사는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 및 정부가 제정한 개인정보보호지침 등 정보통신서비스제공자가 준수하여야 할 관련 법령 상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자의 권익 보호에 최선을 다하고 있습니다. 개인정보 취급 방침은 다음과 같은 내용을 담고 있습니다.

1. 수집하는 개인정보의 항목 및 수집 방법
2. 개인정보의 보호 및 이용 방법
3. 개인정보의 공유 및 제공
4. 개인정보의 취급위탁
5. 개인정보의 보유 및 이용 기간
6. 개인정보 파기절차 및 이용 방법
7. 만 14세 미만 아동의 개인정보 보호
8. 이용자의 권리와 그 행사 방법
9. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항
10. 개인정보의 기술·관리적 보호 대책
11. 개인정보관리책임자 및 담당자의 연락처
12. 기타
13. 고지의 의무



제 1조 수집하는 개인정보의 항목 및 수집 방법

1. 수집하는 개인정보의 항목 및 이용 목적 각종 서비스의 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.
1) 성명, 업체·단체·기업명, 아이디, 비밀번호, 사진, 신분증 등
- 목적 : 회원제 서비스 제공 및 이용자 식별
2) 휴대폰 연락처, 이메일 주소, 사진, 경력, 성별, 주소, 국적 등
- 목적 : 배정 등록 요청과 고객 회원과의 실시간 중개를 지원
3) 이용요금 결제에 따른 계좌정보
4) SMS·푸시, 기타 공지 전송 여부 설정
- 목적 : 보다 시의적이고 원활한 정보서비스 제공
5) 서비스 제공에 관한 계약 이행 및 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
- 이용자의 브라우저 종류 및 운영체제(OS), 검색어, 서비스 이용기록: 서비스 이용에 대한 통계 분석
- 인터넷 프로토콜(IP) 주소, 방문 일시, 서비스 이용 기록, 부정·불량 이용 기록, 쿠키(불법·부정 이용 방지)
6) 회사는 서비스 제공에 필요한 최소한의 개인정보만 수집하며, 이용자의 기본적 인권을 침해할 우려가 있는 민감한 정보(인종, 종교, 사상, 출신지, 본적지, 정치적 성향 및 범죄기록, 건강상태 등)는 수집하지 않습니다. 다만, 이용자가 수집에 동의하는 경우는 예외로 합니다.
2. 개인정보 수집 방법 회사는 다음과 같은 적법하고 공정한 방법으로 개인정보를 수집합니다.
1) 회사의 웹 및 모바일 앱 플랫폼 서비스 상에서 구인자 및 구직자 회원이 작성한 가입정보 및 구인·구직정보 등을 통한 확보
2) 구인요청 및 구직지원 회원으로부터 제공된 정보
3) 정보수집 툴을 통한 확보

제 2조 개인정보의 보호 및 이용 방법

회사는 회원의 개인정보를 위 1조에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
1. 회원이 사전 공개에 동의하였거나 서비스 제공 관련 계약 이행을 위하여 필요한 개인정보로 통상의 동의를 받기가 경제·기술적 또는 기타 사유로 현저히 곤란한 경우
2. 기타 관련법에 의해 요구된다고 선의로 판단되는 경우(관련 법령에 의거, 적법한 절차에 의한 정부·수사기관 등의 요청이 있는 경우)
3. 회사는 사업의 전부 또는 일부 양도, 인수합병 등으로 서비스 제공자의 권리와 의무를 이전 또는 승계하는 경우에는 회원을 대상으로 그 사실을 사전에 고지하고, 개인정보 수집·이용 등에 대한 동의나 철회의 선택권을 부여합니다.
4. 회원은 스스로 플랫폼 상의 게시판이나 문의하기 등을 통해 기재한 예민한 인적 사항 등과 관련하여 본인의 주의가 필요하며, 이와 관련하여 회사는 어떠한 책임도 지지 않습니다.

제 3조 개인정보의 취급 위탁

회사는 서비스 향상을 위해서 필요한 경우 및 기타 서비스 제공을 위해서 회원의 개인정보를 외부에 수집·보관·처리·이용·제공·관리·파기 등을 할 수 있도록 아래와 같이 업무를 위탁하여 운영하고 있습니다. 회사는 위탁계약 등을 통하여 서비스 제공자의 개인정보보호 관련 지시 엄수, 개인정보에 관한 비밀유지, 제 3자 제공의 금지 및 사고 시의 책임부담 등을 명확히 규정하고 당해 계약 내용을 서면 또는 전자적으로 보관하여 이용자의 권익을 보호하고 있습니다.

제 4조 개인정보의 보유 및 이용 기간

회사는 회원이 서비스를 이용하는 동안 개인정보를 보유 및 이용하며, 회원이 탈퇴를 요청한 경우나 개인정보의 수집 및 이용목적을 달성하거나 보유 및 이용기간이 종료된 경우 또는 사업폐지 등의 사유가 발생한 경우 해당 정보를 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
1. 회사 내부 방침에 의한 정보 보유 사유
1) 부정 이용 기록
2) 보존 이유: 부정 이용 방지
3) 보존 기간: 1년
2. 관련 법령에 의한 정보 보유 사유
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계 법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
1) 계약 또는 청약철회 등에 관한 기록
보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간: 5년
2) 대금결제 및 재화 등의 공급에 관한 기록
보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률 기간: 5년
3) 소비자의 불만 또는 분쟁처리에 관한 기록
보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간: 3년
4) 본인확인에 관한 기록
보존 이유: 정보통신 이용촉진 및 정보보호 등에 관한 법률
보존 기간: 6개월
5) 방문에 관한 기록
보존이유: 통신 비밀 보호법
보존 기간: 3년

제 5조 개인정보 파기절차 및 방법

회사는 다른 법률에 따라 개인정보를 보존하여야 하는 경우가 아닌 한, 수집한 이용자의 개인정보의 수집 및 이용목적이 달성되거나, 이용자가 회원탈퇴를 요청한 경우 지체 없이 파기하여 향후 어떠한 용도로도 열람 또는 이용할 수 없도록 처리합니다. 단, 제 4조 개인정보의 보유 및 이용기간 1항, 2항과 같은 예외 경우를 두고 있습니다. 회사의 개인정보 파기절차 및 방법은 다음과 같습니다.
1. 파기절차 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 데이터베이스로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보 보호 사유에 따라(제 4조 개인정보 보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다. 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.
2. 파기방법 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하며, 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

제 6조 회원의 권리와 그 행사 방법

1. 회원은 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 ‘탈퇴(가입해지 또는 동의철회)’를 요청할 수도 있습니다.
2. 회사는 회원이 개인정보 조회, 수정을 위해서 '계정관리(또는 '상세프로필관리')‘ 등을 이용할 수 있도록 제공합니다.
1) 회원은 가입해지를 위해 회사의 플랫폼 상에서 요구하는 ‘탈퇴’과정을 거쳐 요청하며 이 경우 회사는 본인 확인 절차 등을 거친 후 신속히 조치합니다.
2) 개인정보관리책임자에게 위 사항의 내용을 서면 또는 이메일로 연락, 탈퇴를 요청할 수도 있습니다.
3) 회사는 회원이 개인정보의 오류에 대한 정정을 요청한 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제 3자에게 이미 제공한 경우에는 정정 처리결과를 제 3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.
4) 회사는 회원 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보를 제 4조 개인정보의 보유 및 이용기간에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

제 7조 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항

회사는 회원들에게 특화된 맞춤서비스를 제공하기 위해서 이용자들의 정보를 저장하고 수시로 불러오는 '쿠키(Cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는 데 이용되는 서버(HTTP)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 사용자들의 PC 컴퓨터 내의 하드디스크에 저장되기도 합니다.
1. 쿠키의 사용 목적 회원들이 방문한 회사의 각 서비스와 웹 사이트들에 대한 로그인 여부 등을 파악하여 이용자에게 최적화된 정보 제공을 위하여 사용합니다.
2. 쿠키의 설치·운영 및 거부 회사는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때 마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 쿠키 설정을 거부하는 방법으로 회원은 본인이 사용하는 웹브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나 모든 쿠키의 저장을 거부할 수 있습니다.
* 설정방법 (인터넷 익스플로어의 경우) : 웹브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 회사의 일부 서비스는 이용에 어려움이 있을 수 있습니다.

제 8조 개인정보의 기술·관리적 보호 대책

회사는 회원들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술·관리적 대책을 강구하고 있습니다.
1. 개인정보 암호화 회사는 회원의 주요 개인정보를 암호화하여 저장하고 있으며, 파일 및 전송데이터를 암호화하여 혹시 발생할 수 있는 사고 시라도 회원의 개인정보가 유출되지 않도록 관리하고 있습니다.
2. 해킹 등에 대비한 대책 회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있으며, 암호화 통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 24시간 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.
3. 취급 직원의 최소화 및 교육 회사는 회원의 개인정보관련 취급을 담당자에 한정시키고 있고 이를 위해 담당자에게 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 개인정보취급방침의 준수를 항상 강조하고 있습니다. 또한 담당 임직원의 경우 회원의 개인정보를 취급하기 이전에 보안서약서를 통하여 회원의 개인정보에 대한 정보유출을 사전에 방지하고, 관련 사태규정을 마련하여 이에 대한 이행사항 및 준수 여부를 감시하기 위한 내부절차를 마련하고 있습니다.
4. 개인정보보호 전담기구의 운영 회사는 사내 개인정보보호 전담팀을 통하여 개인정보취급방침의 이행사항 및 담당자의 준수 여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다. 하지만 근본적으로 개인정보의 보안관리에는 이용자 본인의 노력도 중요합니다. 온라인 서비스는 오직 아이디와 비밀번호를 알고 있는 본인에게만 개인정보에 접근할 수 있는 권한이 있으며, 비밀번호를 유지하고 관리할 책임 역시도 본인에게 있습니다. 회원은 반드시 본인만이 알 수 있는 내용으로 비밀번호를 구성해야 하며, 주민번호의 일부 또는 전화번호 등 타인이 쉽게 도용할 수 있는 비밀번호의 사용을 지양해야 합니다. 또한 공동으로 사용하는 컴퓨터에서 회사의 서비스에 접속하여 로그인한 상태에서 다른 사이트로 이동할 경우, 혹은 서비스 이용을 종료하였을 경우에는 반드시 해당 브라우저를 종료하시기 바랍니다. 그렇지 않을 경우, 해당 브라우저를 통해 아이디, 비밀번호, 주민등록번호가 포함된 회원의 개인정보가 타인에게 손쉽게 유출될 위험이 있습니다. 회원이 본인의 부주의나 인터넷상의 문제로 아이디, 비밀번호, 주민등록번호 등 개인정보가 유출되어 발생한 문제에 대해 회사는 일체의 책임을 지지 않습니다.

제 9조 개인정보 관리 책임자 및 담당자의 연락처

회사는 개인정보에 대한 의견수렴 및 불만처리를 담당하는 개인정보 관리책임자 및 담당자를 지정하고 있고, 연락처는 아래와 같습니다.
개인정보 관리책임자 : 당일Job 대표
담당자 : 개인정보보호팀장
소속: 개인정보보호팀
전화 : 02)1566-4391
E¬MAIL: bosssamson@naver.com
회원 여러분은 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다.
회사는 회원의 신고사항에 대해 신속하고 충분한 답변을 드릴 것입니다.
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
- 개인정보 보호 종합지원 포털(안전행정부 운영)
www.privacy.go.kr / 02-2100-3343
-개인정보 침해신고센터 (한국인터넷진흥원 운영)
privacy.kisa.or.kr / (국번 없이) 118
- 개인정보보호지원센터 (한국정보화진흥원)
privacy.nia.or.kr / 02-2131-0111

제 10조 기타


회사가 운영하는 플랫폼에 링크되어 있는 사이트나 제휴된 개인, 업체·단체·기관들이 개인정보를 수집하는 행위에 대해서는 본 ‘개인정보취급방침’이 적용되지 않음을 알려 드립니다.

제 11조 고지의 의무


회사는 본 개인정보취급방침의 내용 추가, 삭제 및 수정이 있을 시 개정 전, 최소 7일 전부터 변경이유 및 내용을 '공지사항'을 통해 고지할 것입니다.
회원 여러분께서는 본 개인정보취급방침의 내용은 수시로 변경될 수 있으므로 사이트를 방문하실 때마다, 이를 확인하시기 바랍니다.
- 개인정보 취급 방침 버전 번호: Ver. 1.0
- 공고 일자: 2021년 06월 15일
- 시행 일자: 2021년 06월 15일
</pre>
							 </div>
                        </div>
                        <div class="rows">
                        	<h2>회원가입</h2>
                        </div>
                        <div class="col-md-12" style='border-color:lightgray;height:120px;width:100%;border:1px solid;margin:0px;border-radius: 10px;margin-bottom:10px'>
                        	<div class="rows"><h5>구직회원</h5></div>
                        	<div class="rows" style="font-size:11px">당일Job을 통해 인력모집정보를 취득하려는 회원</div>
                        	<div class="rows"><a class="btn btn-primary" href="javascript:gotopage('/regformType2')" style="width:100%">구직회원 가입</a> </div>
                        </div>
                         <div class="col-md-12" style='border-color:lightgray;height:120px;width:100%;border:1px solid;margin:0px;border-radius: 10px'>
                        	<div class="rows"><h5>구인회원</h5></div>
                        	<div class="rows" style="font-size:11px">당일Job을 통해 인력을 모집하려는 회원</div>
                        	<div class="rows"><a class="btn btn-primary" href="javascript:gotopage('/regformType1')" style="width:100%">구인회원 가입</a> </div>
                        </div>
                        
                    </div>
                </div>
            </div>
                </div>
                
    	
    </div>

</body>
<script type="text/javascript">
	function gotopage(url){
		if($("#check1").is(":checked")){
			location.href = url;
		}else{
			Kalert("개인정보동의를 하셔야 회원가입을 하실수 있습니다.");
			return;
		}
	}
</script>

</html>