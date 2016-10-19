/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste1;

import br.grupo7.lavajato.controller.TipoLavagemController;
import br.grupo7.lavajato.model.dao.ManagerDao;
import br.grupo7.lavajato.model.classes.Cliente;
import br.grupo7.lavajato.model.classes.TipoLavagem;
import java.util.List;

/**
 *
 * @author Adriano
 */
public class NewClass {
    
    public static void main(String[] args){
        TipoLavagem t = new TipoLavagem();
        t.setNome("Completa");
        t.setDescricao("Lava tudo");
        t.setValor(100.00);
        
        ManagerDao.getCurrentInstance().insert(t);
        
        List<TipoLavagem> l = TipoLavagemController.getListaTiposLavagem();
        System.out.println(l.get(0).getNome());
//        Cliente c = new Cliente();
//        c.setNome("dasdasdasds");
//        c = (Cliente)ManagerDao.getCurrentInstance().update(c);
//        System.out.println(c.getId());
    }
    
}
