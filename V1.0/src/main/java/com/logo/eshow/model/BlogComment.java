package com.logo.eshow.model;

import com.logo.eshow.model.BaseObject;
import com.logo.eshow.model.User;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableComponent;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

@Entity
@Table(name = "blog_comment")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Searchable(alias = "BlogComment")
public class BlogComment extends BaseObject implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5032303242094188729L;
	@SearchableId
	private Integer id;
	private User user;
	@SearchableComponent
	private Blog blog;
	private Date addTime;
	@SearchableProperty
	private String name;
	@SearchableProperty
	private String content;
	@SearchableProperty
	private String ip;
	@SearchableProperty
	private String im;
	@SearchableProperty
	private String email;
	@SearchableProperty
	private String website;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "blogId")
	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "content", length = 400)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "ip", length = 20)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "im", length = 50)
	public String getIm() {
		return this.im;
	}

	public void setIm(String im) {
		this.im = im;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "website", length = 50)
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		BlogComment pojo = (BlogComment) o;

		if (user != null ? !user.equals(pojo.user) : pojo.user != null)
			return false;
		if (addTime != null ? !addTime.equals(pojo.addTime)
				: pojo.addTime != null)
			return false;
		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (content != null ? !content.equals(pojo.content)
				: pojo.content != null)
			return false;
		if (ip != null ? !ip.equals(pojo.ip) : pojo.ip != null)
			return false;
		if (im != null ? !im.equals(pojo.im) : pojo.im != null)
			return false;
		if (email != null ? !email.equals(pojo.email) : pojo.email != null)
			return false;
		if (website != null ? !website.equals(pojo.website)
				: pojo.website != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (user != null ? user.hashCode() : 0);
		result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result + (ip != null ? ip.hashCode() : 0);
		result = 31 * result + (im != null ? im.hashCode() : 0);
		result = 31 * result + (email != null ? email.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);
		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("user").append("='").append(getUser()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("content").append("='").append(getContent()).append("', ");
		sb.append("ip").append("='").append(getIp()).append("', ");
		sb.append("im").append("='").append(getIm()).append("', ");
		sb.append("email").append("='").append(getEmail()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("]");

		return sb.toString();
	}

}
