<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function updel(staff_no){
	location.href="staff_updel_form.do?staff_no="+staff_no;
}

function staffInsert(){
	location.href="staff_input_form.do";
}


</script>

<body>

	<!-- 사원 정보검색 TABLE -->

<form method="post" name="form" enctype="multipart/form-data" id="form">
	<table border="1" width="800" align="center" height="150"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="6" align="center" bgcolor="#EAEAEA">사원 정보 검색</td>
		</tr>

		<tr align="center">
			<td width="10%" bgcolor="#EAEAEA">이름</td>
			<td width="30%"><input type="text" name="staff_name"></td>
			<td width="10%" bgcolor="#EAEAEA">성별</td>
			<td width="20%"><input type="checkbox" name="sex" value="1">남
				<input type="checkbox" name="sex" value="2">여</td>
			<td width="10%" bgcolor="#EAEAEA">종교</td>
			<td width="20%"><select name="religion_code">
					<option selected value="종교"></option>
					<option value="1">기독교</option>
					<option value="2">천주교</option>
					<option value="3">불교</option>
					<option value="4">이슬람</option>
					<option value="5">무교</option>
			</select></td>
		</tr>

		<tr align="center">
			<td bgcolor="#EAEAEA">학력</td>
			<td><input type="checkbox" name="school_code" value="1">고졸
				<input type="checkbox" name="school_code" value="2">전문대졸
				<input type="checkbox" name="school_code" value="3">일반대졸</td>
				
			<td bgcolor="#EAEAEA">기술</td>
			<td colspan="3"><input type="checkbox" name="skill_code"
				value="1">Java <input type="checkbox" name="skill_code"
				value="2">JSP <input type="checkbox" name="skill_code"
				value="3">ASP <input type="checkbox" name="skill_code"
				value="4">PHP <input type="checkbox" name="skill_code"
				value="5">Delphi</td>
		</tr>

		<tr align="center">
			<td bgcolor="#EAEAEA">졸업일</td>
			<td colspan="5">
				<select name="graduate_day01">
					<option selected value="graduate_day01"></option>
					<%
													for(int i=1990; i<2019; i++){
												%>
					<option value="<%=i%>" id="graduate_day01"><%=i %></option>
					<%} %>
			</select> 년 <select name="graduate_day02">
					<option selected value="graduate_day02"></option>
					<%
													for(int i=1; i<13; i++){
												%>
					<option value="<%=i%>" id="graduate_day02"><%=i %></option>
					<%} %>
			</select> 월 <select name="graduate_day03">
					<option selected value="graduate_day03"></option>
					<%
													for(int i=1; i<32; i++){
												%>
					<option value="<%=i%>" id="graduate_day03"><%=i %></option>
					<%} %>
			</select> 일 ~
			
						<select name="graduate_day04">
					<option selected value="graduate_day04"></option>
					<%
													for(int i=1990; i<2019; i++){
												%>
					<option value="<%=i%>" id="graduate_day04"><%=i %></option>
					<%} %>
			</select> 년 <select name="graduate_day05">
					<option selected value="graduate_day05"></option>
					<%
													for(int i=1; i<13; i++){
												%>
					<option value="<%=i%>" id="graduate_day05"><%=i %></option>
					<%} %>
			</select> 월 <select name="graduate_day06">
					<option selected value="graduate_day06"></option>
					<%
													for(int i=1; i<32; i++){
												%>
					<option value="<%=i%>" id="graduate_day06"><%=i %></option>
					<%} %>
			</select> 일
			</td>
		</tr>

	</table>
	
	<table width="800" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center" >
				<input type="text" name="keyword"> 
				<select name="keyword_no">
						<option value="1" selected >선택</option>
						<option value="1">AND</option>
						<option value="2">OR</option>
				</select></td>
			</tr>

	</table>

	</form>

	
	<table width="800" align="center" cellpadding="0" cellspacing="0">		
		<tr>
			<td align="right" width="65%">
			<button id="Search" style="width: 250px">검색</button>
			</td>
			
			<td align="right" width="35%">
			<button id="allSearch">전부검색</button> 
				<input type="button"value="초기화"> 
				<input type="button" value="등록"onclick="staffInsert()">
			</td>
		</tr>
	</table>

	
<form method="post" name="sortform" enctype="multipart/form-data" id="sortform">
		<table width="800" align="center" cellpadding="0" cellspacing="0">		
	
	<tr>
			<td width="35%"><select name="sort_type">
						<option value="1" selected>선택</option>
						<option value="staff_no">번호</option>
						<option value="staff_name">이름</option>
						<option value="graduate_day">졸업일</option>
			</select><select name="sort">
						<option value="1" selected>정렬</option>
						<option value="1">오름차순</option>
						<option value="2">내림차순</option>
				</select></td>
		
	</tr></table>
	
</form>
				<table width="800" align="center" cellpadding="0" cellspacing="0">		
			<tr><td>
			<button id="sortbtn" style="width: 80px">정렬</button>
			</td></tr>
	</table>
	
	<div id="hi"></div>

				<!-- 페이징 처리 -->

<%-- 				<c:if test="${ count > 0 }">
					<c:set var="pageCount"
						value="${ count / pageSize + ( count % pageSize == 0 ? 0 : 1 )}" />
					<c:set var="pageBlock" value="${ 10 }" />

					<fmt:parseNumber var="result" value="${ currentPage / 10 }"
						integerOnly="true" />
					<c:set var="startPage" value="${ result * 10 + 1 }" />
					<c:set var="endPage" value="${ startPage + pageBlock - 1 }" />

					<c:if test="${ endPage > pageCount }">
						<c:set var="endPage" value="${ pageCount }" />
					</c:if>

					<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<li class="active"><a href="./staffList.do?pageNum=${ i }"><b>${ i }</b></a></li>
					</c:forEach>

			
				</c:if>
 --%>
				<!-- 페이징 처리 -->


</body>

<script>
/* $(function(){ */
	
	$("#allSearch").click(function(){

		//var i=1;
		//var html ="";
		//html += '<font onclick="paging('+i+','+(i+4)+')"></font>';
		paging(1,5);
			
	});

	function paging(startRow,endRow){
		$.ajax({//ajax 요청하고 get방식으로 전송
			url:"allSearch.do",
			method:"GET",
			data : {startRow:startRow,endRow:endRow},
			success: function(data){
		staffList(data)
			}
		});
	}
	
	
	$("#sortbtn").click(function(){

		var formData=$("form[name=sortform]").serialize();
		//alert(formData);
		$.ajax({//ajax 요청하고 get방식으로 전송
			url:"sort.do",
			method:"post",
			data : formData,
			success: function(data){
				staffList(data)
				
				}
		});
			
	});
	
	$("#Search").click(function(){
		/* 		
	var day01 = $("#graduate_day01").val();
 	var day02 = $("#graduate_day02").val();
	var day03 = $("#graduate_day03").val();

 	if(day02.length==1) {
		day02="0"+day02;
	}
	if(day03.length==1) {
		day03="0"+day03;
	}
	
	var ch1 = day01+day02+day03;
	
	var day04 = $("#graduate_day04").val();
	var day05 = $("#graduate_day05").val();
	var day06 = $("#graduate_day06").val();
	
	if(day05.length==1) {
		day05="0"+day05;
	}
	if(day06.length==1) {
		day06="0"+day06;
	}
	
	var ch2 = day04+day05+day06;
	console.log(day01);
	console.log(day02);
	
 	if(ch1>=ch2){
		alert(ch1);
	}  
	  
	 */
		
		var formData=$("form[name=form]").serialize();
		
		$.ajax({//ajax 요청하고 get방식으로 전송
			url:"staffSearch.do",
			method:"post",
			data : formData,
			success: function(data){
				console.log(data);
				staffList(data)
				
				
				}
		});
			
	});
	

		
	function staffList(data){
				
		var length=Object.keys(data).length; 
		var html="";
		html += '<table width="800"  align="center" cellpadding="0" cellspacing="0">';
		html += '<tr><td align="right">검색건수 →'+length+'</td></tr></table>';
		html += '<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">';
		
		html += '<tr bgcolor="#EAEAEA" align="center">';
		html += '<td>번호</td><td>이름</td><td>성별</td><td>종교</td><td>졸업일</td><td></td></tr>';
		
		$.each(data, function(idx,result){ 
		html += '<tr align="center">';
		html += '	<td width="10%">'+result.staff_no+'</td><td width="20%">'+result.staff_name+'</td>';
		html += '<td width="10%">';
		if(result.jumin_no.substr(6,1) == 2){
		html +=	'여';
		}else{
		html += '남';	
		}
		html += '</td><td width="20%">'+result.religion_name+ '</td><td width="20%">';
		html += result.graduate_day.substr(0,4)+ '-'+result.graduate_day.substr(4,2)+'-'+result.graduate_day.substr(6,8)+'</td>';
		html += '<td width="20%"><input type="button" value="수정/삭제" onclick="updel('+result.staff_no+')"></td>';
		html += '</tr>';
		});
		html +='</table>';
		
		html += '<table width="800"align="center" cellpadding="0" cellspacing="0"><tr><td align="center">';
		
		var j=1;
		for(var i=1; i<6; i++){ 
			
 		html += '<font onclick="paging('+j+','+(j+4)+')">'+i+'</font>'
		 //html += `<font onclick="paging(` +j+ `,`+(j+4)+`)">`+i+`</font>`

		j=j+5;
		
		}
		
		html +='</td></tr></table>';
		

		
		
		$('#hi').html(html);
	
	};
	

/* }); */



</script>
</html>