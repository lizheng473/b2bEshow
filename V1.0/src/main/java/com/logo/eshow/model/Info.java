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

@Entity
@Table(name = "info")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Info extends BaseObject implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8595503517379467249L;
	private Integer id;
	private String type;
	private String title;
	private String url;
	private String content;
	private Boolean enable;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	@Column(name = "type", length = 20)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "url", length = 50)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "title", length = 200)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "enable")
	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Info pojo = (Info) o;

		if (title != null ? !title.equals(pojo.title) : pojo.title != null)
			return false;
		if (content != null ? !content.equals(pojo.content)
				: pojo.content != null)
			return false;
		if (enable != null ? !enable.equals(pojo.enable) : pojo.enable != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (title != null ? title.hashCode() : 0);
		result = 31 * result + (url != null ? url.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result + (enable != null ? enable.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("url").append("='").append(getUrl()).append("', ");
		sb.append("title").append("='").append(getTitle()).append("', ");
		sb.append("content").append("='").append(getContent()).append("', ");
		sb.append("enable").append("='").append(getEnable()).append("', ");
		sb.append("]");

		return sb.toString();
	}



}
