<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="/betting/css/joinForm.css">
<script type="text/javascript">
	let chk = function(){
		if(frm.password.value != '${user.password}'){
			alert("입력하신 암호가 본인 패스워드와 다릅니다.")
			frm.password.value = "";
			frm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div class="form-container">
    <h1>회원 탈퇴를 위한 암호 입력</h1>
    <form action="delete.do" method="post" name="frm" onsubmit="return chk()">
        <div class="form-group">
            <label for="userid" class="view_id">로그인 아이디 : ${user.userid }</label>
        </div>
        <div class="form-group">
            <label for="password">암호</label>
            <input type="password" name="password" required="required">
        </div>
		<div class="form-group">
            <button type="submit" class="btn submit-btn">회원탈퇴</button>
        </div>
    </form>
</div>
</body>
</html>