package com.logo.eshow.service.impl;

import org.acegisecurity.providers.dao.DaoAuthenticationProvider;
import org.acegisecurity.providers.encoding.PasswordEncoder;
import org.acegisecurity.userdetails.UsernameNotFoundException;

import com.logo.eshow.bean.query.UserQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.UserDao;
import com.logo.eshow.model.User;
import com.logo.eshow.service.UserExistsException;
import com.logo.eshow.service.UserManager;
import com.logo.eshow.service.UserService;


import org.springframework.beans.factory.annotation.Required;
import org.springframework.dao.DataIntegrityViolationException;

import javax.jws.WebService;
import javax.persistence.EntityExistsException;
import java.util.List;


/**
 * Implementation of UserManager interface.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
@WebService(serviceName = "UserService", endpointInterface = "com.logo.eshow.service.UserService")
public class UserManagerImpl extends UniversalManagerImpl implements UserManager, UserService {
    private UserDao dao;
    private DaoAuthenticationProvider authenticationProvider;

    /**
     * Set the Dao for communication with the data layer.
     * @param dao the UserDao that communicates with the database
     */
    @Required
    public void setUserDao(UserDao dao) {
        this.dao = dao;
    }

    /**
     * Set the DaoAuthenticationProvider object that will provide both the
     * PasswordEncoder and the SaltSource which will be used for password
     * encryption when necessary.
     * @param authenticationProvider the DaoAuthenticationProvider object
     */
    @Required
    public void setAuthenticationProvider(DaoAuthenticationProvider authenticationProvider) {
        this.authenticationProvider = authenticationProvider;
    }

    /**
     * {@inheritDoc}
     */
    public User getUser(Integer userId) {
        return dao.get(userId);
    }

    /**
     * {@inheritDoc}
     */
    public List<User> getUsers() {
        return dao.getUsers();
    }
    
    
    public Page<User> search(UserQueryBean queryBean,int offset, int pagesize) {
		return dao.search(queryBean, offset, pagesize);
	}
    /**
     * {@inheritDoc}
     */
    public User saveUser(User user) throws UserExistsException {

        if (user.getVersion() == null) {
            // if new user, lowercase userId
            user.setUsername(user.getUsername().toLowerCase());
        }
        
        // Get and prepare password management-related artifacts
        boolean passwordChanged = false;
        if (authenticationProvider != null) {
            PasswordEncoder passwordEncoder = authenticationProvider.getPasswordEncoder();

            if (passwordEncoder != null) {
                // Check whether we have to encrypt (or re-encrypt) the password
                if (user.getVersion() == null) {
                    // New user, always encrypt
                    passwordChanged = true;
                } else {
                    // Existing user, check password in DB
                    String currentPassword = dao.getUserPassword(user.getUsername());
                    if (currentPassword == null) {
                        passwordChanged = true;
                    } else {
                        if (!currentPassword.equals(user.getPassword())) {
                            passwordChanged = true;
                        }
                    }
                }

                // If password was changed (or new user), encrypt it
                if (passwordChanged) {
                    user.setPassword(passwordEncoder.encodePassword(user.getPassword(), null));
                }
            } else {
                log.warn("PasswordEncoder not set on AuthenticationProvider, skipping password encryption...");
            }
        } else {
            log.warn("AuthenticationProvider not set, skipping password encryption...");

        }
        
        try {
            return dao.saveUser(user);
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            log.warn(e.getMessage());
            throw new UserExistsException("User '" + user.getUsername() + "' already exists!");
        } catch (EntityExistsException e) { // needed for JPA
            e.printStackTrace();
            log.warn(e.getMessage());
            throw new UserExistsException("User '" + user.getUsername() + "' already exists!");
        }
    }

    /**
     * {@inheritDoc}
     */
    public void removeUser(Integer userId) {
        log.debug("removing user: " + userId);
        dao.remove(userId);
    }

    /**
     * {@inheritDoc}
     * @param username the login name of the human
     * @return User the populated user object
     * @throws UsernameNotFoundException thrown when username not found
     */
    public User getUserByUsername(String username) throws UsernameNotFoundException {
        return (User) dao.loadUserByUsername(username);
    }
    
    /**
	 * {@inheritDoc}
	 */
	public boolean password(String oldPasswd, String password, User user)
			throws UserExistsException {
		// 加密传来的旧密码和数据库中的密码对比
		if (authenticationProvider != null) {
			PasswordEncoder passwordEncoder = authenticationProvider
					.getPasswordEncoder();

			if (passwordEncoder != null) {
				oldPasswd = passwordEncoder.encodePassword(oldPasswd, null);
				if (user.getPassword().equals(oldPasswd)) {
					user.setPassword(passwordEncoder.encodePassword(password,
							null));
					dao.saveUser(user);
					return true;
				} 
			}
		}
		return false;
	}
}
