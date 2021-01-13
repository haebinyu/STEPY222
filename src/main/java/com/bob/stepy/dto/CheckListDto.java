package com.bob.stepy.dto;

import lombok.Data;

@Data
public class CheckListDto {
	private int cl_num;
	private String cl_item;
	private String cl_contents;
	private String cl_check;
	private int cl_plannum;
	private String cl_mid;
}
