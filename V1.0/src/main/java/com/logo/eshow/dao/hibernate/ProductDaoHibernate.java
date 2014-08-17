package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.ProductQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ProductDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Product;

public class ProductDaoHibernate extends GenericDaoHibernate<Product, Integer>
		implements ProductDao {

	public ProductDaoHibernate() {
		super(Product.class);
	}

	public List<Product> list(ProductQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Product> search(ProductQueryBean queryBean, int offset,
			int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, ProductQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.addTime != null) {
				rule.add(Restrictions.eq("addTime", queryBean.addTime));
			}
			if (queryBean.name != null) {
				rule.add(Restrictions.eq("name", queryBean.name));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.eq("content", queryBean.content));
			}
			if (queryBean.sequence != null) {
				rule.add(Restrictions.eq("sequence", queryBean.sequence));
			}
			if (queryBean.productCategoryId != null) {
				rule.add(Restrictions.eq("productCategory.id",
						queryBean.productCategoryId));
			}
			if (queryBean.userId != null) {
				rule.add(Restrictions.eq("user.id", queryBean.userId));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
