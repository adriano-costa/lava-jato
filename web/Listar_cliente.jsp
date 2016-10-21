<%-- 
    Document   : Listar_cliente
    Created on : 20/10/2016, 22:53:10
    Author     : Adriano
--%>

<%@page import="br.grupo7.lavajato.controller.ClienteController"%>
<%@page import="br.grupo7.lavajato.model.classes.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/jquery-3.1.1.js"></script>
        <link rel="stylesheet" href="recursos/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Listar Clientes</title>
    </head>
    <body>
        <div style="position: relative; left:30px; width: 70%">
            <h1>Clientes</h1>
            <br/>
            <%
            List<Cliente> lista = ClienteController.getLista();
            if (lista.size() == 0){
            %>
                    <h3>Não há clientes cadastrados</h3>
            <%} else {
            %>
                <table class="table">
                    <tr><th>Nome</th><th>Telefone</th><th>Login</th><th>Editar</th></tr>
                    <%for (Cliente c: lista){%> 
                        <form action="cadastrar_cliente.jsp" > 
                            <input type='hidden' name = 'ident' value= <%=c.getId()%> />
                            <tr><td><%=c.getNome()%></td>
                                <td><%=c.getTelefone()%></td>
                                <td><%=c.getLogin()%></td>
                                <td> <input type="submit" value="editar" /> </td><tr>
                        </form>
                    <%}%>
                </table>
                <br/><br/>
            <%}%>
            <a href="cadastrar_cliente.jsp" class="btn btn-primary btn-lg"  >Cadastrar novo Cliente</a>
        </div>
    </body>
</html>
