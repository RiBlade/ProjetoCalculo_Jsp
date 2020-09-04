<%-- 
    Document   : numeros-aleatorios
    Created on : 31 de ago de 2020, 16:37:50
    Author     : micam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = null;
    int n;
    try{
        n = Integer.parseInt(request.getParameter("n"));
    }catch(Exception ex){
        n=0;
        if(request.getParameter("n") != null)
            erro = "Número inválido como parâmetro";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Números aleatórios - JSP</title>
    </head>
    <body>
        <h3><a href="home.jsp">Voltar</a></h3>
        <h1>Java Server Pages</h1>
        <h2>Números aleatórios</h2>
        <%for(int i = 1; i<=10; i++){%>
        <div><%= ((int)(Math.random() * 100)) %></div>
    <%}%>        
    </body>
</html>
