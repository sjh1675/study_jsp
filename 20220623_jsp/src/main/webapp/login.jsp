<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	h3 {
		text-align: center;
	}
	#loginMemo {
		text-align: center;
	}
</style>
<center>
	<form action="loginCheck.jsp" method="POST" >
		<table>
			<tr>
				<td colspan="2"><h3>로그인</h3></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required/></td>
			</tr>
			<tr>
				<td colspan="2" id="loginMemo"><input type="checkbox" name="loginMemo" value="loginMemo"/> 로그인 상태 유지 </td>
			</tr>
		</table>
		<button>로그인</button>
	</form>	
</center>