package org.cc.domain;

import lombok.Data;

@Data
public class MemberAttachVO {
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 회원 id */
	private String userId;
	
	private boolean fileType;
}
