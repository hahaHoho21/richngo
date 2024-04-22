package richngo.member.dto;

public class MemberLoginDto {
	
	
	private String memEmail;
	private String memPwd;
	
	@Override
	public String toString() {
		return "MemberLoginDto [memEmail=" + memEmail + ", memPwd=" + memPwd + "]";
	}
	public MemberLoginDto(String memEmail, String memPwd) {
		super();
		this.memEmail = memEmail;
		this.memPwd = memPwd;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public String getMemPwd() {
		return memPwd;
	}
	
	
}
