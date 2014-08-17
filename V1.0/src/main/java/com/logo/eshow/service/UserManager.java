package com.logo.eshow.service;

import java.util.List;

import org.acegisecurity.userdetails.UsernameNotFoundException;

import com.logo.eshow.bean.query.UserQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.UserDao;
import com.logo.eshow.model.User;

/**
 * Business Service Interface to handle communication between web and
 * persistence layer.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 *  Modified by <a href="mailto:dan@getrolling.com">Dan Kibler </a> 
 */
public interface UserManager extends UniversalManager {

    /**
     * Convenience method for testing - allows you to mock the DAO and set it on an interface.
     * @param userDao the UserDao implementation to use
     */
    void setUserDao(UserDao userDao);

    /**
     * Retrieves a user by userId.  An exception is thrown if user not found
     *
     * @param userId the identifier for the user
     * @return User
     */
    User getUser(Integer userId);

    /**
     * Finds a user by their username.
     * @param username the user's username used to login
     * @return User a populated user object
     * @throws org.acegisecurity.userdetails.UsernameNotFoundException
     *         exception thrown when user not found
     */
    User getUserByUsername(String username) throws UsernameNotFoundException;

    /**
     * Retrieves a list of users, filtering with parameters on a user object
     * @param user parameters to filter on
     * @return List
     */
    Page<User> search(UserQueryBean queryBean, int offset, int pagesize);
    
    List<User> getUsers();

    /**
	 * 修改密码是否成功
	 */
	boolean password(String oldPasswd, String password, User user)
			throws UserExistsException;
    
    /**
     * Saves a user's information.
     *
     * @param user the user's information
     * @throws UserExistsException thrown when user already exists
     * @return user the updated user object
     */
    User saveUser(User user) throws UserExistsException;

    /**
     * Removes a user from the database by their userId
     *
     * @param userId the user's id
     */
    void removeUser(Integer userId);
}
