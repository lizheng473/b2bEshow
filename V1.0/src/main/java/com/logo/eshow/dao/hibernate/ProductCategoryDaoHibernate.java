package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.ProductCategoryQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ProductCategoryDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.ProductCategory;

public class ProductCategoryDaoHibernate extends
		GenericDaoHibernate<ProductCategory, Integer> implements
		ProductCategoryDao {

	public ProductCategoryDaoHibernate() {
		super(ProductCategory.class);
	}

	public List<ProductCategory> list(ProductCategoryQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<ProductCategory> search(ProductCategoryQueryBean queryBean,
			int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule,
			ProductCategoryQueryBean queryBean) {

		if (queryBean != null) {
			if (queryBean.name != null) {
				rule.add(Restrictions.like("name", queryBean.name,
						MatchMode.ANYWHERE));
			}
			if (queryBean.description != null) {
				rule.add(Restrictions.like("description",
						queryBean.description, MatchMode.ANYWHERE));
			}
			if (queryBean.sequence != null) {
				rule.add(Restrictions.eq("sequence", queryBean.sequence));
			}
		}
		return rule;
	}
}
