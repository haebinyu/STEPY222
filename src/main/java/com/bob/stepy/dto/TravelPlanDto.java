package com.bob.stepy.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TravelPlanDto {
	private int t_plannum;
	private String t_mid;
	private String t_spot;
	private int t_budget;
	private Timestamp t_stdate;
	private Timestamp t_bkdate;
}
