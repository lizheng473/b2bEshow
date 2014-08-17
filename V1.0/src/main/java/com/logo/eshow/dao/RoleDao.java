package com.logo.eshow.dao;

import com.logo.eshow.model.Role;


/**
 * Role Data Access Object (DAO) interface.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
public interface RoleDao extends GenericDao<Role, Integer> {
	
	/**
     * Gets role information based on id
     * @param rolename the rolename
     * @return populated role object
     */
    Role getRoleById(Integer id);
    
    /**
     * Gets role information based on rolename
     * @param rolename the rolename
     * @return populated role object
     */
    Role getRoleByName(String rolename);

    /**
     * Removes a role from the database by name
     * @param rolename the role's rolename
     */
    void removeRole(String rolename);
}