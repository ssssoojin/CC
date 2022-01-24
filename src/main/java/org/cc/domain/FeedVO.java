package org.cc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FeedVO {
	private Long feedNo;
	private String title;
	private String description;
	private String imgTop;
	private String imgBottom;
	private String imgAccCustom;
	private String imgAccReal;
	private String color;
	private String size;
	private Date regDate;
	private Date updateDate;
	private String userId;
	private int hit;
}
