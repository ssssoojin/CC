package org.cc.domain;

import lombok.Data;

@Data
public class CustomAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int itemNo;
}
