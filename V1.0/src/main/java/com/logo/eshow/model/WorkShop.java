package com.logo.eshow.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "workshop")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Searchable(alias = "WorkShop")
public class WorkShop extends BaseObject implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4417313563984109261L;
	@SearchableId
	private Integer id;
	@SearchableProperty
	private String name;
	private Integer managerid;
	private String managername;
	private String tel;
	private String qq;
	private String valid;
	private String remark;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "managerid")
	public Integer getManagerid() {
		return managerid;
	}

	public void setManagerid(Integer managerid) {
		this.managerid = managerid;
	}

	@Column(name = "managername")
	public String getManagername() {
		return managername;
	}

	public void setManagername(String managername) {
		this.managername = managername;
	}

	@Column(name = "tel")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Column(name = "qq")
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
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
	
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		WorkShop pojo = (WorkShop) o;
		if (managerid != null ? !managerid.equals(pojo.managerid) : pojo.managerid != null)
			return false;
		if (managername != null ? !managername.equals(pojo.managername) : pojo.managername != null)
			return false;
		if (tel != null ? !tel.equals(pojo.tel) : pojo.tel != null)
			return false;
		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		
		return true;
	}

	public int hashCode() {
		int result = 0;
		//result = (managername != null ? managername.hashCode() : 0);
		result = 31 * result + (tel != null ? tel.hashCode() : 0);
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (managerid != null ? managerid.hashCode() : 0);
		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("managerid").append("='").append(getManagerid()).append("', ");
		sb.append("managername").append("='").append(getManagername()).append("', ");
		sb.append("tel").append("='").append(getTel()).append("', ");
		sb.append("qq").append("='").append(getQq()).append(
				"', ");
		sb.append("]");

		return sb.toString();
	}

}
