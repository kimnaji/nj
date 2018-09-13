<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">

$(function(){
	$(document).ready(function(){
		
		$.ajax({//ajax 요청하고 get방식으로 전송
			url:"staff_updel_form.do",
			method:"GET",
			success: function(data){
			
				$.each(data, function(idx,result){ 
					$("#selectbox option:eq("result.religion_code")").attr("selected","selected");
					
				});
			
				}
		});
			
	});
		
});

</script>
<body>

<!-- 사원 정보검색 TABLE -->

<c:url var="staffSearch" value="/staffSearch.do"></c:url>
	<sf:form modelAttribute="staffddto" method="post" action="${staffSearch}" name="staffSearch">	


<table border="1" width="800" align="center" height="150" cellpadding="0" cellspacing="0">

<tr>
<td colspan="6" align="center" bgcolor="#EAEAEA">사원 정보 검색</td>
</tr>

<tr align="center">
<td width="10%" bgcolor="#EAEAEA">이름</td><td width="30%"><input type="text" name="staff_name"></td>
<td width="10%" bgcolor="#EAEAEA">성별</td><td width="20%"><input type="checkbox" name="sex" value="man">남
														  <input type="checkbox" name="sex" value="woman">여</td>
<td width="10%" bgcolor="#EAEAEA">종교</td><td width="20%"><select name="code_religion">
														 	<option selected value="종교"></option>
														 	<option value="기독교">기독교</option>
														 	<option value="천주교">천주교</option>
														 	<option value="불교">불교</option>
														 	<option value="이슬람">이슬람</option>
														 	<option value="무교">무교</option></select></td>
</tr>

<tr align="center">
<td bgcolor="#EAEAEA">학력</td><td><input type="checkbox" name="code_school" value="고졸">고졸
								  <input type="checkbox" name="code_school" value="전문대졸">전문대졸
								  <input type="checkbox" name="code_school" value="일반대졸">일반대졸</td>
<td bgcolor="#EAEAEA">기술</td><td colspan="3"><input type="checkbox" name="code_skill" value="Java">Java
								  			  <input type="checkbox" name="code_skill" value="JSP">JSP
								  			  <input type="checkbox" name="code_skill" value="ASP">ASP
								  	          <input type="checkbox" name="code_skill" value="PHP">PHP
								  			  <input type="checkbox" name="code_skill" value="Delphi">Delphi</td>
</tr>

<tr align="center">
<td bgcolor="#EAEAEA">졸업일</td><td colspan="5">
										
	<%for(int j=0; j<2; j++){ %> <select name="graduate_day01">
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
			</select> 일 <%
											if(j==0){
												%> ~ <%
											}
										} %>
											   </td>
</tr>

</table>

<table width="890">
<tr>
<td align="center" width="70%">
<input type="button" value="검색"> 
</td>
<td align="right">
<input type="button" value="전부검색">
<input type="button" value="초기화">
<input type="button" value="등록" onclick="staffInsert()">
</td>
</tr>
<tr>
<td align="right" colspan="2"><font size="2">검색건수 →?</font></td>
</tr> 
</table>
</sf:form>

<!-- 정보검색 테이블 결과 -->

<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">
<tr bgcolor="#EAEAEA" align="center">
	<td>번호</td><td>이름</td><td>성별</td><td>종교</td><td>졸업일</td><td></td>
</tr>
<c:forEach var="staffSearch" items="${staffSearch}">
<tr align="center">
	<td width="10%">${staffSearch.staff_no}</td><td width="20%">${staffSearch.staff_name}</td><td width="10%">
	
<%-- 	<c:set var="sex" value="${fn:substring(staffList.jumin_no2,0,1)}"/>${staffList.jumin_no}
	<c:if test="${sex =='2'}">
	
	</c:if>
	<c:if test="${sex =='1'}">
	남
	</c:if> --%>
	
	</td><td width="20%">${staffSearch.religion_code }</td><td width="20%">${staffSearch.graduate_day }</td><td width="20%"><input type="button" value="수정/삭제" onclick="updel(${staffSearch.staff_no})"></td>
</tr>
</c:forEach>
</table>

</body>
</html>