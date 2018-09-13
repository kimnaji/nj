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

function insertWarning(tf) { 
/* 아이디 체크 */
    if(tf.staff_name.value==""){
        alert("아이디를 입력해 주세요");
        tf.staff_name.focus();
        return;
     }
     
/* 주민번호 체크 */    
    if(tf.jumin_no1.value.length<6){
        alert("올바른 주민번호를 입력해 주세요");
  
        return;
     }
    
    if(tf.jumin_no2.value.length<7){
        alert("올바른 주민번호를 입력해 주세요");
     
        return;
     }
    
    
/* 종교 체크 */     
    if(tf.religion_code.value=="0"){
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
      tf.school_code.focus();

  	  return;
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
      tf.skill_code.focus();
      return;
  }
  
  /* 날짜 체크 */     
  if(tf.graduate_day01.value=="graduate_day01" || tf.graduate_day02.value=="graduate_day02"  || tf.graduate_day03.value=="graduate_day03" ){
      alert("날짜를 입력해 주세요");
      tf.graduate_day01.focus();
      return;
   }
  
  
  
  
  
  $("#tf").submit();
  

} 

function checkschool(chk){
	var obj=document.getElementsByName("school_code");
	
	for(var i=0; i<obj.length; i++){
		if(obj[i] != chk){
			obj[i].checked = false;
		}
	}
	return;	
}


</script>

<body>

<!-- 사원 정보검색 TABLE -->

<c:url var="insertstaff" value="/InsertStaffeaction.do"></c:url>
	<sf:form modelAttribute="staffddto" method="post" action="${insertstaff}" name="insertstaff" id="tf">	

<table border="1" width="800" align="center" height="150" cellpadding="0" cellspacing="0">

<tr>
<td colspan="6" align="center" bgcolor="#EAEAEA">사원 정보 등록</td>
</tr>

<tr align="center">
<td width="10%" bgcolor="#EAEAEA">이름</td><td width="30%"><input type="text" name="staff_name"></td>
<td width="10%" bgcolor="#EAEAEA">주민번호</td><td width="30%"><input type="text"  name="jumin_no1" size="5"> -
														  <input type="text" name=jumin_no2 size="5"></td>
<td width="10%" bgcolor="#EAEAEA">종교</td><td width="10%"><select name="religion_code">
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

<td bgcolor="#EAEAEA">기술</td><td colspan="3"><input type="checkbox" name="skill_code" value="1">Java
								  			  <input type="checkbox" name="skill_code" value="2">JSP
								  			  <input type="checkbox" name="skill_code" value="3">ASP
								  	          <input type="checkbox" name="skill_code" value="4">PHP
								  			  <input type="checkbox" name="skill_code" value="5">Delphi</td>
</tr>

<tr align="center">
	<td bgcolor="#EAEAEA">기술입력</td>
	<td colspan="5"><input type="text" name="keyword"></td>
</tr>

<tr align="center">
<td bgcolor="#EAEAEA">졸업일</td><td colspan="5">
 <select name="graduate_day01">
					<option selected value="graduate_day01"></option>
					<%
													for(int i=1990; i<2019; i++){
												%>
					<option value="<%=i%>"><%=i %></option>
					<%} %>
			</select> 년 <select name="graduate_day02">
					<option selected value="graduate_day02"></option>
					<%
													for(int i=1; i<13; i++){
												%>
					<option value="<%=i%>"><%=i %></option>
					<%} %>
			</select> 월 <select name="graduate_day03">
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
<input type="button" value="등록" onclick="insertWarning(this.form)">

<input type="button" value="초기화">
</td>
</tr> 
</table>
</sf:form>
<!-- 정보검색 테이블 결과 -->



</body>
</html>