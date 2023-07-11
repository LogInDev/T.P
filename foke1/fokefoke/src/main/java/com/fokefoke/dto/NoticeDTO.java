package com.fokefoke.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	int noticeId;
	String noticeTitle;
	String noticeContent;
	Date noticeDate;
	String noticeImage;
	String noticeState;
}
