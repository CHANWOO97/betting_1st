<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/sessionChk.jsp"%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/betting/css/joinForm.css">
<script type="text/javascript">
	let chk = function(){
		if(frm.password.value != frm.password2.value){
			alert("암호와 암호확인이 다릅니다.")
			frm.password.value = "";
			frm.password2.value = "";
			frm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div class="form-container">
    <h1>회원정보 수정</h1>
    <form action="update.do" method="post" name="frm" onsubmit="return chk()">
    	<div class="form-group">
    		<input type="text" name="userid" value="${user.userid }">
    	</div>
        <div class="form-group">
            <label for="userid" class="view_id">로그인 아이디 : ${user.userid }</label>
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
            <input type="text" name="name" required="required" value="${user.username }">
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" name="address" required="required" size="60"
            value="${user.address }">
        </div>
        <div class="form-group">
            <label for="tel">전화</label>
            <input type="tel" name="tel" required="required"
                   placeholder="010-1111-1234" pattern="010-\d{3,4}-\d{4}"
                   title="전화 형식은 010-1111-1234 입니다." value="${user.tel }">
        </div>
		<div class="form-group">
			<label for="email">이메일</label> <input type="email" name="email"
				id="email" required="required" placeholder="example@example.com"
				pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
				title="이메일 형식은 example@example.com 입니다." value="${user.email }">
		</div>
		<div class="form-group">
            <button type="submit" class="btn submit-btn">회원정보수정</button>
        </div>
    </form>
</div>
</body>
</html>