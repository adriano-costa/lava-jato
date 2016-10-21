/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.grupo7.lavajato.servlets;

import br.grupo7.lavajato.controller.ClienteController;
import br.grupo7.lavajato.model.classes.Cliente;
import br.grupo7.lavajato.model.classes.Veiculo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adriano
 */
public class ClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Cliente c = null;
            if(request.getAttribute("cliente")== null){
                if(request.getParameter("ident")!= null){
                    c = (Cliente)ClienteController.getById(Integer.parseInt(request.getParameter("ident")));
                } else {
                    c = new Cliente();
                    c.setNome(request.getParameter("nome"));
                    c.setTelefone(request.getParameter("telefone"));
                    c.setLogin(request.getParameter("login"));
                    c.setSenha(request.getParameter("senha"));
                }
            }else{
                c = (Cliente)request.getAttribute("cliente");
            }
            
            String opcao = request.getParameter("opcao");
   
            switch (opcao){
                case "Cadastrar":
                    ClienteController.salvar(c);
                    response.sendRedirect("Listar_cliente.jsp");
                    break;
                case "Salvar":
                    c.setId(Integer.parseInt(request.getParameter("ident")));
                    ClienteController.atualizar(c);
                    response.sendRedirect("Listar_cliente.jsp");
                    break;
                case "Remover":
                    c.setId(Integer.parseInt(request.getParameter("ident")));
                    ClienteController.remover(c);
                    response.sendRedirect("Listar_cliente.jsp");
                    break;
                case "Veiculos do Cliente":
                    request.setAttribute("cliente", c);
                    getServletContext().getRequestDispatcher("/Listar_veiculos_cliente.jsp").forward(request,response); 
                    break;
                case "Incluir veiculo":
                    Veiculo v = new Veiculo();
                    v.setTipo(request.getParameter("tipo"));
                    v.setMarca(request.getParameter("marca"));
                    v.setModelo(request.getParameter("modelo"));
                    v.setPlaca(request.getParameter("placa"));
                    v.setCorPredomenante(request.getParameter("cor"));
                    c.getVeiculos().add(v);
                    c = ClienteController.atualizar(c);
                    response.sendRedirect("Cadastrar_cliente.jsp?ident="+c.getId());
                    break;
                case "Remover Veiculo":
                    int indVeic = Integer.parseInt(request.getParameter("ind_veiculo"));
                    c.getVeiculos().remove(indVeic);
                    c = ClienteController.atualizar(c);
                    response.sendRedirect("Cadastrar_cliente.jsp?ident="+c.getId());
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
