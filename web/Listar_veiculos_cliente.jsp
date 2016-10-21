<%-- 
    Document   : Listar_carros_cliente
    Created on : 21/10/2016, 00:01:01
    Author     : Adriano
--%>

<%@page import="br.grupo7.lavajato.model.classes.Cliente"%>
<%@page import="br.grupo7.lavajato.model.classes.Veiculo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/jquery-3.1.1.js"></script>
        <link rel="stylesheet" href="recursos/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Veiculos</title>
    </head>
    <body>
        <div style="position: relative; left:30px; width: 70%">
            <h1>Veiculos</h1>
            <br/>
            <%
            Cliente c = (Cliente)(request.getAttribute("cliente"));
            List<Veiculo> lista = c.getVeiculos();
            if (lista.size() == 0){
                
            %>
                    <h3>Não há veiculos cadastrados</h3>
                    
            <%} else {
            %>
                <table class="table">
                    <tr><th>Tipo</th><th>Marca</th><th>Modelo</th><th>Placa</th><th>Cor</th></tr>
                    <%for (Veiculo v: lista){%> 
                        <form action="Cadastrar_veiculo.jsp" >
                            <input type="hidden" name="indice" value="<%=c.getVeiculos().indexOf(v)%>"
                            <input type="hidden" name="id_cliente" value="<%=c.getId()%>"
                            <tr><td><%=v.getTipo()%></td>
                                <td><%=v.getMarca()%></td>
                                <td><%=v.getModelo()%></td>
                                <td><%=v.getPlaca()%></td>
                                <td><%=v.getCorPredomenante()%></td>
                                <td> <input type="submit" value="editar" /> </td><tr>
                        </form>
                    <%}%>
                </table>
                <br/><br/>
            <%}%>
            <a href="Cadastrar_veiculo.jsp?id_cliente=<%=c.getId()%>" class="btn btn-primary btn-lg"  >Cadastrar novo veiculo</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Cadastrar_cliente.jsp?id_cliente=<%=c.getId()%>" class="btn btn-lg btn-warning">Voltar</a>
        </div>
    </body>
</html>
