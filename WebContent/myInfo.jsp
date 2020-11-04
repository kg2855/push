<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
주석 : CTRL + SHIFT + /
주석 삭제 : CTRL + SHIFT + \
-->
<%-- jsp 주석 --%>
<%--
	<%@ ~ %> 	: 디렉티브 		=> 대부분 자동으로 입력된다. import와 같이 설정에 관련된 정보를 적는다.
	<%! ~ %> 	: 선언부		=> 프로그램에서 사용할 변수나 메소드를 정의한다. 	=> java 파일로 뽑아내서 사용한다.
	<%= ~ %> 	: 표현식		=> 변수에 저장된 데이터나 연산결과를 출력한다. 		=> EL(${ ~ })로 대체해서 사용한다.
	<% ~ %>  	: 스크립트 릿	=> 일반적으로는 jsp 코드를 적는다.					=> jstl로 대체해서 사용한다.
 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

myInfo.jsp 입니다.<br>

<!-- 
	HTML은 spacebar를 여러 번 눌러도 한 칸 밖에 떨어지지 않고 enter 키를 여러 번 눌러도 줄이 변경되지 않는다.
	2칸 이상 띄우려면 &nbsp;를 띄울 칸 개수만큼 입력하고, 
	줄을 변경하려면 <br> 태그를 사용해야 한다.
	
	현재 페이지에 입력한 데이터를 특정 페이지로 전송하려면 전송할 데이터를 입력하는 코드를 <form> ~ </form> 코드 사이에 적는다.
	action 속성에는 전송(submit) 버튼이 클릭되면 form에 입력한 데이터가 전송될 페이지 이름을 적는다. 
			=> "?"만 입력하면 현재 페이지를 의미한다.
			
	method 속성에는 action 페이지로 데이터가 전송될 때 전송되는 정보가 url 창에 표시되는 여부를 지정한다.
	method는 생략시 get이 기본 값으로 사용된다.
		=> 	get은 전송되는 데이터가 url 창에 표시된다.
		=> 	post로 변경하면 전송되는 정보가 url 창에 표시되지 않는다.
	
 -->

<form action="myInfoOK.jsp" method = "post">
	
	<label>이름 : <input type="text" name="name"></label><br>
	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="password" name="password"><br>
	나이 : <input type="text" name="age"><br>
	
	<!-- 
		radio와 checkbox는 같은 그룹끼리 반드시 같은 이름의 name 속성을 지정해야 그룹으로 묶인다.
		radio와 checkbox는 컨트롤 자체를 브라우저에 표시하는 기능 밖에 없기 때문에, 
		선택했을 때 다음 페이지로 넘겨줄 데이터를 value 속성을 사용해서 넣어줘야 한다.
				=>	value 속성을 지정하지 않으면 선택한 경우 무조건 "on"이ㅐ 넘어간다.
	 -->
	
	<fieldset style="width: 120px;">
		<legend>성별</legend>
			<input type="radio" name="gender" value="true">남자
	 		<input type="radio" name="gender" checked="checked" value="false">여자<br>
	</fieldset>
	<fieldset style="width: 270px;">
		<legend>취미</legend>
			<input type="checkbox" name="hobbies" value="늦잠자기">늦잠자기
		   	<input type="checkbox" name="hobbies" value="지각하기">지각하기
		   	<input type="checkbox" name="hobbies" value="게임하기">게임하기<br>
	</fieldset>
	
	<!-- 콤보 상자 만들기 -->
	이상형은?
	<select style="width : 200px;" name="myType">
		<option>신예은</option>
		<option>김유정</option>
		<option>샤넌</option>
		<option>박보영</option>
		<option selected="selected">다현</option>
		<option>쯔위</option>
		<option>아이린</option>
		<option>정소민</option>
	</select><br>
	
	<!-- 목록 상자 만들기 -->
	이상형은?
	<select style="width : 200px;" name="myTypes" multiple="multiple" size="6">
		<option>신예은</option>
		<option>김유정</option>
		<option>샤넌</option>
		<option>박보영</option>
		<option selected="selected">다현</option>
		<option>쯔위</option>
		<option>아이린</option>
		<option>정소민</option>
	</select><br>
	
	메모<br>
	<textarea rows="10" cols="80" name="content" style="resize: none;"></textarea><br>
	
	<input type="submit" value="회원가입">
	
</form>
	

</body>
</html>




























