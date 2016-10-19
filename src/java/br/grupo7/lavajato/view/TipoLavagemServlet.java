/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.grupo7.lavajato.view;

import br.grupo7.lavajato.controller.TipoLavagemController;
import br.grupo7.lavajato.model.classes.TipoLavagem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adriano
 */

public class TipoLavagemServlet extends HttpServlet {

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
            TipoLavagem novoTipo = new TipoLavagem();
            novoTipo.setNome(request.getParameter("nome"));
            novoTipo.setDescricao(request.getParameter("descricao"));
            novoTipo.setValor(Double.parseDouble(request.getParameter("valor")));
            
            String opcao = request.getParameter("opcao");
   
            switch (opcao){
                case "Cadastrar":
                    TipoLavagemController.salvar(novoTipo);
                    break;
                case "Salvar":
                    novoTipo.setId(Integer.parseInt(request.getParameter("ident")));
                    TipoLavagemController.atualizar(novoTipo);
                    break;
                case "Remover":
                    novoTipo.setId(Integer.parseInt(request.getParameter("ident")));
                    novoTipo = TipoLavagemController.atualizar(novoTipo);
                    TipoLavagemController.remover(novoTipo);
                    break;
            }
            response.sendRedirect("Listar_tipo_lavagem.jsp");
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
