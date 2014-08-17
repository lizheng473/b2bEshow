package com.logo.eshow.service.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.Expression;

import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.service.GenericManager;

/**
 * This class serves as the Base class for all other Managers - namely to hold
 * common CRUD methods that they might all use. You should only need to extend
 * this class when your require custom CRUD logic.
 *
 * <p>To register this class in your Spring context file, use the following XML.
 * <pre>
 *     &lt;bean id="userManager" class="com.logo.eshow.service.impl.GenericManagerImpl"&gt;
 *         &lt;constructor-arg&gt;
 *             &lt;bean class="com.logo.eshow.dao.hibernate.GenericDaoHibernate"&gt;
 *                 &lt;constructor-arg value="com.logo.eshow.model.User"/&gt;
 *                 &lt;property name="sessionFactory" ref="sessionFactory"/&gt;
 *             &lt;/bean&gt;
 *         &lt;/constructor-arg&gt;
 *     &lt;/bean&gt;
 * </pre>
 *
 * <p>If you're using iBATIS instead of Hibernate, use:
 * <pre>
 *     &lt;bean id="userManager" class="com.logo.eshow.service.impl.GenericManagerImpl"&gt;
 *         &lt;constructor-arg&gt;
 *             &lt;bean class="com.logo.eshow.dao.ibatis.GenericDaoiBatis"&gt;
 *                 &lt;constructor-arg value="com.logo.eshow.model.User"/&gt;
 *                 &lt;property name="dataSource" ref="dataSource"/&gt;
 *                 &lt;property name="sqlMapClient" ref="sqlMapClient"/&gt;
 *             &lt;/bean&gt;
 *         &lt;/constructor-arg&gt;
 *     &lt;/bean&gt;
 * </pre>
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 * @param <T> a type variable
 * @param <PK> the primary key for that type
 */
public class GenericManagerImpl<T, PK extends Serializable> implements GenericManager<T, PK> {
    /**
     * Log variable for all child classes. Uses LogFactory.getLog(getClass()) from Commons Logging
     */
    protected final Log log = LogFactory.getLog(getClass());

    /**
     * GenericDao instance, set by constructor of this class
     */
    protected GenericDao<T, PK> genericDao;

    /**
     * Public constructor for creating a new GenericManagerImpl.
     * @param genericDao the GenericDao to use for persistence
     */
    public GenericManagerImpl(final GenericDao<T, PK> genericDao) {
        this.genericDao = genericDao;
    }

    /**
     * {@inheritDoc}
     */
    public List<T> getAll() {
        return genericDao.getAll();
    }

    /**
     * {@inheritDoc}
     */
    public T get(PK id) {
        return genericDao.get(id);
    }
    
    /**
     * {@inheritDoc}
     */
    public T getBy(String object, String value)
	{
		EnhancedRule rule = new EnhancedRule();
		rule.add(Expression.eq(object, value));
		return genericDao.uniqueResult(rule);
	}

    /**
     * {@inheritDoc}
     */
    public boolean exists(PK id) {
        return genericDao.exists(id);
    }

    /**
     * {@inheritDoc}
     */
    public T save(T object) {
        return genericDao.save(object);
    }

    /**
     * {@inheritDoc}
     */
    public void remove(PK id) {
        genericDao.remove(id);
    }

	public List<T> list(String order, int count) {
		return genericDao.list(order, count);
	}
	
	public T exists(String name)
	{
		EnhancedRule rule = new EnhancedRule();
		rule.add(Expression.eq("name", name));
		return genericDao.uniqueResult(rule);
	}
	
}
