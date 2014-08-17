package com.logo.eshow.bean.query;



public class ThumbImgQueryBean extends BaseQueryBean {
	
	public Integer height;
  	public Integer width;
	public String  description;
	public String  img;
	public String  name;
	public String  origImg;
	public String  type;
	public Boolean enabled;
	
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public Integer getWidth() {
		return width;
	}
	public void setWidth(Integer width) {
		this.width = width;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrigImg() {
		return origImg;
	}
	public void setOrigImg(String origImg) {
		this.origImg = origImg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	

}