package com.bob.stepy.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class HouseHoldDto {
	private int h_num;
	private Timestamp h_date;
	private String h_category;
	private int h_sum;
	private int h_bodget;
	private int h_balance;
	private String h_note;
	private int h_plannum;
}
