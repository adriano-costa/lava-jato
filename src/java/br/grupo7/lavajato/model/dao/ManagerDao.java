/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.grupo7.lavajato.model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Adriano
 */
public class ManagerDao {
    
    private static ManagerDao myself;
    protected EntityManager entityManager;
    
    public static ManagerDao getCurrentInstance(){
        if(myself == null)
            myself = new ManagerDao();
        
        return myself;
    }
    
    private EntityManagerFactory emf = null;
            
    private ManagerDao(){
        this.emf = Persistence.createEntityManagerFactory("lava_jatoPU");
        if (entityManager == null) {
            entityManager = this.emf.createEntityManager();
        }
    } 
    
    public void insert(Object o){
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(o);
        em.getTransaction().commit();
        em.close();
    }
    
    public Object update(Object o){
        EntityManager em = emf.createEntityManager();
        Object newEntity;
        em.getTransaction().begin();
                
        newEntity = em.merge(o);
        em.getTransaction().commit();
        em.close();
        
        return newEntity;
    }
    
    public List read(String query,Class c){
        
        EntityManager em = emf.createEntityManager();
        
        List returnedList = em.createQuery(query,c).getResultList();
        
        em.close();
        
        return returnedList;
    }
    
    public void delete(Object o){
        EntityManager em = emf.createEntityManager();
        Object temp;
        em.getTransaction().begin();
        temp = em.merge(o);
        em.remove(temp);
        em.getTransaction().commit();
        
        em.close();
    }
    
    public List listAll(String query){
        
        EntityManager em = emf.createEntityManager();
        
        List returnedList = em.createQuery(query).getResultList();
        
        em.close();
        
        return returnedList;
    }
    
    
    
}
