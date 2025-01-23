<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>인생은 베팅! 회원가입</title>
<link rel="stylesheet" href="/betting/css/joinForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="form-container">
    <h1>회원가입</h1>
    <form action="join.do" method="post" name="frm" onsubmit="return chk()">
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" name="userid" required="required" autofocus="autofocus">
            <button type="button" class="btn" onclick="dupChk()">중복체크</button>
            <div id="err" class="error-message"></div>
        </div>
        <div class="form-group">
            <label for="password">암호</label>
            <input type="password" name="password" required="required">
        </div>
        <div class="form-group">
            <label for="password2">암호 확인</label>
            <input type="password" name="password2" required="required">
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" required="required">
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" name="address" required="required" size="60">
        </div>
        <div class="form-group">
            <label for="tel">전화</label>
            <input type="tel" name="tel" required="required"
                   placeholder="010-1111-1234" pattern="010-\d{3,4}-\d{4}"
                   title="전화 형식은 010-1111-1234 입니다.">
        </div>
		<div class="form-group">
			<label for="email">이메일</label> <input type="email" name="email"
				id="email" required="required" placeholder="example@example.com"
				pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
				title="이메일 형식은 example@example.com 입니다.">
		</div>
		<div class="form-group">
            <button type="submit" class="btn submit-btn">가입</button>
        </div>
    </form>
    <div class="login-redirect">
        <button class="btn redirect-btn" onclick="location.href='loginForm.do'">로그인</button>
    </div>
</div>
<script type="text/javascript">
    dupChk = () => {
        if (!frm.userid.value) {
            alert("아이디를 입력한 후에 중복체크하세요");
            frm.userid.focus();
            return false;
        }
        $.post('confirm.do', 'id=' + frm.userid.value, function (data) {
            $('#err').html(data);
        });
    }
    let chk = function () {
        if (frm.password.value != frm.password2.value) {
            alert("암호와 암호확인이 다릅니다.");
            frm.password.value = "";
            frm.password2.value = "";
            frm.password.focus();
            return false;
        }
    }
</script>
</html>