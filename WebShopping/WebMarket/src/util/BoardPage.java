package util;

public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
		String pagingStr = "";

		// �떒怨� 3 : �쟾泥� �럹�씠吏� �닔 怨꾩궛
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

		// �떒怨� 4 : '�씠�쟾 �럹�씠吏� 釉붾줉 諛붾줈媛�湲�' 異쒕젰
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1) {
			pagingStr += "<li class=page-item><a class=page-link href='" + reqUrl + "?pageNum=1'>[First]</a></li>";
			pagingStr += "&nbsp;";
			pagingStr += "<li class=page-item><a class=page-link href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
					+ "'>[Prev]</a></li>";
		}

		// �떒怨� 5 : 媛� �럹�씠吏� 踰덊샇 異쒕젰 
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				// �쁽�옱 �럹�씠吏��뒗 留곹겕瑜� 嫄몄� �븡�쓬
				pagingStr += "&nbsp;<li class=page-item><a class=page-link href='" + reqUrl + "'>"+pageTemp+"</a></li>&nbsp;";
			} else {
				pagingStr += "&nbsp;<li class=page-item><a class=page-link href='" + reqUrl + "?pageNum=" + pageTemp
						+ "'>" + pageTemp + "</a></li>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}

		// �떒怨� 6 : '�떎�쓬 �럹�씠吏� 釉붾줉 諛붾줈媛�湲�' 異쒕젰
		if (pageTemp <= totalPages) {
			pagingStr += "<li class=page-item><a class=page-link href='" + reqUrl + "?pageNum=" + pageTemp
					+ "'>[Next]</a></li>";
			pagingStr += "&nbsp;";
			pagingStr += "<li class=page-item><a class=page-link href='" + reqUrl + "?pageNum=" + totalPages
					+ "'>[Last]</a></li>";
		}

		return pagingStr;
	}
}