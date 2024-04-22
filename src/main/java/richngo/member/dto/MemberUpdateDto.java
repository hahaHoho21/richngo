package richngo.member.dto;

public class MemberUpdateDto {
	private String memPwd;
	private String memPwdNew;
	private String memEmail;
	
	@Override
	public String toString() {
		return "MemberUpdateDto [memPwd=" + memPwd + ", memPwdNew=" + memPwdNew + ", memEmail="
				+ memEmail + "]";
	}
	public MemberUpdateDto(String memPwd, String memPwdNew, String memEmail) {
		super();
		this.memPwd = memPwd;
		this.memPwdNew = memPwdNew;
		this.memEmail = memEmail;
	}

	public String getMemPwd() {
		return memPwd;
	}
	public String getMemPwdNew() {
		return memPwdNew;
	}
	public String getMemEmail() {
		return memEmail;
	}
	
	
}
