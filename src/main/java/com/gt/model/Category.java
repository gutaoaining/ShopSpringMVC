package com.gt.model;

public class Category {
	
	private Account account;
	
	
    public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	private Integer id;

    private String type;

    private Boolean hot;

    private Integer aid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Boolean getHot() {
        return hot;
    }

    public void setHot(Boolean hot) {
        this.hot = hot;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

	@Override
	public String toString() {
		return "Category [account=" + account + ", id=" + id + ", type=" + type + ", hot=" + hot + ", aid=" + aid + "]";
	}
    
}