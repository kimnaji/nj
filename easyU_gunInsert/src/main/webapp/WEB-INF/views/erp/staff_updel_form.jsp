<%@page import="www.erp.com.StaffDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" >

function del(staff_no){
	var a = confirm("삭제하시겠습니까?");
	if(a==true){
	location.href="staffDel.do?staff_no=" + staff_no;}
	else{
		location.href="staff_search_form.do";
	}
}

function insertWarning(tf) { 
/* 아이디 체크 */
    if(tf.staff_name.value==""){
        alert("아이디를 입력해 주세요");
        tf.staff_name.focus();
        return;
     }
     
/* 주민번호 체크 */    
    if(tf.jumin_no1.value==""){
        alert("주민번호를 입력해 주세요");
  
        return;
     }
    
    if(tf.jumin_no2.value==""){
        alert("주민번호를 입력해 주세요");
     
        return;
     }
    
/* 종교 체크 */     
    if(tf.code_religion.value=="0"){
        alert("종교를 입력해 주세요");
        tf.code_religion.focus();
        return;
     }

/* 학력 체크 */

    var total=0;
    var max=tf.school_code.length;
   	
    for(var i=0; i<max; i++){
  	  if(eval("document.insertstaff.school_code["+i+"].checked")==true){
  		  total+=1;
  	  }
    }
    if(total==0){
  	  alert("학력을 선택하세요.");
    } 
 
/* 기술 체크 */ 
  var total=0;
  var max=tf.skill_code.length;
 	
  for(var i=0; i<max; i++){
	  if(eval("document.insertstaff.skill_code["+i+"].checked")==true){
		  total+=1;
	  }
  }
  if(total==0){
	  alert("기술을 하나이상 선택하세요.");
  }
  

  /* 날짜 체크 */

      var total=0;
      var max=tf.graduate_day01.length;
     	
      for(var i=0; i<max; i++){
    	  if(eval("document.insertstaff.graduate_day01["+i+"].checked")==true){
    		  total+=1;
    	  }
      }
      if(total==0){
    	  alert("날짜 선택하세요.");
      } 
  /*  */
} 

function checkschool(chk){
	var obj=document.getElementsByName("school_code");
	
	for(var i=0; i<obj.length; i++){
		if(obj[i] != chk){
			obj[i].checked = false;
		}
	}
	
}

</script>
<script>

$(function(){

	$(document).ready(function(){
		
		//종교
		var select = $("#religion_code").val();
		console.log(select);
			$("#selectbox option:eq("+select+")").attr("selected","selected");
			
		//날짜 년
		var day01 = $("#graduate_day01").val();
		console.log(day01);
		day01=day01-1989;
			$("#day01box option:eq("+day01+")").attr("selected","selected");	
		
		//날짜 월
		var day02 = $("#graduate_day02").val();
		console.log(day02);
	
		$("#day02box option:eq("+day02+")").attr("selected","selected");	
			
		//날짜 일
		var day03 = $("#graduate_day03").val();
		console.log(day03);
		
		$("#day03box option:eq("+day03+")").attr("selected","selected");	
			
	
	});
	
	//학력
	$('input:checkbox[name="school_code"]').each(function() {
	
	    if(this.value == $("#school_code").val()){ //값 비교

	           this.checked = true; //checked 처리

	     }

	});


	//기술
	var i=0;
 	$('input:checkbox[name="skill_code"]').each(function() {
		
	    if(this.value == $("#skill_code1").val()){ //값 비교

	           this.checked = true; //checked 처리

	     }
	    if(this.value == $("#skill_code2").val()){ //값 비교

	           this.checked = true; //checked 처리

	     }
	    if(this.value == $("#skill_code3").val()){ //값 비교

	           this.checked = true; //checked 처리

	     }
	    if(this.value == $("#skill_code4").val()){ //값 비교

	           this.checked = true; //checked 처리

	     }
	    if(this.value == $("#skill_code5").val()){ //값 비교

	           this.checked = true; //checked 처리

	     }

	}); 

	
	
});




</script>

<body>

<!-- 사원 정보검색 TABLE -->

<c:url var="staffUpdate" value="/staffUpdate.do"></c:url>
	<sf:form modelAttribute="staffddto" method="post" action="${staffUpdate}" name="staffUpdate">	

<%-- <c:forEach var="erp" items="${staffView}">
 --%>
<c:set var="erp" value="${staffView}"></c:set>

<table border="1" width="800" align="center" height="150" cellpadding="0" cellspacing="0">

<tr>	
<td colspan="6" align="center" bgcolor="#EAEAEA">사원 정보 수정</td>
</tr>
<input type="hidden" id="school_code" value="${erp[0].school_code }">
<tr align="center">
<td width="10%" bgcolor="#EAEAEA">이름</td><td width="30%"><input type="text" name="staff_name" value="${erp[0].staff_name}">
															<input type="hidden" id="staff_no" name="staff_no" value="${erp[0].staff_no }"></td>
<td width="10%" bgcolor="#EAEAEA">주민번호</td><td width="30%"><input type="text"  name="jumin_no1" size="5" value="${erp[0].jumin_no.substring(0,6)}"> -
														  <input type="text" name=jumin_no2 size="5" value="*******"></td>
<td width="10%" bgcolor="#EAEAEA">종교</td><td width="10%"><input type="hidden" id="religion_code" value="${erp[0].religion_code }">
														<select name="religion_code" id="selectbox">
														 	<option selected value="0"></option>
														 	<option value="1">기독교</option>
														 	<option value="2">천주교</option>
														 	<option value="3">불교</option>
														 	<option value="4">이슬람</option>
														 	<option value="5">무교</option></select></td>
</tr>

<tr align="center">
<td bgcolor="#EAEAEA">학력</td><td><input type="checkbox" id="school1" name="school_code" value="1" onclick="return checkschool(this);">고졸
								  <input type="checkbox" id="school2" name="school_code" value="2" onclick="return checkschool(this);">전문대졸
								  <input type="checkbox" id="school3" name="school_code" value="3" onclick="return checkschool(this);">일반대졸</td>
<c:set var="i" value="1"></c:set>
<c:forEach var="erp" items="${staffView}">
<input type="hidden" id="skill_code${i}" value="${erp.skill_code }">
<c:set var="i" value="${i+1}"></c:set>
</c:forEach>
<td bgcolor="#EAEAEA">기술</td><td colspan="3"><input type="checkbox" name="skill_code" value="1">Java
								  			  <input type="checkbox" name="skill_code" value="2">JSP
								  			  <input type="checkbox" name="skill_code" value="3">ASP
								  	          <input type="checkbox" name="skill_code" value="4">PHP
								  			  <input type="checkbox" name="skill_code" value="5">Delphi</td>

</tr>
<c:set var="erp" value="${staffView}"></c:set>
<tr align="center">
<td bgcolor="#EAEAEA">졸업일</td><td colspan="5">


<input type="hidden" id="graduate_day01" value="${erp[0].graduate_day.substring(0,4) }">
<input type="hidden" id="graduate_day02" value="${erp[0].graduate_day.substring(4,6) }">
<input type="hidden" id="graduate_day03" value="${erp[0].graduate_day.substring(6,8) }">
 <select name="graduate_day01" id="day01box">
					<option selected value="graduate_day01"></option>
					<%
													for(int i=1990; i<2019; i++){
												%>
					<option value="<%=i%>"><%=i %></option>
					<%} %>
			</select> 년 <select name="graduate_day02" id="day02box">
					<option selected value="graduate_day02"></option>
					<%
													for(int i=1; i<13; i++){
												%>
					<option value="<%=i%>"><%=i %></option>
					<%} %>
			</select> 월 <select name="graduate_day03" id="day03box">
					<option selected value="graduate_day03"></option>
					<%
													for(int i=1; i<32; i++){
												%>
					<option value="<%=i%>"><%=i %></option>
					<%} %>
			</select> 일 </td>
</tr>

</table>

<table width="800">
<tr>
<td align="right">
<input type="submit" value="수정" onclick="insertWarning(this.form)">

<input type="button" value="삭제" onclick="del(${erp[0].staff_no})">
</td>
</tr> 
</table>
<%-- </c:forEach>  --%>

</sf:form>
<!-- 정보검색 테이블 결과 -->



</body>
</html>