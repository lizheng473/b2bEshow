package com.logo.eshow.model;

import com.logo.eshow.model.BaseObject;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.persistence.Version;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.acegisecurity.GrantedAuthority;
import org.acegisecurity.userdetails.UserDetails;
import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

@Entity
@Table(name = "user", uniqueConstraints = {
		@UniqueConstraint(columnNames = "email"),
		@UniqueConstraint(columnNames = "username") })
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Searchable(alias = "User")
public class User extends BaseObject implements Serializable, UserDetails {
	@SearchableId
	private Integer id;
	private Integer version;
	private Date addTime;
	private Date updateTime;
	private String email;
	@SearchableProperty
	private String username;
	@SearchableProperty
	private String nickname;
	private String password;
	private String confirmPassword;
	@SearchableProperty
	private Integer age;
	private String photo;
	@SearchableProperty
	private String realname;
	private Boolean male;
	private Date birthday;
	private Short constellation;
	private Short birthAttrib;
	private Short bloodType;
	private String hobby;
	@SearchableProperty
	private Short marital;
	@SearchableProperty
	private String intro;
	private boolean accountExpired;
	private boolean accountLocked;
	private boolean credentialsExpired;
	private boolean enabled;
	private Set<Album> albums = new HashSet<Album>(0);
	private Set<BlogComment> blogComments = new HashSet<BlogComment>(0);
	private Set<Blog> blogs = new HashSet<Blog>(0);
	private Set<Photo> photos = new HashSet<Photo>(0);
	private Set<PhotoComment> photoComments = new HashSet<PhotoComment>(0);
	private Set<Service> services = new HashSet<Service>(0);
	private Set<Topic> topics = new HashSet<Topic>(0);
	private Set<TopicComment> topicComments = new HashSet<TopicComment>(0);

	private Set<Role> roles = new HashSet<Role>(0);

	/**
	 * Default constructor - creates a new instance with no values set.
	 */
	public User() {
	}

	/**
	 * Create a new instance and set the username.
	 * 
	 * @param username
	 *            login name for user.
	 */
	public User(final String username) {
		this.username = username;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Version
	public Integer getVersion() {
		return this.version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	@Column(name = "addTime", nullable = false, length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "updateTime", length = 0)
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "email", unique = true, nullable = false, length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "username", unique = true, nullable = false, length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "nickname", nullable = false, length = 50)
	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(name = "password", nullable = false, length = 16)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Transient
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	@Column(name = "age")
	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "photo", length = 50)
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "realname", length = 50)
	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	@Column(name = "male")
	public Boolean getMale() {
		return this.male;
	}

	public void setMale(Boolean male) {
		this.male = male;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birthday", length = 0)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "constellation", length = 2)
	public Short getConstellation() {
		return this.constellation;
	}

	public void setConstellation(Short constellation) {
		this.constellation = constellation;
	}

	@Column(name = "birthAttrib", length = 2)
	public Short getBirthAttrib() {
		return this.birthAttrib;
	}

	public void setBirthAttrib(Short birthAttrib) {
		this.birthAttrib = birthAttrib;
	}

	@Column(name = "marital", length = 1)
	public Short getMarital() {
		return this.marital;
	}

	public void setMarital(Short marital) {
		this.marital = marital;
	}

	@Column(name = "bloodType", length = 1)
	public Short getBloodType() {
		return bloodType;
	}

	public void setBloodType(Short bloodType) {
		this.bloodType = bloodType;
	}

	@Column(name = "hobby", length = 50)
	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	@Column(name = "intro", length = 500)
	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Column(name = "account_expired")
	public boolean isAccountExpired() {
		return this.accountExpired;
	}

	public void setAccountExpired(boolean accountExpired) {
		this.accountExpired = accountExpired;
	}

	/**
	 * @see org.acegisecurity.userdetails.UserDetails#isAccountNonExpired()
	 */
	@Transient
	public boolean isAccountNonExpired() {
		return !isAccountExpired();
	}

	@Column(name = "account_locked")
	public boolean isAccountLocked() {
		return this.accountLocked;
	}

	public void setAccountLocked(boolean accountLocked) {
		this.accountLocked = accountLocked;
	}

	/**
	 * @see org.acegisecurity.userdetails.UserDetails#isAccountNonLocked()
	 */
	@Transient
	public boolean isAccountNonLocked() {
		return !isAccountLocked();
	}

	@Column(name = "credentials_expired")
	public boolean isCredentialsExpired() {
		return this.credentialsExpired;
	}

	public void setCredentialsExpired(boolean credentialsExpired) {
		this.credentialsExpired = credentialsExpired;
	}

	/**
	 * @see org.acegisecurity.userdetails.UserDetails#isCredentialsNonExpired()
	 */
	@Transient
	public boolean isCredentialsNonExpired() {
		return !credentialsExpired;
	}

	@Column(name = "account_enabled")
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Album> getAlbums() {
		return albums;
	}

	public void setAlbums(Set<Album> albums) {
		this.albums = albums;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<BlogComment> getBlogComments() {
		return blogComments;
	}

	public void setBlogComments(Set<BlogComment> blogComments) {
		this.blogComments = blogComments;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(Set<Blog> blogs) {
		this.blogs = blogs;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<Photo> photos) {
		this.photos = photos;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<PhotoComment> getPhotoComments() {
		return photoComments;
	}

	public void setPhotoComments(Set<PhotoComment> photoComments) {
		this.photoComments = photoComments;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Service> getServices() {
		return services;
	}

	public void setServices(Set<Service> services) {
		this.services = services;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Topic> getTopics() {
		return topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<TopicComment> getTopicComments() {
		return topicComments;
	}

	public void setTopicComments(Set<TopicComment> topicComments) {
		this.topicComments = topicComments;
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = @JoinColumn(name = "role_id"))
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	/**
	 * Convert user roles to LabelValue objects for convenience.
	 * 
	 * @return a list of LabelValue objects with role information
	 */
	@Transient
	public List<LabelValue> getRoleList() {
		List<LabelValue> userRoles = new ArrayList<LabelValue>();

		if (this.roles != null) {
			for (Role role : roles) {
				// convert the user's roles to LabelValue Objects
				userRoles.add(new LabelValue(role.getName(), role.getName()));
			}
		}

		return userRoles;
	}

	/**
	 * Adds a role for the user
	 * 
	 * @param role
	 *            the fully instantiated role
	 */
	public void addRole(Role role) {
		getRoles().add(role);
	}

	/**
	 * @see org.acegisecurity.userdetails.UserDetails#getAuthorities()
	 * @return GrantedAuthority[] an array of roles.
	 */
	@Transient
	public GrantedAuthority[] getAuthorities() {
		return roles.toArray(new GrantedAuthority[0]);
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		User pojo = (User) o;

		if (version != null ? !version.equals(pojo.version)
				: pojo.version != null)
			return false;
		if (addTime != null ? !addTime.equals(pojo.addTime)
				: pojo.addTime != null)
			return false;
		if (updateTime != null ? !updateTime.equals(pojo.updateTime)
				: pojo.updateTime != null)
			return false;
		if (username != null ? !username.equals(pojo.username)
				: pojo.username != null)
			return false;
		if (nickname != null ? !nickname.equals(pojo.nickname)
				: pojo.nickname != null)
			return false;
		if (password != null ? !password.equals(pojo.password)
				: pojo.password != null)
			return false;
		if (photo != null ? !photo.equals(pojo.photo) : pojo.photo != null)
			return false;
		if (realname != null ? !realname.equals(pojo.realname)
				: pojo.realname != null)
			return false;
		if (birthday != null ? !birthday.equals(pojo.birthday)
				: pojo.birthday != null)
			return false;
		if (constellation != null ? !constellation.equals(pojo.constellation)
				: pojo.constellation != null)
			return false;
		if (birthAttrib != null ? !birthAttrib.equals(pojo.birthAttrib)
				: pojo.birthAttrib != null)
			return false;
		if (marital != null ? !marital.equals(pojo.marital)
				: pojo.marital != null)
			return false;
		if (intro != null ? !intro.equals(pojo.intro) : pojo.intro != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = (version != null ? version.hashCode() : 0);
		result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
		result = 31 * result + (username != null ? username.hashCode() : 0);
		result = 31 * result + (nickname != null ? nickname.hashCode() : 0);
		result = 31 * result + (password != null ? password.hashCode() : 0);
		result = 31 * result + (photo != null ? photo.hashCode() : 0);
		result = 31 * result + (realname != null ? realname.hashCode() : 0);
		result = 31 * result + (birthday != null ? birthday.hashCode() : 0);
		result = 31 * result
				+ (constellation != null ? constellation.hashCode() : 0);
		result = 31 * result
				+ (birthAttrib != null ? birthAttrib.hashCode() : 0);
		result = 31 * result + (marital != null ? marital.hashCode() : 0);
		result = 31 * result + (intro != null ? intro.hashCode() : 0);
		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("version").append("='").append(getVersion()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("updateTime").append("='").append(getUpdateTime()).append(
				"', ");
		sb.append("username").append("='").append(getUsername()).append("', ");
		sb.append("nickname").append("='").append(getNickname()).append("', ");
		sb.append("password").append("='").append(getPassword()).append("', ");
		sb.append("photo").append("='").append(getPhoto()).append("', ");
		sb.append("realname").append("='").append(getRealname()).append("', ");
		sb.append("birthday").append("='").append(getBirthday()).append("', ");
		sb.append("constellation").append("='").append(getConstellation())
				.append("', ");
		sb.append("birthAttrib").append("='").append(getBirthAttrib()).append(
				"', ");
		sb.append("marital").append("='").append(getMarital()).append("', ");
		sb.append("intro").append("='").append(getIntro()).append("', ");
		sb.append("]");

		GrantedAuthority[] auths = this.getAuthorities();
		if (auths != null) {
			sb.append("Granted Authorities: ");

			for (int i = 0; i < auths.length; i++) {
				if (i > 0) {
					sb.append(", ");
				}
				sb.append(auths[i].toString());
			}
		} else {
			sb.append("No Granted Authorities");
		}
		return sb.toString();
	}

}
