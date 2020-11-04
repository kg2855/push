<%@page import="org.apache.catalina.loader.WebappClassLoaderBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

myInfoOK.jsp 입니다.<br>

<!-- myInfo.jsp에서 전송되는 데이터를 받는다. -->
<%



//	form에 입력된 데이터가 post 방식으로 전송될 때 한글이 깨지는 현상을 방지한다.
//	한글 깨짐을 방지하려면 최초의 request.getparameter()가 실행되기 전에(맨 처음에) 아래의 내용을 코딩하면 된다.
	request.setCharacterEncoding("UTF-8");

//	get 방식도 한글이 깨졌었다. => tomcat setver 7.0 부터 get 방식을 사용할 때 한글이 깨지지 않고 처리된다.
//	get 방식에서 한글이 꺠지지 않고 하려면, 서버에서 한글이 깨지지 않도록 설정해야 한다.
//	Servers 폴더의 server.xml 파일을 열고 64번 줄의 Connector 태그에 
//	URIEncoding="UTF-8" 속성을 추가하면 get 방식에서 한글이 깨지지 않는다.

//	request.getParameter() : 이전 페이지에서 submit 버튼이 클릭되서 넘어오는 데이터를 무조건 문자열로 받는다.
	String name = request.getParameter("name");
	out.println(name + "님 안녕하세요!<br>");
	String id = request.getParameter("id");
	out.println(name + "님(" + id + ") 안녕하세요<br>");
	String password = request.getParameter("password");
	out.println(name + "님(" + id + ")의 비밀번호는 " + password + "입니다.<br>");
	
	try{
		int age = Integer.parseInt(request.getParameter("age"));
		out.println(name + "님(" + id + ")의 나이는 " + age + "살 입니다.<br>");
		out.println(name + "님(" + id + ")의 나이는 " + (age + 1) + "살 입니다.<br>");		
	} catch(NumberFormatException e) {
//		e.printStackTrace();
//		String age = request.getParameter("age");
//		out.println(name + "님(" + id + ")의 나이는 " + age + "살 입니다.<br>");
		out.println("잘못된 나이가 입력되었습니다.<br>");
		out.println("<script>");
		out.println("alert('잘못된 나이가 입력되었습니다.')");		
		out.println("</script>");
	}
	
	boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
	out.println(name + "님(" + id + ") 은" + (gender ? "남자" : "여자") + "입니다.<br>");
	
//	String hobbies = request.getParameter("hobbies");
//	out.println(name + "님(" + id + ")의 취미는 " + hobbies + "입니다.<br>");

//	checkbox는 여러 항목을 선택할 수 있지만 위와 같이 getParameter() 메소드를 이용해서 받으면 맨 처음 선택한 값 한 개만 받을 수 있다.
//	checkbox에서 넘어오는 데이터를 받을 때는 넘어오는 항목이 여러 개일 수 있기 때문에,
//	getParameterValues() 메소드로 받아서 배열에 저장시켜서 처리해야 한다.
	try{
		String[] hobbies = request.getParameterValues("hobbies");
		out.println(name + "님(" + id + ")의 취미 : ");
		for(int i = 0; i < hobbies.length; i++){
			out.println(hobbies[i] + " ");
		}
		out.println("입니다.<br>");
	} catch(NullPointerException e){
		out.println("없넹...코로나 땜시 집에만...<br>");
		out.println("<script>");
		out.println("alert('취미가 선택되지 않았습니다.')");		
		out.println("</script>");
	}
	
	String myType = request.getParameter("myType");
	out.println(name + "님은 " + myType + "을 좋아합니다.<br>");
	
	try{
		String[] myTypes = request.getParameterValues("myTypes");
		out.println(name + "님의 이상형 : ");
		for(int i = 0; i < myTypes.length; i++){
			out.println(myTypes[i] + " ");
		}
		out.println("입니다.<br>");
	} catch(NullPointerException e){
		out.println("저는 순수해서 그른거 몰라영ㅎㅎ<br>");
	}
	
	String content = request.getParameter("content");
//	태그 사용 가능, 줄바꿈 불가능	
//	out.println(name + "님이 남긴 말<br>" + content + "<br>");
//	태그 사용 불가능, 줄바꿈 불가능	
//	out.println(name + "님이 남긴 말<br>" + content.replace("<", "&lt;").replace(">", "&gt;1") + "<br>");
//	태그 사용 가능, 줄바꿈 가능	
//	out.println(name + "님이 남긴 말<br>" + content.replace("\r\n", "<br>") + "<br>");
//	태그 사용 불가능, 줄바꿈 가능	
	out.println(name + "님이 남긴 말<br>" + content.replace("<", "&lt;").replace(">", "&gt;1").replace("\r\n", "<br>") + "<br>");
	
%>



<a href="myInfo.jsp">돌아가기</a>

</body>
</html>
























