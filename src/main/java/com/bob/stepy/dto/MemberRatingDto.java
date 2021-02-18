package com.bob.stepy.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberRatingDto {

	private int sr_num;
	private String sr_mid;
	private String sr_cnum;
	private int sr_rate;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp sr_date;
	private String sr_contents;
	private int sr_report;
	private float rou;
	private String f_oriname;
	private String f_sysname;
	
}
