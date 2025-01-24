# 🤦‍♂️안산그린컴퓨터아카데미 1차 프로젝트


# 🏀 스포츠토토

## 📋 프로젝트 개요
스포츠 경기 정보를 기반으로 사용자가 원하는 경기에 배팅하고 결과를 관리할 수 있는 플랫폼입니다.  
**프로젝트 목적:** 스포츠 경기에 대한 배팅 시스템과 관리 기능 학습 및 구현  
**기술 스택:** Java, JSP, MySQL, Tomcat, jQuery

## 🚀 기능

### 사용자 기능
- **배팅 페이지**
  - 경기 목록 확인
  - 선택 경기 배팅 (승, 무, 패)
  - 배당률 및 예상 포인트 계산
- **장바구니**
  - 선택 경기 저장 및 관리
  - 배팅 내역 확인
- **포인트 관리**
  - 보유 포인트 확인 및 사용
  - 배팅 결과에 따른 포인트 반영

### 관리자 기능
- **경기 관리**
  - 경기 추가, 수정, 삭제
  - 배당률 설정
- **회원 관리**
  - 회원 정보 조회 및 수정

## 🔧 설치 및 실행 방법

### 1. 환경 설정
- Java Version: 11 이상
- IDE: Eclipse
- Application Server: Tomcat 9.0
- Database: Oracle 18.0
- language : Java/JSP, JavaScript/jQuery, HTML5/CSS3
- Software : Mybatis
- API : commons-email-1.4.jar / activation.jar


## 프로젝트 수행 중 느낀 점 및 경험한 성과

### 문제 해결 과정

- **DAO와 XML 매핑**: `MyBatis`에서 `JOIN`문을 사용할 때 발생한 문제를 해결하면서, 각 `DAO`와 XML 파일 간의 관계를 명확히 이해하게 되었습니다. 예를 들어, `SaleDAO`에서 `GameDAO`의 데이터를 `JOIN`으로 가져올 때, `GameDAO`에서 `sale.xml`을 사용해야 한다는 점을 학습하였습니다. 이를 통해 데이터 연관성을 처리하는 방법을 알게 되었습니다.
  
- **디버깅 및 에러 해결**: `DAO`를 통해 데이터를 전달하는 과정에서 여러 오류가 발생했지만, 이를 디버깅하며 문제 해결 능력을 키울 수 있었습니다. 발생한 오류들의 근본적인 원인을 파악하고 해결하는 과정에서 실력이 향상되었습니다.

### 기술적 성과

- **디자인 개선**: 디자인에 있어 부족한 점을 느꼈지만, `ChatGPT`를 활용하여 스타일링을 개선하고, 기본적인 웹 디자인을 익혔습니다. 이를 통해 웹 페이지의 디자인을 향상시킬 수 있었습니다.

- **기술 스택 적용**: `Decorator`, `헤더/푸터 개별 사용`, `메일 발송`, `Controller`를 활용한 `properties` 파일 관리 등 다양한 기술적 요소를 적용하여 프로젝트를 구조화했습니다. 이를 통해 기능 구현뿐만 아니라 유지보수성도 고려한 설계를 할 수 있었습니다.

### 전반적인 학습

이 프로젝트를 통해 다양한 기술을 실습하면서 문제 해결 능력과 프로젝트 구조 설계 능력을 향상시킬 수 있었습니다. 특히, `MyBatis`와 `DAO` 구조를 깊이 이해하고, 복합적인 기능을 통합하는 과정에서 큰 성장을 경험했습니다.
