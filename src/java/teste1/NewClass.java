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
        
        Cliente c = new Cliente();
        c.setNome("Cliente 1");
        c.setSenha("1234");
        c.setTelefone("12345678");
        ManagerDao.getCurrentInstance().insert(c);
        Cliente b = new Cliente();
        b.setNome("Cliente 2");
        b.setSenha("12345");
        b.setTelefone("123456789");
        ManagerDao.getCurrentInstance().insert(b);
    }
    
}
