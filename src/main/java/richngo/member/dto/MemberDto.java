package richngo.member.dto;

public class MemberDto {

	private String memCode;
	private String memEmail;
	private String memPwd;
	
	@Override
	public String toString() {
		return "MemberDto [memCode=SUBSTR(ABS(DBMS_RANDOM.RANDOM),1,8)||TO_CHAR(SYSTIMESTAMP, 'SSmmHHYYMMDD')" + ", memEmail=" + memEmail + ", memPwd=" + memPwd + "]";
	}
	public MemberDto(String memCode, String memEmail, String memPwd) {
		super();
		this.memCode = memCode;
		this.memPwd = memPwd;
		this.memEmail = memEmail;
	}
	public String getMemCode() {
		return memCode;
	}

	public String getMemPwd() {
		return memPwd;
	}
	
	public String getMemEmail() {
		return memEmail;
	}
	
}
