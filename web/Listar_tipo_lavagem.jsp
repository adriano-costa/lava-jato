<%-- 
    Document   : cadastro_tipo_lavagem
    Created on : 18/10/2016, 22:08:03
    Author     : Adriano
--%>

<%@page import="java.util.List"%>
<%@page import="br.grupo7.lavajato.controller.TipoLavagemController"%>
<%@page import="br.grupo7.lavajato.model.classes.TipoLavagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/jquery-3.1.1.js"></script>
        <link rel="stylesheet" href="recursos/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Tipos de lavagem</title>
    </head>
    <body>
        <div style="position: relative; left:30px; width: 70%">
            <h1>Tipos de lavagem</h1>
            <br/>
            <%
            List<TipoLavagem> lista = TipoLavagemController.getLista();
            if (lista.size() == 0){
            %>
                    <h3>Não há tipos de lavagens cadastrados</h3>
            <%} else {
            %>
                <table class="table">
                    <tr><th>Nome</th><th>Descrição</th><th>Valor</th><th>Editar</th></tr>
                    <%for (TipoLavagem t: lista){%> 
                        <form action="cadastrar_tipo_lavagem.jsp" > 
                            <input type='hidden' name = 'ident' value= <%=t.getId()%> />
                            <tr><td><%=t.getNome()%></td>
                                <td><%=t.getDescricao()%></td>
                                <td><%=t.getValor()%></td>
                                <td> <input type="submit" value="editar" /> </td><tr>
                        </form>
                    <%}%>
                </table>
                <br/><br/>
            <%}%>
            <a href="cadastrar_tipo_lavagem.jsp" class="btn btn-primary btn-lg"  >Cadastrar novo tipo de lavagem</a>
        </div>
    </body>
</html>
