package com.fokefoke.dto;

import lombok.Getter;
import lombok.ToString;

/*교재 306p 참고*/

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Paging page;
	
	public PageDTO(Paging page, int total) {
		this.page = page;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(page.getPageNum() / 3.0)) * 3;
		this.startPage = this.endPage - 2;
		
		int realEnd = (int) (Math.ceil((total*1.0)/page.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage < realEnd;
	}

}
