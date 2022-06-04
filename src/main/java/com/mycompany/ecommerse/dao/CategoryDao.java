package com.mycompany.ecommerse.dao;

import com.mycompany.ecommerse.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {

    private SessionFactory factroy;

    public CategoryDao(SessionFactory factroy) {
        this.factroy = factroy;
    }

    // save category to database;
   
     

    public int saveCategory(Category cat) {
        try{
        Session session = this.factroy.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
        }catch(Exception e){
            e.printStackTrace();
        } 
        return 0;
        

    }
    
    public List<Category> getCategories(){
        Session s = this.factroy.openSession();
        Query q = s.createQuery("from Category");
        List<Category>list = q.list();
        return list;
    }
    
    public Category getCategoryById(int cid){
        
        Category cat = null;
        try{
            Session session = this.factroy.openSession();
            cat = session.get(Category.class, cid);
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return cat;
    }

}

   

   
    
