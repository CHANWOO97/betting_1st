package dao;

import java.sql.Date;

public class Game {
	 private int gameid;          // 경기 ID
	 private String hometeam;     // 홈 팀 이름
	 private String awayteam;     // 원정 팀 이름
	 private Date gamedate;       // 경기 날짜
	 private String gametime;     // 경기 시간
	 private String sporttype;    // 스포츠 종목
	 private String status;       // 경기 상태
	 private String gameresult;   // 경기 결과
	 private String userselect;	  // user 선택 결과
	 private Date createdAt;      // 생성일	
	 private String del;
	 
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getHometeam() {
		return hometeam;
	}
	public void setHometeam(String hometeam) {
		this.hometeam = hometeam;
	}
	public String getAwayteam() {
		return awayteam;
	}
	public void setAwayteam(String awayteam) {
		this.awayteam = awayteam;
	}
	public Date getGamedate() {
		return gamedate;
	}
	public void setGamedate(Date gamedate) {
		this.gamedate = gamedate;
	}
	public String getGametime() {
		return gametime;
	}
	public void setGametime(String gametime) {
		this.gametime = gametime;
	}
	public String getSporttype() {
		return sporttype;
	}
	public void setSporttype(String sporttype) {
		this.sporttype = sporttype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	 public String getGameresult() {
		return gameresult;
	}
	public void setGameresult(String gameresult) {
		this.gameresult = gameresult;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	 public String getUserselect() {
		return userselect;
	}
	public void setUserselect(String userselect) {
		this.userselect = userselect;
	}
	 
}
