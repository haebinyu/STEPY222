package com.bob.stepy.dto;

import lombok.Data;

@Data
public class CheckListDto {
	private long cl_planNum;
	private long cl_category;
	private String cl_categoryname;
	private long cl_cnt;
	private String cl_item;
	private long cl_check;
}
