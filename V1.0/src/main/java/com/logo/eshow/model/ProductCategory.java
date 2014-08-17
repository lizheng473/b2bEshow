package com.logo.eshow.model;

import com.logo.eshow.model.BaseObject;

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
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "product_category")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Searchable(alias = "ProductCategory")
public class ProductCategory extends BaseObject implements Serializable {
	@SearchableId
	private Integer id;
	@SearchableProperty
	private String name;
	@SearchableProperty
	private String description;
	private Integer sequence;
	private Set<Product> products = new HashSet<Product>(0);

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

	@Column(name = "description", length = 400)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "sequence")
	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "productCategory")
	public Set<Product> getProducts() {
		return products;
	}
	/*
	 * @OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "board")
	public Set<Topic> getTopics() {
		return topics;
	}
	 */

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ProductCategory pojo = (ProductCategory) o;

		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (description != null ? !description.equals(pojo.description) : pojo.description != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (description != null ? description.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("description").append("='").append(getDescription()).append("', ");

		sb.append("]");

		return sb.toString();
	}

}
