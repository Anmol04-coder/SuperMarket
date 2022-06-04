
package com.mycompany.ecommerse.dao;

import com.mycompany.ecommerse.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class ProductDao {
    private SessionFactory factroy;

    public ProductDao(SessionFactory factroy) {
        this.factroy = factroy;
    }
    
    public boolean saveProduct(Product product){
        boolean f = false;
        try{
            Session session = this.factroy.openSession();
            Transaction tx = session.beginTransaction();
            
            session.save(product);
            session.close();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
            f = false;
        }
        return f;
    }
    
    //get All Products
    
    public List<Product> getAllProducts() {
        Session s = this.factroy.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    // get All product of given category
    
    public List<Product> getAllProductsById(int cid) {
        Session s = this.factroy.openSession();
        Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;
    }
    
    
}
