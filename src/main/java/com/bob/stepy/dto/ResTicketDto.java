package com.bob.stepy.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ResTicketDto {
	private int res_num;
	private Timestamp res_date;
	private String res_plnum;
	private String res_mid;
	private String res_content;
	private int res_qty;
	private Timestamp res_checkindate;
	private Timestamp res_checkoutdate;
	private int res_mcount;
	private int res_status;
	private Timestamp res_time;
}
