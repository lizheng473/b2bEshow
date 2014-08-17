package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.RoleQueryBean;
import com.logo.eshow.model.Role;
import com.logo.eshow.service.RoleManager;
import com.logo.eshow.webapp.action.BaseAction;

import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

/**
 * 步骤的Action类
 * 
 * @author leida
 */
@Results( {
		@Result(name = "input", value = "add"),
		@Result(name = "list", type = ServletRedirectResult.class, value = ""),
		@Result(name = "success", type = ServletRedirectResult.class, value = "view/${id}"),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class RoleAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4663487175099570373L;
	private RoleManager roleManager;
	private List<Role> roles;
	private Role role;
	private RoleQueryBean queryBean;

	public String list() {
		roles = roleManager.getRoles();
		return LIST;
	}

	public String search() {
		roles = roleManager.getRoles();
		return LIST;
	}

	public String delete() {
		roleManager.remove(id);
		saveMessage(getText("role.deleted"));
		return LIST;
	}

	public String view() {
		if (id != null) {
			role = roleManager.getRole(id);
		}
		return NONE;
	}

	public String update() throws Exception {
		Role old = roleManager.getRole(id);
		old.setName(role.getName());
		old.setDescription(role.getDescription());
		roleManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		roleManager.save(role);
		saveMessage("添加成功");
		id = role.getId();
		return SUCCESS;
	}

	public RoleManager getRoleManager() {
		return roleManager;
	}

	public void setRoleManager(RoleManager roleManager) {
		this.roleManager = roleManager;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public RoleQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(RoleQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}