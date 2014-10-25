package com.logo.eshow.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "productiontask")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Searchable(alias = "ProductionTask")
public class ProductionTask {

	@SearchableId
	private Integer id ;
	private Integer orderfromid ;
	private Integer  workshopid ;
    private String status   ;
    private Date addTime ;
    private Date endTime ;
    private String operateuserid   ;
    private String operateusername ;
    private String comcode ;
    private String valid ;
    private String remark;
    
    @Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "orderfromid")
	public Integer getOrderfromid() {
		return orderfromid;
	}
	public void setOrderfromid(Integer orderfromid) {
		this.orderfromid = orderfromid;
	}
	
	@Column(name = "workshopid")
	public Integer getWorkshopid() {
		return workshopid;
	}
	public void setWorkshopid(Integer workshopid) {
		this.workshopid = workshopid;
	}
	
	@Column(name = "status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name = "addTime")
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	@Column(name = "endTime")
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Column(name = "operateuserid")
	public String getOperateuserid() {
		return operateuserid;
	}
	public void setOperateuserid(String operateuserid) {
		this.operateuserid = operateuserid;
	}
	
	@Column(name = "operateusername")
	public String getOperateusername() {
		return operateusername;
	}
	public void setOperateusername(String operateusername) {
		this.operateusername = operateusername;
	}
	
	@Column(name = "comcode")
	public String getComcode() {
		return comcode;
	}
	public void setComcode(String comcode) {
		this.comcode = comcode;
	}
	
	@Column(name = "valid")
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
    
    
    
}
