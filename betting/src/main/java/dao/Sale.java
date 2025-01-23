package dao;

import java.sql.Date;

public class Sale {
	private int saleid;
	private String userresult; //user의 승무패의 결과
	private String result;	// 게임 구매 확정 결과 (default 미정/확정)
	private Date saledate; // 게임 구매 시간 
	private int salepoint; // 게임 구매 포인트
	private String checked; // 게임 적중 결과
	private String userid;
	private int gameid;
	
	
	//  join
	private Date gamedate;       // 경기 날짜
	private String gametime;	 // 경기 시간
	private String hometeam;     // 홈 팀 이름
	private String awayteam;     // 원정 팀 이름
	private String sporttype;    // 스포츠 종목
	private String gameresult;   // 경기결과
	
	public String getGameresult() {
		return gameresult;
	}
	public void setGameresult(String gameresult) {
		this.gameresult = gameresult;
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
	public String getSporttype() {
		return sporttype;
	}
	public void setSporttype(String sporttype) {
		this.sporttype = sporttype;
	}
	public int getSaleid() {
		return saleid;
	}
	public void setSaleid(int saleid) {
		this.saleid = saleid;
	}
	public String getUserresult() {
		return userresult;
	}
	public void setUserresult(String userresult) {
		this.userresult = userresult;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Date getSaledate() {
		return saledate;
	}
	public void setSaledate(Date saledate) {
		this.saledate = saledate;
	}
	public int getSalepoint() {
		return salepoint;
	}
	public void setSalepoint(int salepoint) {
		this.salepoint = salepoint;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	
}
