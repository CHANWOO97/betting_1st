package service.common;

public class Main {
    public static void main(String[] args) {
        // 6자리 랜덤 비밀번호 생성
        String randomPassword = RandomPassword.genRandomPassword(6);
        System.out.println("생성된 랜덤 비밀번호: " + randomPassword);
    }
}
