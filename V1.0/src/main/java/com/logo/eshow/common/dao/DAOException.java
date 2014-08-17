package com.logo.eshow.common.dao;

/**
 * DAO Exception Create at 2005-3-28
 * <p>
 * 
 * @version 1.0
 * @author shitianyu_kf
 */
public class DAOException extends RuntimeException {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 3257284725541254961L;

	/**
	 * construction
	 * 
	 * @param code
	 *            message
	 * @param cause
	 *            throwable
	 */
	public DAOException(String message, Throwable cause) {

		super(message, cause);

	}
}
