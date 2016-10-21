<%-- 
    Document   : cadastrar_cliente
    Created on : 20/10/2016, 22:37:10
    Author     : Adriano
--%>

<%@page import="br.grupo7.lavajato.controller.ClienteController"%>
<%@page import="br.grupo7.lavajato.model.classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/jquery-3.1.1.js"></script>
        <link rel="stylesheet" href="recursos/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Cadastro de Cliente</title>

    </head>
    <body>
        <div style="position: relative; left:30px; width: 40%">
            <% if (request.getParameter("ident") == null) {%>
                <h1>Cadastrar novo tipo de lavagem</h1>
                <br/>
                <form id="cadastro_cliente" class="navbar-form navbar-left" action="ClienteServlet"/>
                    Nome: <br/><input type="text" name="nome" required/><br/><br/>
                    Telefone: <br/> <input type="tel" name="telefone" required/> <br/><br/>
                    Login: <br/> <input type="text" name="login" required/><br/><br/>
                    Senha: <br/> <input type="password" name="senha" required/><br/><br/>
                    
                    Salve o cliente e entre nele novamente para adicionar veiculos.
                    <br/><br/>
                    
                    <input type="submit" name="opcao" value="Cadastrar" class="btn btn-primary btn-lg"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Listar_cliente.jsp" class="btn btn-lg btn-warning">Voltar</a>
                </form>
            <%} else {
                int ident = Integer.parseInt(request.getParameter("ident"));
                Cliente c = ClienteController.getById(ident);
            %>
                <h1>Editar Cliente</h1>
                <br/>
                <form id="cadastro_cliente" action="ClienteServlet"/>
                    <input type="hidden" name="ident" value="<%=ident%>"/>
                    Nome: <br/><input type="text" name="nome" required value="<%=c.getNome()%>"/><br/><br/>
                    Telefone: <br/> <input type="tel" name="telefone" required value="<%=c.getTelefone()%>"/> <br/><br/>
                    Login: <br/> <input type="text" name="login" required value="<%=c.getLogin()%>"/><br/><br/>
                    Senha: <br/> <input type="password" name="senha" required value="<%=c.getSenha()%>"/><br/><br/>
                    
                    <input type="submit" name="opcao" value="Veiculos do Cliente" class="btn btn-lg btn-default"/>
                    <br/><br/>
                    <input type="submit" name="opcao" value="Salvar" class="btn btn-primary btn-lg" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="opcao" type="submit" value="Remover" class="btn  btn-lg btn-danger"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Listar_cliente.jsp" class="btn btn-lg btn-warning">Voltar</a>
                </form>
        <%}%>
        </div>
    </body>
</html>
