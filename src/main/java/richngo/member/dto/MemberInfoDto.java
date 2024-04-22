package richngo.member.dto;

public class MemberInfoDto {

	private String memEmail;
	
	@Override
	public String toString() {
		return "MemberDto [memEmail=" + memEmail + "]";
	}
	public MemberInfoDto(String memEmail) {
		super();
		this.memEmail = memEmail;
	}

	public String getMemEmail() {
		return memEmail;
	}
}
