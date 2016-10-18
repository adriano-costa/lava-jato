/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste1;

import br.grupo7.lavajato.dao.ManagerDao;
import br.grupo7.lavajato.model.Cliente;

/**
 *
 * @author Adriano
 */
public class NewClass {
    
    public static void main(String[] args){
        Cliente c = new Cliente();
        c.setNome("dasdasdasds");
        c = (Cliente)ManagerDao.getCurrentInstance().update(c);
        System.out.println(c.getId());
    }
    
}
