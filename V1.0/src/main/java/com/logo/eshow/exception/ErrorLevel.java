package com.logo.eshow.exception;

/**
 * <p>异常等级 。</p>
 * 
 * @author <a href="mailto:webeasymail@163.com">Legend Huang</a>
 * @version 1.0
 */
public final class ErrorLevel {
	
	private final String level;

	private ErrorLevel(String level) {
		this.level = level;
	}

	/**
	 * Returns the description of ErrorLevel
	 */
	@Override
	public String toString() {
		return level;
	}
	public static final ErrorLevel ERROR = new ErrorLevel("ERROR");

	public static final ErrorLevel FATAL = new ErrorLevel("FATAL");

	public static final ErrorLevel WARN = new ErrorLevel("WARN");

}
