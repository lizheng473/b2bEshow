package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.CategoryQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.CategoryDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Category;

public class CategoryDaoHibernate extends
		GenericDaoHibernate<Category, Integer> implements CategoryDao {

	public CategoryDaoHibernate() {
		super(Category.class);
	}

	public List<Category> list(CategoryQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}
	
	public Page<Category> search(CategoryQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, CategoryQueryBean queryBean) {
		if (queryBean != null) {
			
			if (queryBean.addTime != null) {
				rule.add(Restrictions.le("addTime", queryBean.addTime));
			}
			if (queryBean.updateTime != null) {
				rule.add(Restrictions.le("updateTime", queryBean.updateTime));
			}
			if (queryBean.name != null) {
				rule.add(Restrictions.eq("name", queryBean.name));
			}
			if (queryBean.remark != null) {
				rule.add(Restrictions.eq("remark", queryBean.remark));
			}
			if (queryBean.sequence != null) {
				rule.add(Restrictions.eq("sequence", queryBean.sequence));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
