package com.logo.eshow.webapp.action;

import org.acegisecurity.AccessDeniedException;
import org.acegisecurity.context.SecurityContextHolder;
import org.acegisecurity.providers.UsernamePasswordAuthenticationToken;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

import com.logo.eshow.Constants;
import com.logo.eshow.model.User;
import com.logo.eshow.service.UserExistsException;
import com.logo.eshow.util.StringUtil;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Action to allow new users to sign up.
 */
@Results( {
		@Result(name = "input", value = "signup"),
		@Result(name = "success", type = ServletRedirectResult.class, value = "login") })
public class SignupAction extends BaseAction {
	private static final long serialVersionUID = 6558317334878272308L;
	private User user;
	private String cancel;

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * Return an instance of the user - to display when validation errors occur
	 * 
	 * @return a populated user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * When method=GET, "input" is returned. Otherwise, "success" is returned.
	 * 
	 * @return cancel, input or success
	 * @throws Exception
	 */
	public String execute() throws Exception {
		if (cancel != null) {
			return CANCEL;
		}
		if (ServletActionContext.getRequest().getMethod().equals("GET")) {
			return INPUT;
		}
		return save();
	}

	/**
	 * Returns "input"
	 * 
	 * @return "input" by default
	 */
	public String doDefault() {
		return INPUT;
	}

	/**
	 * Save the user, encrypting their passwords if necessary
	 * 
	 * @return success when good things happen
	 * @throws Exception
	 *             when bad things happen
	 */
	public String save() throws Exception {
		Boolean encrypt = (Boolean) getConfiguration().get(
				Constants.ENCRYPT_PASSWORD);

		if (encrypt != null && encrypt) {
			String algorithm = (String) getConfiguration().get(
					Constants.ENC_ALGORITHM);

			if (algorithm == null) { // should only happen for test case
				if (log.isDebugEnabled()) {
					log.debug("assuming testcase, setting algorithm to 'SHA'");
				}
				algorithm = "SHA";
			}

			user.setPassword(StringUtil.encodePassword(user.getPassword(),
					algorithm));
		}

		// Set the default user role on this new user
		user.addRole(roleManager.getRole(Constants.USER_ROLE));

		try {
			user.setAddTime(new Date());
			user.setUpdateTime(new Date());
			user.setEnabled(Boolean.TRUE);
			userManager.saveUser(user);
		} catch (AccessDeniedException ade) {
			// thrown by UserSecurityAdvice configured in aop:advisor
			// userManagerSecurity
			log.warn(ade.getMessage());
			getResponse().sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		} catch (UserExistsException e) {
			log.warn(e.getMessage());
			List<String> args = new ArrayList<String>();
			args.add(user.getUsername());
			args.add(user.getEmail());
			addActionError(getText("errors.existing.user", args));

			// redisplay the unencrypted passwords
			user.setPassword(user.getPassword());
			return INPUT;
		}

		saveMessage(getText("user.registered"));
		getSession().setAttribute(Constants.REGISTERED, Boolean.TRUE);

		// log user in automatically
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
				user, user.getPassword(), user.getAuthorities());
		auth.setDetails(user);
		SecurityContextHolder.getContext().setAuthentication(auth);
		return SUCCESS;
	}
}
