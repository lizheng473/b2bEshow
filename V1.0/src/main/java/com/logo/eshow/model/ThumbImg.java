package com.logo.eshow.model;

import com.logo.eshow.model.BaseObject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "thumb_img")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class ThumbImg extends BaseObject implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Date addTime;
	private Integer height;
	private Integer id;
	private Integer width;
	private String description;
	private String img;
	private String name;
	private String origImg;
	private String type;
	private Boolean enabled;

	
	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	@Column(name = "height")
	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	@Column(name = "width")
	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}
	
	@Column(name = "description", length = 400)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	@Column(name = "img", length = 20)
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	} 
	

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	@Column(name = "origImg", length = 20)
	public String getOrigImg() {
		return origImg;
	}

	public void setOrigImg(String origImg) {
		this.origImg = origImg;
	}

	
	@Column(name = "type", length = 100)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "enabled")
	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ThumbImg pojo = (ThumbImg) o;

		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (description != null ? !description.equals(pojo.description)
				: pojo.description != null)
			return false;
		if (origImg != null ? !origImg.equals(pojo.origImg)
				: pojo.origImg != null)
			return false;
		if (img != null ? !img.equals(pojo.img) : pojo.img != null)
			return false;
		if (id != null ? !id.equals(pojo.id) : pojo.id != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (addTime != null ? addTime.hashCode() : 0);
		result = result + (id != null ? id.hashCode() : 0);
		result = result + (img != null ? img.hashCode() : 0);
		result = result + (name != null ? name.hashCode() : 0);
		result = result + (origImg != null ? origImg.hashCode() : 0);
		result = 31 * result
				+ (description != null ? description.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("origImg").append("='").append(getOrigImg()).append("', ");
		sb.append("img").append("='").append(getImg()).append("', ");
		sb.append("description").append("='").append(getDescription()).append(
				"', ");

		sb.append("]");

		return sb.toString();
	}

}
