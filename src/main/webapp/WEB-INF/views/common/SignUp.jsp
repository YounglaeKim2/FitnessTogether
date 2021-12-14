<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
 <jsp:include page="/WEB-INF/views/template/Top.jsp"/> 

<!-- Top 끝 -->

<!doctype html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover"/>
    <meta name="naver-site-verification" content="907a7f8c9a61df897ccf0f03a835f6d2668945b1"/>
    <meta property="fb:admins" content="100006457426639"/>
    <meta name="google-site-verification" content="d-veBobRNo_in0thN3uOOoIcUWMUOjQZeMidTyItfGk"/>
    <meta name="google-site-verification" content="AZK3GfRwg4q_EH-0OSbbkCurocEY7okWrPZF93COxYU"/>
    <meta property="fb:app_id" content="185853321610795"/>
    <title>예쁜템들 모여사는 오늘의집</title>
    <meta name="description" content="2000만이 선택한 No.1 인테리어 필수앱. 집들이 구경부터 제품 정보 확인, 구매까지 한 번에!">
    
    <link rel="alternate" href="android-app://net.bucketplace/http/ohou.se/deep"/>
    <link rel="apple-touch-icon" sizes="57x57" href="https://assets.ohou.se/web/assets/bookmark_icon/favicon_57x57.png"/>
    <link rel="apple-touch-icon" sizes="72x72" href="https://assets.ohou.se/web/assets/bookmark_icon/favicon_72x72.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="https://assets.ohou.se/web/assets/bookmark_icon/favicon_114x114.png"/>
    <link rel="apple-touch-icon" sizes="144x144" href="https://assets.ohou.se/web/assets/bookmark_icon/favicon_144x144.png"/>
    <link rel="shortcut icon" href="https://assets.ohou.se/web/assets/bookmark_icon/favicon_144x144.png"/>
    <link href="https://assets.ohou.se/web/assets/favicon.png" rel="shortcut icon"/>
    
    <meta name="csrf-param" content="authenticity_token"/>
    <meta name="csrf-token" content="Vn8Zn/2Tgcv16SrpXwGG2FIdzCfry/qO7Hzub3nFnkZqdDjU6jJBFgoGGa4EP68uO1yYG7J3gZq6liCVIq1J+w=="/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/preamble-97ede701.chunk.css"><link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/54-f1b6e004.chunk.css"><link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/templates-User-SignUp-UserSignUp-85d49846.chunk.css"><link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/21-0e75de9b.chunk.css"><link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/23-2ef16b9a.chunk.css"><link rel="stylesheet" href="https://assets.ohou.se/web/dist/css/App-6e6c2f0c.chunk.css">
    
  
  <script>
    dataLayer = [{
      
    }];
    (function (w, d, s, l, i) {
      w[l] = w[l] || [];
      w[l].push({
        'gtm.start': new Date().getTime(), event: 'gtm.js'
      });
      var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
      j.async = true;
      j.src =
        'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
      f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-MK8DN2Q');
  </script>

  
  <script>
    !function (f, b, e, v, n, t, s) {
      if (f.fbq) return;
      n = f.fbq = function () {
        n.callMethod ?
          n.callMethod.apply(n, arguments) : n.queue.push(arguments);
      };
      if (!f._fbq) f._fbq = n;
      n.push = n;
      n.loaded = !0;
      n.version = '2.0';
      n.queue = [];
      t = b.createElement(e);
      t.async = !0;
      t.src = v;
      s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t, s);
    }(window,
      document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');

    fbq('set', 'autoConfig', 'false', '937204509645248');
    fbq('init', '937204509645248');
    fbq('track', 'PageView');
  </script>
  <noscript><img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=937204509645248&ev=PageView&noscript=1"
    /></noscript>
  

  
  <script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
  <script type="text/javascript">
    (function () {
      var ua = navigator.userAgent.toLowerCase();
      var mobile = {
        isAndroid: ua.indexOf('android') > -1,
        isIos: ua.match(/(ipad|iphone|ipod)/g)
      };

      var type = '';
      if (mobile.isAndroid || mobile.isIos) {
        type = 'm';
      } else {
        type = 'd';
      }

      window.criteo_q = window.criteo_q || [];

      window.criteo_q.push(
        { event: 'setAccount', account: 50838 },
        {
          event: 'setEmail',
          email: ""
        },
        { event: 'setSiteType', type: type }
      );
    })();
  </script>
  

  
  <script>
    window.bucketLog = window.bucketLog || [];
    
  </script>

  
  <script type="text/javascript">
    (function(e,t){var n=e.amplitude||{_q:[],_iq:{}};
    ;function s(e,t){e.prototype[t]=function(){
    this._q.push([t].concat(Array.prototype.slice.call(arguments,0)));return this}}
    var o=function(){this._q=[];return this}
    ;var a=["add","append","clearAll","prepend","set","setOnce","unset"]
    ;for(var c=0;c<a.length;c++){s(o,a[c])}n.Identify=o;var u=function(){this._q=[]
    ;return this}
    ;var l=["setProductId","setQuantity","setPrice","setRevenueType","setEventProperties"]
    ;for(var p=0;p<l.length;p++){s(u,l[p])}n.Revenue=u
    ;var d=["init","logEvent","logRevenue","setUserId","setUserProperties","setOptOut","setVersionName","setDomain","setDeviceId","enableTracking","setGlobalUserProperties","identify","clearUserProperties","setGroup","logRevenueV2","regenerateDeviceId","groupIdentify","onInit","logEventWithTimestamp","logEventWithGroups","setSessionId","resetSessionId"]
    ;function v(e){function t(t){e[t]=function(){
    e._q.push([t].concat(Array.prototype.slice.call(arguments,0)))}}
    for(var n=0;n<d.length;n++){t(d[n])}}v(n);n.getInstance=function(e){
    e=(!e||e.length===0?"$default_instance":e).toLowerCase()
    ;if(!n._iq.hasOwnProperty(e)){n._iq[e]={_q:[]};v(n._iq[e])}return n._iq[e]}
    ;e.amplitude=n})(window,document);
    window.amplitude.getInstance()
      .init('dc73f13a3e81af36c9f61718642148af', null, function () {
        window.amplitude.getInstance().setUserProperties({
          'State of 로그인': false,
          
          'Account Group': null,
          
        });
      });
  </script>
  

  <!-- adinsight 공통스크립트 start -->
  <script type="text/javascript">
    var TRS_AIDX = /iPhone|iPad|iPod|Android/.test(navigator.userAgent) ? 11603 : 11598;
  </script>
  <script type="text/javascript" src="https://analysis.adinsight.co.kr/emnet/trs_esc.js" defer></script>
  <!-- adinsight 공통스크립트 end -->

  <!-- Sentry Testing -->
  <script src="https://cdn.ravenjs.com/3.26.4/raven.min.js" crossorigin="anonymous"></script>
  <script>
    
    Raven.config('https://b8e5cc27b3eb44be8b976b0c81dd4115@sentry.io/271486').install();
    
    Raven.setUserContext({});
    
  </script>

  <script type="application/ld+json">
  {
   "@context": "http://schema.org",
   "@type": "Organization",
   "name": "오늘의집",
   "url": "https://ohou.se",
   "sameAs": [
     "https://www.instagram.com/todayhouse/?hl=ko",
     "https://www.facebook.com/interiortoday",
     "https://m.post.naver.com/my.nhn?memberNo=202156",
     "https://itunes.apple.com/kr/app/id1008236892",
     "https://play.google.com/store/apps/details?id=net.bucketplace&hl=ko",
     "https://www.youtube.com/channel/UCBKtitA1RwY7F32rCniV1dA/featured"
   ]
  }
  </script>


    <!--[if lte IE 9]>
    <script>
      alert("본 서비스는 Microsoft Explorer 11 이하는 지원하지 않습니다. 브라우저를 업그레이드하고 사용하시거나 앱을 다운받아 사용하실 수 있습니다. 확인을 누르면 앱 다운로드 링크로 연결됩니다.");
      window.location.href = "https://play.google.com/store/apps/details?id=net.bucketplace&hl=kor";
    </script>
    <![endif]-->
  </head>
  <body>
    
    <noscript>
     	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MK8DN2Q" height="0" width="0" style="display:none;visibility:hidden" allowfullscreen></iframe>
    </noscript>

    <style data-emotion="css i18bs4-SignUp">
    .css-i18bs4-SignUp{width:100%;margin:0 auto;padding:60px 0;}
    @media (min-width: 768px){.css-i18bs4-SignUp{width:360px;}}</style>
    <div class="css-i18bs4-SignUp e1y3odo23">
    	<style data-emotion="css 176q9ql-SignUpTitle">
    	.css-176q9ql-SignUpTitle{font-size:20px;font-weight:bold;}</style>
    	<h1 class="css-176q9ql-SignUpTitle e1y3odo24">회원가입</h1>
    	<style data-emotion="css eeu40q-SNSWrapper">
    	.css-eeu40q-SNSWrapper{margin:30px 0;padding-bottom:30px;border-bottom:1px solid #ededed;}</style>
    <div class="css-eeu40q-SNSWrapper e111gxds3">
    	<style data-emotion="css 39adf6-SNSLoginTitle">
    	.css-39adf6-SNSLoginTitle{font-size:12px;text-align:center;margin:15px 0;color:#757575;}</style>
    <div class="css-39adf6-SNSLoginTitle e111gxds2">SNS계정으로 간편하게 회원가입</div>
    	<style data-emotion="css 1k406r0-SNSList">
    	.css-1k406r0-SNSList{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;}</style>
    	<ul class="css-1k406r0-SNSList e111gxds1">
    	<style data-emotion="css 1balhvh-SNSItem">.css-1balhvh-SNSItem{margin:0 10px;}</style>
    	<li class="css-1balhvh-SNSItem e111gxds0">
    		<a href="/users/auth/facebook">
    			<svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
    				<g fill="none" fill-rule="evenodd">
    					<path fill="#3B5998" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
   		 				<path fill="#FFF" d="M25.77 35V24h3.384v-3.385h-3.385v-2.538c-.012-.756.08-1.285 1.693-1.692h1.692V13h-3.385c-3.25 0-4.52 1.84-4.23 5.077v2.538H19V24h2.538v11h4.231z"></path>
   					</g>
   				</svg>
   			</a>
   		</li>
    	<li class="css-1balhvh-SNSItem e111gxds0">
   		 <a href="/users/auth/kakao">
    		<svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
    			<g fill="none" fill-rule="evenodd">
    				<path fill="#FFEB00" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
    				<path fill="#3C2929" d="M24 11.277c8.284 0 15 5.306 15 11.85 0 6.545-6.716 11.85-15 11.85-.92 0-1.822-.066-2.697-.191l-6.081 4.105a.43.43 0 0 1-.674-.476l1.414-5.282C11.777 31.031 9 27.335 9 23.127c0-6.544 6.716-11.85 15-11.85zm6.22 8.407c-.416 0-.718.297-.718.707v5.939c0 .41.289.686.718.686.41 0 .718-.295.718-.686v-1.932l.515-.526 1.885 2.57c.277.374.426.54.691.568.037.003.075.005.112.005.154 0 .66-.04.716-.563.038-.293-.137-.52-.348-.796l-2.043-2.675 1.727-1.743.176-.196c.234-.26.353-.39.353-.587.009-.422-.34-.652-.687-.661-.274 0-.457.15-.57.262l-2.528 2.634v-2.3c0-.422-.288-.706-.717-.706zm-9.364 0c-.56 0-.918.432-1.067.837l-2.083 5.517a.84.84 0 0 0-.065.315c0 .372.31.663.706.663.359 0 .578-.162.69-.51l.321-.97h2.999l.313.982c.111.335.34.498.7.498.367 0 .655-.273.655-.62 0-.056-.017-.196-.081-.369l-2.019-5.508c-.187-.53-.577-.835-1.069-.835zm-2.92.064h-4.452c-.417 0-.642.337-.642.654 0 .3.168.652.642.652h1.51v5.21c0 .464.274.752.716.752.443 0 .718-.288.718-.751v-5.21h1.508c.474 0 .643-.352.643-.653 0-.317-.225-.654-.643-.654zm7.554-.064c-.442 0-.717.287-.717.75v5.707c0 .497.28.794.75.794h2.674c.434 0 .677-.321.686-.627a.642.642 0 0 0-.17-.479c-.122-.13-.3-.2-.516-.2h-1.99v-5.195c0-.463-.274-.75-.717-.75zm-4.628 1.306l.008.01 1.083 3.265h-2.192L20.842 21a.015.015 0 0 1 .028 0z"></path></g></svg></a></li><li class="css-1balhvh-SNSItem e111gxds0">
    	<a href="/users/auth/naver">
    		<svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
    			<g fill="none" fill-rule="evenodd">
    				<path fill="#00C63B" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
    				<path fill="#FFF" d="M21 25.231V34h-7V15h7l6 8.769V15h7v19h-7l-6-8.769z"></path></g></svg></a></li></ul></div>
    <form>
    	<style data-emotion="css g2rihj-FieldWrapperContainer">.css-g2rihj-FieldWrapperContainer{margin-bottom:30px;}</style>
    		<div class="css-g2rihj-FieldWrapperContainer euhjq6q3">
   				 <style data-emotion="css 19szivi-Label">.css-19szivi-Label{display:block;margin:0 0 12px;font-size:15px;font-weight:bold;color:#292929;line-height:21px;word-break:keep-all;}</style>
    				<label class="css-19szivi-Label euhjq6q2">이메일</label>
   				 <style data-emotion="css mdp60j-EmailFieldInputWrapper">.css-mdp60j-EmailFieldInputWrapper .form-control{font-size:15px;}</style>
    <div class="css-mdp60j-EmailFieldInputWrapper egia2mk0">
    	<div class="input-group email-input">
    		<span class="email-input__local">
    			<input class="form-control" value="" placeholder="이메일" size="1"/>
    		</span>
    		<span class="email-input__separator">@</span>
    		<span class="email-input__domain">
			    <select class="form-control empty">
			    	<option selected="" value="" disabled="">선택해주세요</option>
				    <option value="naver.com">naver.com</option>
				    <option value="hanmail.net">hanmail.net</option>
				    <option value="daum.net">daum.net</option>
				    <option value="gmail.com">gmail.com</option>
				    <option value="nate.com">nate.com</option>
				    <option value="hotmail.com">hotmail.com</option>
				    <option value="outlook.com">outlook.com</option>
				    <option value="icloud.com">icloud.com</option>
				    <option value="_manual">직접입력</option>
				</select>
		    <button class="email-input__domain__expand" aria-label="초기화" type="button" tabindex="-1">
		   		 <svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
		    		<path fill-rule="evenodd" d="M0 3l5 5 5-5z">
		    		</path>
		    	</svg>
		    </button>
		    </span>
		 </div>
		</div>
	</div>
	<div class="css-g2rihj-FieldWrapperContainer euhjq6q3">
    	<label class="css-19szivi-Label euhjq6q2">아이디</label>
    		<input class="_3ASDR _1qwAY" value="" field="[object Object]" name="id" placeholder="아이디"/>
    </div>
    <div class="css-g2rihj-FieldWrapperContainer euhjq6q3">
    	<label class="css-19szivi-Label euhjq6q2">비밀번호</label>
  		  <style data-emotion="css 1mh39t-Description">
  		  .css-1mh39t-Description{margin-bottom:10px;font-size:13px;color:#757575;line-height:1.4;}
  		  </style>
    <div class="css-1mh39t-Description euhjq6q1">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
   		 <input type="password" class="_3ASDR _1qwAY" value="" field="[object Object]" name="password" placeholder="비밀번호"/>
   	</div>
    <div class="css-g2rihj-FieldWrapperContainer euhjq6q3">
    	<label class="css-19szivi-Label euhjq6q2">비밀번호 확인</label>
    	<input type="password" class="_3ASDR _1qwAY" value="" field="[object Object]" name="confirmPassword" placeholder="비밀번호 확인"/>
    </div>
    <div class="css-g2rihj-FieldWrapperContainer euhjq6q3">
    	<label class="css-19szivi-Label euhjq6q2">닉네임</label>
    	<div class="css-1mh39t-Description euhjq6q1">다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</div>
    		<input class="_3ASDR _1qwAY" value="" field="[object Object]" name="nickname" placeholder="별명 (2~15자)"/>
    </div>
    <div class="css-g2rihj-FieldWrapperContainer euhjq6q3">
    	<label class="css-19szivi-Label euhjq6q2">약관동의</label>
    		<style data-emotion="css z39kfu-TermsFieldContainer">
    		.css-z39kfu-TermsFieldContainer{border:solid 1px #dbdbdb;padding:0 23px 6px 16px;}
    		</style>
    <div class="css-z39kfu-TermsFieldContainer e1hy3kq6">
    <style data-emotion="css 186oy8k-TermsAgreeAll">
    .css-186oy8k-TermsAgreeAll{border-bottom:1px solid #ededed;height:70px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;algin-items:center;}
    </style>
    <div class="css-186oy8k-TermsAgreeAll e1hy3kq5">
	    <label class="_3xqzr _4VN_z"><div class="_3zqA8">
	    	<input type="checkbox" class="_3UImz" name="agreeAll"/>
	   		 <span class="_2mDYR">
	   			 <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
	    			<path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
	    	<span class="_1aN3J">
	    <style data-emotion="css sgje51-TermText-TermsBoldText">
	    .css-sgje51-TermText-TermsBoldText{font-size:14px;color:#424242;line-height:18px;font-weight:bold;}
	    </style>
    <div class="css-sgje51-TermText-TermsBoldText e1hy3kq3">전체동의</div>
    		</span>
    	</label>
    </div>
    <label class="_3xqzr _4VN_z">
    <div class="_3zqA8">
    <input type="checkbox" class="_3UImz" name="agree1"/>
    <span class="_2mDYR">
    <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
    <path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div><span class="_1aN3J"><style data-emotion="css 6shc5k-TermText">.css-6shc5k-TermText{font-size:14px;color:#424242;line-height:18px;}</style>
    <div class="css-6shc5k-TermText e1hy3kq4">만 14세 이상입니다.<style data-emotion="css jek1hu-Require">.css-jek1hu-Require{color:#35c5f0;font-size:12px;margin-left:4px;}</style><span class="css-jek1hu-Require e1hy3kq2">(필수)</span></div></span></label><label class="_3xqzr _4VN_z">
    <div class="_3zqA8"><input type="checkbox" class="_3UImz" name="agree2"/>
    <span class="_2mDYR">
    <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
    <path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div><span class="_1aN3J"><div class="css-6shc5k-TermText e1hy3kq4"><style data-emotion="css 1l9bn-UnderlinkLink">.css-1l9bn-UnderlinkLink{-webkit-text-decoration:underline;text-decoration:underline;}</style>
    <a target="_blank" class="css-1l9bn-UnderlinkLink e1hy3kq0" href="/usepolicy">이용약관</a>
    <span class="css-jek1hu-Require e1hy3kq2">(필수)</span></div></span></label>
    <label class="_3xqzr _4VN_z"><div class="_3zqA8">
    <input type="checkbox" class="_3UImz" name="agree3"/>
    <span class="_2mDYR">
    <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
    <path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div><span class="_1aN3J"><div class="css-6shc5k-TermText e1hy3kq4"><a target="_blank" class="css-1l9bn-UnderlinkLink e1hy3kq0" href="/privacy?type=register">개인정보수집 및 이용동의</a><span class="css-jek1hu-Require e1hy3kq2">(필수)</span></div></span></label><label class="_3xqzr _4VN_z">
    <div class="_3zqA8"><input type="checkbox" class="_3UImz" name="agreePromotion"/>
    <span class="_2mDYR">
    <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
    <path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div><span class="_1aN3J"><div class="css-6shc5k-TermText e1hy3kq4">이벤트, 프로모션 알림 메일 및 SMS 수신<style data-emotion="css 1m03qc5-Option">.css-1m03qc5-Option{color:#bdbdbd;font-size:12px;margin-left:4px;}</style><span class="css-1m03qc5-Option e1hy3kq1">(선택)</span></div></span></label></div></div>
    <style data-emotion="css 1c1st7f-ButtonWrapper">.css-1c1st7f-ButtonWrapper{width:100%;}</style>
    <button class="_3Z6oR _3AsCW _2tsrJ css-1c1st7f-ButtonWrapper e1y3odo22" type="submit">회원가입하기</button></form>
    <style data-emotion="css 19aqixc-SignUpBottomMessage">.css-19aqixc-SignUpBottomMessage{color:#424242;font-size:15px;text-align:center;margin-top:30px;}</style><p class="css-19aqixc-SignUpBottomMessage e1y3odo21">이미 아이디가 있으신가요?<style data-emotion="css 53zgs0-LoginLink">.css-53zgs0-LoginLink{-webkit-text-decoration:underline;text-decoration:underline;font-weight:bold;display:inline-block;padding-left:10px;}.css-53zgs0-LoginLink:hover{opacity:0.7;}</style>
    <a href="/users/sign_in" class="css-53zgs0-LoginLink e1y3odo20">로그인</a></p></div></section></div>
    <script src="https://assets.ohou.se/web/dist/js/241-cd903cc95e824a37776c.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/vendor-c778def305c38712a6fe.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/runtime-98e23f3c2c369dd77af1.js"></script><script src="https://assets.ohou.se/web/dist/js/preamble-0a157f8686a189eac00e.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/0-e1b8de0f588eb460fe79.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/3-10212096a1125017200a.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/54-ec49d8b205fe767027e9.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/templates-User-SignUp-UserSignUp-ea57c7d12608b1639b57.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/12-675647d80d78787a0466.chunk.js"></script>
    <script src="https://assets.ohou.se/web/dist/js/13-4f638da5af78c8310109.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/15-72a92571954b2401e187.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/17-9f71ffa101b6bdb1a398.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/18-1c02e5fd2ecd7bee3d5b.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/21-8964fa4eec219ab72040.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/23-4f55c270fd895bb6275a.chunk.js"></script><script src="https://assets.ohou.se/web/dist/js/App-37b614fd5dbaa04e4e5c.chunk.js"></script>
    


  <script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
  <script>
    if (window.wcs != null) {
      if (!window.wcs_add) window.wcs_add = {};
      window.wcs_add["wa"] = "s_2e85116be219";
      if (!_nasa) var _nasa = {};
      wcs.inflow();
      wcs_do(_nasa);
    }
  </script>

  
  <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
  <script>
    if (window.kakaoPixel != null) {
      kakaoPixel('7919701595446099671').pageView();
    }
  </script>

  
  <script>
    function handleEnlipleLoad () {
      var rf = new EN();
      rf.setData('userid', 'bucketplace');
      rf.setSSL(true);
      rf.sendRf();
      if (typeof handleEnlipleLoadShop === 'function') {
        handleEnlipleLoadShop();
      }
    }
  </script>
  <script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" async="async" onload="handleEnlipleLoad()"></script>

  
  <div id="wp_tg_cts" style="display: none;"></div>
  <script>
    window.wptg_tagscript_vars = window.wptg_tagscript_vars || [];
    window.wptg_tagscript_vars.push(function () {
      return {
        wp_hcuid: '',
        ti: '47350',
        ty: 'Home',
        device: navigator.userAgent.match(/ios|iphone|ipad|android/i) ? 'mobile' : 'web',
      };
    });
  </script>
  <script type="text/javascript" async="async" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>




  </body>
</html>




<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->