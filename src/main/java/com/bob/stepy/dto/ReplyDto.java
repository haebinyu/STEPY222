package com.bob.stepy.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyDto {
	private int r_num;
	private String r_contents;
	private String r_secret;
	private Timestamp r_date;
	private String r_id;
	private int r_pnum;
}
