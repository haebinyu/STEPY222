package com.bob.stepy.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class StoreReviewDto {
	private int sr_num;
	private String sr_mid;
	private String sr_cnum;
	private int sr_rate;
	private Timestamp sr_date;
	private String sr_contents;
	private int sr_report;
}
