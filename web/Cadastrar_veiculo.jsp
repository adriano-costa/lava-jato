<%-- 
    Document   : Cadastrar_carro
    Created on : 21/10/2016, 00:01:21
    Author     : Adriano
--%>

<%@page import="br.grupo7.lavajato.controller.ClienteController"%>
<%@page import="br.grupo7.lavajato.model.classes.Cliente"%>
<%@page import="br.grupo7.lavajato.model.classes.Veiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/jquery-3.1.1.js"></script>
        <link rel="stylesheet" href="recursos/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Veiculo</title>
    </head>
    <body>
        <div style="position: relative; left:30px; width: 40%">
            <% if (request.getParameter("indice") == null) { 
                    Cliente c = (Cliente) ClienteController.getById(Integer.parseInt(request.getParameter("id_cliente")) );
                    request.setAttribute("cliente", c);%>
                <h1>Cadastrar novo veiculo</h1>
                <br/>
                <form id="cadastro_veiculo" class="navbar-form navbar-left" action="ClienteServlet"/>
                    <input type="hidden" name="ident" value="<%=c.getId()%>"/>
                    Tipo: <br/><input type="text" name="tipo"  required/><br/><br/>
                    Marca: <br/><input type="text" name="marca" required/><br/><br/>
                    Modelo: <br/><input type="text" name="modelo"  required/><br/><br/>
                    Placa: <br/><input type="text" name="placa"  required/><br/><br/>
                    Cor Predominante: <br/><input type="text" name="cor"  required/><br/><br/>
                    <input type="submit" name="opcao" value="Incluir veiculo" class="btn btn-primary btn-lg"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Cadastrar_cliente.jsp?id_cliente=<%=c.getId()%>" class="btn btn-lg btn-warning">Voltar</a>
                </form>
            <%} else {
                    Cliente c = (Cliente) ClienteController.getById(Integer.parseInt(request.getParameter("id_cliente")) );
                    request.setAttribute("cliente", c);
                    Veiculo v = c.getVeiculos().get(Integer.parseInt(request.getParameter("indice")));
                    request.setAttribute("veiculo", v);
            %>
                <h1>Editar veiculo</h1>
                <br/>
                <form id="cadastro_veiculo" class="navbar-form navbar-left" action="ClienteServlet"/>
                    <input type="hidden" name="ident" value="<%=c.getId()%>"/>
                    <input type="hidden" name="ind_veiculo" value="<%=c.getVeiculos().indexOf(v)%>"/>
                    Tipo: <br/><input type="text" name="tipo" value = "<%=v.getTipo()%>" required/><br/><br/>
                    Marca: <br/><input type="text" name="marca" value = "<%=v.getMarca()%>" required/><br/><br/>
                    Modelo: <br/><input type="text" name="modelo" value = "<%=v.getModelo()%>" required/><br/><br/>
                    Placa: <br/><input type="text" name="placa" value = "<%=v.getPlaca()%>" required/><br/><br/>
                    Cor Predominante: <br/><input type="text" name="cor" value = "<%=v.getCorPredomenante()%>" required/><br/><br/>
                    <input type="submit" name="opcao" value="Incluir veiculo" class="btn btn-primary btn-lg"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="opcao" type="submit" value="Remover Veiculo" class="btn  btn-lg btn-danger"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Cadastrar_cliente.jsp?id_cliente=<%=c.getId()%>" class="btn btn-lg btn-warning">Voltar</a>
                </form>
        <%}%>
        </div>
    </body>
</html>
