<%-- 
    Document   : cadastrar_tipo_lavagem
    Created on : 19/10/2016, 11:20:35
    Author     : Adriano
--%>

<%@page import="br.grupo7.lavajato.controller.TipoLavagemController"%>
<%@page import="br.grupo7.lavajato.model.classes.TipoLavagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar tipo lavagem</title>
    </head>
    <body>
        <% if (request.getParameter("id") == null) {%>
            <h1>Cadastrar novo tipo de lavagem</h1>
            <br/>
            <form id="cadastro_tipo_lavagem" action="TipoLavagemServlet"/>
                Nome: <br/><input type="text" name="nome" /><br/><br/>
                Descrição: <br/> <textarea name="descricao" rows="10" cols="50"></textarea> <br/><br/>
                Valor R$: <br/><input type="number" step="any" min="0" name="valor"/><br/><br/>
                <input type="submit" name="opcao" value="Cadastrar"/>
            </form>
        <%} else {
            int id = Integer.parseInt(request.getParameter("id"));
            TipoLavagem tLavagem = TipoLavagemController.getTipoLavagem(id);
        %>
            <h1>Editar tipo de lavagem</h1>
            <br/>
            <form id="cadastro_tipo_lavagem" action="TipoLavagemServlet"/>
                <input type="hidden" value="<%=id%>"/>
                Nome: <br/><input type="text" name="nome" value="<%=tLavagem.getNome()%>"/><br/><br/>
                Descrição: <br/> <textarea name="descricao" rows="10" cols="50" value="<%=tLavagem.getDescricao()%>"></textarea> <br/><br/>
                Valor R$: <br/><input type="number" step="any" min="0" name="valor" value="<%=tLavagem.getValor()%>"/><br/><br/>
                <input type="submit" name="opcao" value="Salvar"/>&nbsp;&nbsp;<input name="opcao" type="submit" value="Remover"/>
            </form>
            <%}%>
    </body>
</html>