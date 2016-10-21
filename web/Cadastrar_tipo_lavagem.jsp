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
        <script src="recursos/jquery-3.1.1.js"></script>
        <link rel="stylesheet" href="recursos/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Cadastrar tipo lavagem</title>
    </head>
    <body>
        <div style="position: relative; left:30px; width: 40%">
            <% if (request.getParameter("ident") == null) {%>
            <h1>Cadastrar novo tipo de lavagem</h1>
            <br/>
            <form id="cadastro_tipo_lavagem" class="navbar-form navbar-left" action="TipoLavagemServlet"/>
                Nome: <br/><input type="text" name="nome" required/><br/><br/>
                Descrição: <br/> <textarea name="descricao" rows="10" cols="50" required></textarea> <br/><br/>
                Valor R$: <br/><input type="number" step="any" min="0" name="valor" required/><br/><br/>
                <input type="submit" name="opcao" value="Cadastrar" class="btn btn-primary btn-lg"/>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="Listar_tipo_lavagem.jsp" class="btn btn-lg btn-warning">Voltar</a>
            </form>
            <%} else {
                int ident = Integer.parseInt(request.getParameter("ident"));
                TipoLavagem tLavagem = TipoLavagemController.getById(ident);
            %>
                <h1>Editar tipo de lavagem</h1>
                <br/>
                <form id="cadastro_tipo_lavagem" action="TipoLavagemServlet"/>
                    <input type="hidden" name="ident" value="<%=ident%>"/>
                    Nome: <br/><input type="text" name="nome" value="<%=tLavagem.getNome()%>" required/><br/><br/>
                    Descrição: <br/> <textarea name="descricao" rows="10" cols="50" required><%=tLavagem.getDescricao()%></textarea> <br/><br/>
                    Valor R$: <br/><input type="number" step="any" min="0" name="valor" value="<%=tLavagem.getValor()%>" required/><br/><br/>
                    <input type="submit" name="opcao" value="Salvar" class="btn btn-primary btn-lg" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="opcao" type="submit" value="Remover" class="btn  btn-lg btn-danger"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Listar_tipo_lavagem.jsp" class="btn btn-lg btn-warning">Voltar</a>
                </form>
        <%}%>
        </div>
</body>
</html>
