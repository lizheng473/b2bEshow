package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.PhotoQueryBean;
import com.logo.eshow.model.Photo;
import com.logo.eshow.service.AlbumManager;
import com.logo.eshow.service.PhotoManager;
import com.logo.eshow.model.Album;
import com.logo.eshow.model.User;
import com.logo.eshow.util.CommonUtil;
import com.logo.eshow.util.DateUtil;
import com.logo.eshow.util.ImageUtil;
import com.logo.eshow.util.PageUtil;
import com.logo.eshow.common.CommonVar;
import com.logo.eshow.common.page.Page;

import java.util.Date;
import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

@Results( {
		@Result(name = "input", value = "add"),
		@Result(name = "list", type = ServletRedirectResult.class, value = ""),
		@Result(name = "success", type = ServletRedirectResult.class, value = "view/${id}"),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class PhotoAction extends BaseFileUploadAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PhotoManager photoManager;
	private AlbumManager albumManager;
	private List<Photo> photos;
	private Photo photo;
	private PhotoQueryBean queryBean = new PhotoQueryBean();
	private Integer albumId;

	public String list() {
		photos = photoManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Photo> page = photoManager
				.search(queryBean, getOffset(), pagesize);
		photos = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		Photo photo = photoManager.get(id);
		if(photo.getUser().equals(getSessionUser())){
		 Album album = photo.getAlbum();
		 album.setPhotoSize(album.getPhotoSize()-CommonVar.STEP);
		 albumManager.save(album);
		 photoManager.remove(id);
		 saveMessage("删除成功");
		}else{
			saveMessage("无权删除");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			photo = photoManager.get(id);
		}
		return NONE;
	}

	public String update() throws Exception {
		Photo old = photoManager.get(id);
		old.setName(photo.getName());
		old.setDescription(photo.getDescription());
		if (albumId != null) {
			old.setAlbum(albumManager.get(albumId));
		}
		if (file != null) {
			String path = "upload/photo/"
					+ DateUtil.getDateTime("yyyyMMdd", old.getAddTime()) + "/";
			String fileName = old.getId() + ".jpg";
			ImageUtil.uploadImage(path, fileName, file, 200, 150, "zoom");
			old.setImg(fileName);
			ImageUtil.resizeImage(path + "view/", path + "orig/", fileName,
					600, 600, "zoom");
		}
		photoManager.save(old);
		saveMessage("图片修改成功");
		return SUCCESS;

	}

	public String save() throws Exception {
		photo.setAddTime(new Date());
		Album album = albumManager.get(albumId);
		photo.setAlbum(album);
		photo.setCommentSize(CommonVar.DEFAULT);
		User user = getSessionUser();
		photo.setUser(user);
		photo = photoManager.save(photo);

		if (file != null) {
			String path = "upload/photo/"
					+ DateUtil.getDateTime("yyyyMMdd", photo.getAddTime())
					+ "/";
			String fileName = photo.getId() + ".jpg";
			ImageUtil.uploadImage(path, fileName, file, 200, 150, "zoom");
			photo.setImg(fileName);
			ImageUtil.resizeImage(path + "view/", path + "orig/", fileName,
					600, 600, "zoom");
			album.setPhotoSize(CommonUtil.count(album.getPhotoSize()));
			album.setPhoto(DateUtil.getDateTime("yyyyMMdd", photo.getAddTime())
					+ "/" + fileName);
			photo.setAlbum(album);
			photoManager.save(photo);
		}

		saveMessage("新图片上传成功");
		id = photo.getId();
		return SUCCESS;
	}

	public PhotoManager getPhotoManager() {
		return photoManager;
	}

	public void setPhotoManager(PhotoManager photoManager) {
		this.photoManager = photoManager;
	}

	public AlbumManager getAlbumManager() {
		return albumManager;
	}

	public void setAlbumManager(AlbumManager albumManager) {
		this.albumManager = albumManager;
	}

	public List<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public PhotoQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(PhotoQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

}