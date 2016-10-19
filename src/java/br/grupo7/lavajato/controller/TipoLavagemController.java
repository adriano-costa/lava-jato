/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.grupo7.lavajato.controller;

import br.grupo7.lavajato.model.classes.TipoLavagem;
import br.grupo7.lavajato.model.dao.ManagerDao;
import java.util.List;

/**
 *
 * @author Adriano
 */
public class TipoLavagemController {
    
    public static List getListaTiposLavagem(){
        return ManagerDao.getCurrentInstance().listar("Select t from TipoLavagem t");
    }
    
    public static TipoLavagem getTipoLavagem(int id){
        return (TipoLavagem)ManagerDao.getCurrentInstance().read("Select t from TipoLavagem t Where t.id = " + id, TipoLavagem.class).get(0);
    }
    
    public static void salvar(TipoLavagem tLavagem){
        ManagerDao.getCurrentInstance().insert(tLavagem);
    }
    
    public static void atualizar(TipoLavagem tLavagem){
        ManagerDao.getCurrentInstance().update(tLavagem);
    }
    
    public static void remover(TipoLavagem tLavagem){
        ManagerDao.getCurrentInstance().delete(tLavagem);
    }
    
}
