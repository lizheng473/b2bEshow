package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.AlbumQueryBean;
import com.logo.eshow.model.Album;
import com.logo.eshow.service.AlbumManager;
import com.logo.eshow.webapp.action.BaseAction;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.util.PageUtil;

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
public class AlbumAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4663487175099570373L;
	private AlbumManager albumManager;
	private List<Album> albums;
	private Album album;
	private AlbumQueryBean queryBean;

	public String list() {
		albums = albumManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Album> page = albumManager
				.search(queryBean, getOffset(), pagesize);
		albums = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		albumManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String view() {
		if (id != null) {
			album = albumManager.get(id);
		} else {
			album = new Album();
		}

		return NONE;
	}

	public String update() throws Exception {
		Album old = albumManager.get(id);
		old.setName(album.getName());
		old.setDescription(album.getDescription());
		albumManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		album.setAddTime(new Date());
		album.setUser(getSessionUser());
		albumManager.save(album);
		saveMessage("添加成功");
		id = album.getId();
		return SUCCESS;
	}

	public AlbumManager getAlbumManager() {
		return albumManager;
	}

	public void setAlbumManager(AlbumManager albumManager) {
		this.albumManager = albumManager;
	}

	public List<Album> getAlbums() {
		return albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public AlbumQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(AlbumQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}