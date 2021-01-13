package com.bob.stepy.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ResTicketDto {
	private int res_num;
	private Timestamp res_date;
	private String res_cnum;
	private String res_mid;
	private String res_content;
	private int res_qty;
}
