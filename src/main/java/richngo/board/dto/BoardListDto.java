package richngo.board.dto;

public class BoardListDto {
	private String boardId; // 23
	private String writeTime; // TIMESTAMP
	private String memEmail; // 30123123
	private String qnatype; // 오류
	private String qnatitle; // 어디어디 오류
	private String qnacontent; // 어디어디 오류가 있네요
	private String processingStatus; // 처리중 or 답변완료
	private String completeTime; // TIMESTAMP

	@Override
	public String toString() {
		return "BoardDto [boardId=" + boardId + ", writeTime=" + writeTime + ", memEmail=" + memEmail + ", qnatype="
				+ qnatype + ", qnatitle=" + qnatitle + ", qnacontent=" + qnacontent + ", processingStatus="
				+ processingStatus + ", completeTime=" + completeTime + "]";
	}

	public BoardListDto(String boardId, String writeTime, String memEmail, String qnatype, String qnatitle,
			String qnacontent, String processingStatus, String completeTime) {
		super();
		this.boardId = boardId;
		this.writeTime = writeTime;
		this.memEmail = memEmail;
		this.qnatype = qnatype;
		this.qnatitle = qnatitle;
		this.qnacontent = qnacontent;
		this.processingStatus = processingStatus;
		this.completeTime = completeTime;
	}

	public String getBoardId() {
		return boardId;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public String getQnatype() {
		return qnatype;
	}

	public String getQnatitle() {
		return qnatitle;
	}

	public String getQnacontent() {
		return qnacontent;
	}

	public String getProcessingStatus() {
		return processingStatus;
	}

	public String getCompleteTime() {
		return completeTime;
	}
}
