package com.gt.model;

public class Page {
	private Integer page;
	private Integer rows;
	private String keyword;
    private Integer[] idkey;
    
	public Integer[] getIdkey() {
		return idkey;
	}

	public void setIdkey(Integer[] idkey) {
		this.idkey = idkey;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

}
