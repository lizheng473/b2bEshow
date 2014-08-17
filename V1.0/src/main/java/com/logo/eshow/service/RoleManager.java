package com.logo.eshow.service;

import com.logo.eshow.model.Role;

import java.util.List;

/**
 * Business Service Interface to handle communication between web and
 * persistence layer.
 *
 * @author <a href="mailto:dan@getrolling.com">Dan Kibler </a>
 */
public interface RoleManager extends UniversalManager {
    /**
     * {@inheritDoc}
     */
    List<Role> getRoles();
    
    /**
     * {@inheritDoc}
     */
    Role getRole(Integer id);

    /**
     * {@inheritDoc}
     */
    Role getRole(String rolename);

    /**
     * {@inheritDoc}
     */
    Role saveRole(Role role);
    
    /**
     * {@inheritDoc}
     */
    void remove(Integer id);

    /**
     * {@inheritDoc}
     */
    void removeRole(String rolename);
}
