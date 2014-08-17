package com.logo.eshow.model;

import com.logo.eshow.model.BaseObject;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

@Entity
@Table(name = "service_type")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Searchable(alias = "ServiceType")
public class ServiceType extends BaseObject implements Serializable {
	@SearchableId
	private Integer id;
	@SearchableProperty
	private String name;
	@SearchableProperty
	private String remark;
	private Integer sequence;
	private Set<Service> services = new HashSet<Service>(0);

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "remark", length = 400)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "sequence")
	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "serviceType")
	public Set<Service> getService() {
		return services;
	}

	public void setService(Set<Service> service) {
		this.services = services;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ServiceType pojo = (ServiceType) o;

		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (remark != null ? !remark.equals(pojo.remark) : pojo.remark != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (remark != null ? remark.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("remark").append("='").append(getRemark()).append("', ");

		sb.append("]");

		return sb.toString();
	}

}
