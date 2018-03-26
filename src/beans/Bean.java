package beans;
import java.sql.*;

import java.sql.Connection;
import java.sql.DriverManager;

public class Bean {
	
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String que_no;
	private String answer;
	public  String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	
	public String getQue_no() {
		return que_no;
	}
	public void setQue_no(String que_no) {
		this.que_no = que_no;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}


	
	
}
