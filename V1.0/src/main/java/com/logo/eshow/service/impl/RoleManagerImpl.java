package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.dao.RoleDao;
import com.logo.eshow.model.Role;
import com.logo.eshow.service.RoleManager;

/**
 * Implementation of RoleManager interface.
 * 
 * @author <a href="mailto:dan@getrolling.com">Dan Kibler</a>
 */
public class RoleManagerImpl extends UniversalManagerImpl implements RoleManager {
    private RoleDao dao;

    public void setRoleDao(RoleDao dao) {
        this.dao = dao;
    }

    /**
     * {@inheritDoc}
     */
    public List<Role> getRoles() {
        return dao.getAll();
    }

    /**
     * {@inheritDoc}
     */
    public Role getRole(Integer id) {
        return dao.getRoleById(id);
    }
    
    /**
     * {@inheritDoc}
     */
    public Role getRole(String rolename) {
        return dao.getRoleByName(rolename);
    }

    /**
     * {@inheritDoc}
     */
    public Role saveRole(Role role) {
        return dao.save(role);
    }
    
    /**
     * {@inheritDoc}
     */
    public void remove(Integer id) {
        dao.remove(id);
    }

    /**
     * {@inheritDoc}
     */
    public void removeRole(String rolename) {
        dao.removeRole(rolename);
    }
}