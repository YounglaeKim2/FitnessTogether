<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/template/Top.jsp"/> 
 <!DOCTYPE html>
<html lang="en">

<body>
<div class="css-i18bs4-SignUp e1y3odo23">
    	

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
    	
</body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->