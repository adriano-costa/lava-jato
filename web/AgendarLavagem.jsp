<%-- 
    Document   : AgendarLavagem
    Created on : 19/10/2016, 19:57:40
    Author     : Adriano
--%>

<%@page import="java.util.List"%>
<%@page import="br.grupo7.lavajato.model.classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente_atual" class="br.grupo7.lavajato.model.classes.Cliente" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/jquery-3.1.1.js"></script>
        <link rel="stylesheet" href="recursos/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Agendar Lavagem</title>
    </head>
    <body>
        <h1>Agendar Lavagem</h1>
        <br/>
        <br/>
        <div id="pesquisa" style="width:20%">
            <form class="form-horizontal" id="form_pesquisa_nome" action="LavagemServlet" >
                Nome: <input type="text" name="pesquisa_nome" />
                <input type="submit" value="Pesquisar" name="opcao" class="btn-default"/>
                <br/>
                <br/>
                <table class="table table-hover">
                    <%List<Cliente> listaNomes = (List)request.getAttribute("lista_clientes");
                      if ((listaNomes != null) && (listaNomes.size() > 0 )){
                          
                          for(Cliente c: listaNomes){
                            %>
                            <tr><td onclick=""><%=c.getNome()%></td></tr>
                            <%
                          }
                      } 
                    %>
                </table>
            </form>
            
        </div>
        <div id="agendamento"style="width:70%; background-color: green ">
            Nome: 
        </div>
    </body>
</html>
