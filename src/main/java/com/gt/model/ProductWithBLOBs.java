package com.gt.model;

public class ProductWithBLOBs extends Product {
    private String remark;

    private String xremark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getXremark() {
        return xremark;
    }

    public void setXremark(String xremark) {
        this.xremark = xremark == null ? null : xremark.trim();
    }
}