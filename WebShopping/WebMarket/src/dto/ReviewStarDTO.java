package dto;

import java.util.Date;

public class ReviewStarDTO {
	private String m_id;
	private String p_id;
	private String content;
	private String star;
	private String index;
	private Date postdate_ymd;
	private Date postdate_hms;
	private String title;
	
	public ReviewStarDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewStarDTO(String m_id, String p_id, String content, String star, String index, Date postdate_ymd,
			Date postdate_hms, String title) {
		super();
		this.m_id = m_id;
		this.p_id = p_id;
		this.content = content;
		this.star = star;
		this.index = index;
		this.postdate_ymd = postdate_ymd;
		this.postdate_hms = postdate_hms;
		this.title = title;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public Date getPostdate_ymd() {
		return postdate_ymd;
	}

	public void setPostdate_ymd(Date postdate_ymd) {
		this.postdate_ymd = postdate_ymd;
	}

	public Date getPostdate_hms() {
		return postdate_hms;
	}

	public void setPostdate_hms(Date postdate_hms) {
		this.postdate_hms = postdate_hms;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "ReviewStarDTO [m_id=" + m_id + ", p_id=" + p_id + ", content=" + content + ", star=" + star + ", index="
				+ index + ", postdate_ymd=" + postdate_ymd + ", postdate_hms=" + postdate_hms + ", title=" + title
				+ "]";
	}

	











	
	
}
