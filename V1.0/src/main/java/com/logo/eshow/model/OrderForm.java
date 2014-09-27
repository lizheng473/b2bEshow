package com.logo.eshow.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "orderform")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Searchable(alias = "OrderForm")
public class OrderForm {
	@SearchableId
	private Integer id;
	
	/**产品尺寸**/
	private String ordersize;
	private int    orderquality  ; //--货物数量
	private double orderamount ; // , --订单价格
	private double realamount ;  // //, --实际价格
	private String customercode;  //varchar(20), --客户代码
	private String customername; // varchar(100), --客户名称
	private String customertel ; // varchar(50),
	private String customeraddress ;// varchar(200),
	private Date addTime; // --订单时间
	private String status;  //char(2),   --订单状态
	//private String userId; //INT(11),    --订单处理人
	private User user; //INT(11),    --订单处理人
	private String comcode ;//char(8),    --供应商代码
	private Integer sequence;
	private int productId;  //产品ID
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "ordersize", length = 0, nullable = false)
	public String getOrdersize() {
		return ordersize;
	}
	
	public void setOrdersize(String ordersize) {
		this.ordersize = ordersize;
	}
	
	@Column(name = "orderquality", length = 0, nullable = false)
	public int getOrderquality() {
		return orderquality;
	}
	
	public void setOrderquality(int orderquality) {
		this.orderquality = orderquality;
	}
	
	@Column(name = "orderamount", length = 0, nullable = false)
	public double getOrderamount() {
		return orderamount;
	}
	
	public void setOrderamount(double orderamount) {
		this.orderamount = orderamount;
	}
	
	@Column(name = "realamount", length = 0, nullable = false)
	public double getRealamount() {
		return realamount;
	}
	
	public void setRealamount(double realamount) {
		this.realamount = realamount;
	}
	
	@Column(name = "customercode", length = 0, nullable = true)
	public String getCustomercode() {
		return customercode;
	}
	
	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}
	
	@Column(name = "customername", length = 0, nullable = true)
	public String getCustomername() {
		return customername;
	}
	
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	
	@Column(name = "customertel", length = 0, nullable = true)
	public String getCustomertel() {
		return customertel;
	}
	
	public void setCustomertel(String customertel) {
		this.customertel = customertel;
	}
	
	@Column(name = "customeraddress", length = 0, nullable = true)
	public String getCustomeraddress() {
		return customeraddress;
	}
	
	public void setCustomeraddress(String customeraddress) {
		this.customeraddress = customeraddress;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	@Column(name = "addTime", length = 0, nullable = false)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}



	@Column(name = "status", length = 0, nullable = true)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "comcode", length = 0, nullable = true)
	public String getComcode() {
		return comcode;
	}

	public void setComcode(String comcode) {
		this.comcode = comcode;
	}

	@Column(name = "productId", length = 0, nullable = true)
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	@Column(name = "sequence")
	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		OrderForm pojo = (OrderForm) o;

		if (addTime != null ? !addTime.equals(pojo.addTime)
				: pojo.addTime != null)
			return false;
	
		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (addTime != null ? addTime.hashCode() : 0);
	

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("]");

		return sb.toString();
	}

}
