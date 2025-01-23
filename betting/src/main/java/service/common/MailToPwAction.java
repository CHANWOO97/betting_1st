package service.common;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class MailToPwAction implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String userid = request.getParameter("userid");
        String randomPassword = RandomPassword.genRandomPassword(6);
        
        User user = new User();
        user.setEmail(email);
        user.setUsername(name);
        user.setUserid(userid);
        user.setPassword(randomPassword);

        UserDao ud = UserDao.getInstance();
        int result = 0;
        try {
            result = ud.updatePw(user); 
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (result > 0) {
            try {
                // 이메일 전송 설정
                Properties p = System.getProperties();
                p.put("mail.smtp.host", "smtp.gmail.com");
                p.put("mail.smtp.port", "587");
                p.put("mail.smtp.auth", "true");
                p.put("mail.smtp.starttls.enable", "true");
                p.put("mail.smtp.ssl.protocols", "TLSv1.2");

                String subject = "베팅 사이트 비밀번호 초기화";
                String msg = "✔초기화된 아래 비밀번호로 로그인하시고 비밀번호 수정하십시오✔<br>"
                        + "<p style='font-size: 16px; color: #333; margin-top: 10px; font-weight: bold;'>"
                        + randomPassword
                        + "</p>";

                Authenticator auth = new MyAuth();
                Session session = Session.getDefaultInstance(p, auth);
               // session.setDebug(true); // 디버깅 활성화
                MimeMessage mm = new MimeMessage(session);

                // 이메일 메타 정보 설정
                mm.setSentDate(new Date());
                mm.setFrom(new InternetAddress("testwoo789@gmail.com"));
                mm.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
                mm.setSubject(subject, "utf-8");
                mm.setText(msg, "utf-8");
                mm.setHeader("content-Type", "text/html");

                // 이메일 전송
                javax.mail.Transport.send(mm);
            } catch (Exception e) {
                e.printStackTrace();
                result = 0; // 이메일 전송 실패 시 결과를 0으로 설정
            }
        }

        // 결과 및 상태를 요청 속성에 저장
        request.setAttribute("result", result);
        request.setAttribute("email", email);

        return "mailToPw"; 
    }
}

class MyAuth extends Authenticator {
    javax.mail.PasswordAuthentication account;

    public MyAuth() {
        String id = "testwoo789@gmail.com";
        String pw = "gxsw igxf mzrr ihcy"; 
        account = new PasswordAuthentication(id, pw);
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return account;
    }
}


