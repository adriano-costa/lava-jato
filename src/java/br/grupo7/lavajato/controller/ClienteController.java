/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.grupo7.lavajato.controller;

import br.grupo7.lavajato.model.classes.Cliente;
import br.grupo7.lavajato.model.dao.ManagerDao;
import java.util.List;

/**
 *
 * @author Adriano
 */
public class ClienteController {
    
    public static List buscaClientesNome(String nome){
        return ManagerDao.getCurrentInstance()
                .query("SELECT c FROM Cliente c WHERE c.nome LIKE '%" + nome +"%'");
        
    } 
    
    public static List getLista(){
        return ManagerDao.getCurrentInstance().query("Select c from Cliente c");
    }
    
    public static void salvar(Cliente c){
        ManagerDao.getCurrentInstance().insert(c);
    }
    
    public static void atualizar(Cliente c){
        ManagerDao.getCurrentInstance().update(c);
    }
    
    public static void remover(Cliente c){
        ManagerDao.getCurrentInstance().delete(c);
    }
    
    public static Cliente getById(int id){
        return (Cliente)ManagerDao.getCurrentInstance().read("Select c from Cliente c Where c.id = " + id, Cliente.class).get(0);
    }
    
}
