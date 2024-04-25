package richngo.board.dto;

public class BoardReadDto {
	private String memEmail; // 30123123
	private String qnatype; // 오류
	private String qnatitle; // 어디어디 오류
	private String qnacontent; // 어디어디 오류가 있네요

	@Override
	public String toString() {
		return "BoardInsertDto [memEmail=" + memEmail + ", qnatype=" + qnatype + ", qnatitle=" + qnatitle
				+ ", qnacontent=" + qnacontent + "]";
	}

	public BoardReadDto() {
		super();
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getQnatype() {
		return qnatype;
	}

	public void setQnatype(String qnatype) {
		this.qnatype = qnatype;
	}

	public String getQnatitle() {
		return qnatitle;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public String getQnacontent() {
		return qnacontent;
	}

	public void setQnacontent(String qnacontent) {
		this.qnacontent = qnacontent;
	}
}