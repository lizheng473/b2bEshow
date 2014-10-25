package com.logo.eshow.bean.query;

import java.util.Date;

public class ProductionTaskQueryBean extends BaseQueryBean{

	public Integer id ;
	public Integer orderfromid ;
	public Integer  workshopid ;
	public String status   ;
	public Date addTime ;
	public Date endTime ;
	public String comcode ;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderfromid() {
		return orderfromid;
	}
	public void setOrderfromid(Integer orderfromid) {
		this.orderfromid = orderfromid;
	}
	public Integer getWorkshopid() {
		return workshopid;
	}
	public void setWorkshopid(Integer workshopid) {
		this.workshopid = workshopid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getComcode() {
		return comcode;
	}
	public void setComcode(String comcode) {
		this.comcode = comcode;
	}
    
    
}
