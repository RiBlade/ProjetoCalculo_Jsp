<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = null;
    double val;
    double jrs;
    double parce;
    try {
        val = Double.parseDouble(request.getParameter("n1"));
        jrs = Double.parseDouble(request.getParameter("n2"));
        parce = Double.parseDouble(request.getParameter("n3"));

    } catch (Exception ex) {
        val = 0;
        jrs = 0;
        parce = 0;
        if (request.getParameter("n1") != null && request.getParameter("n2") != null
                && request.getParameter("n3") != null) {
            erro = "erro durante a entrada de dados, insira novamente";
        }

    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana - JSP</title>
    </head>
    <body>
        <div class="text-center">
 <%@include file="WEB-INF/jspf/menu.jspf" %>
 <%@include file="WEB-INF/jspf/cabecalho.jspf" %>  
            <h1>Amortização Americana</h2>
                <form>
                    <h6>Valor da Parcela <br><input type="number" name="n1"></h6>
                    <h6>Porcentagem do Juros<br><input type="number"  name="n2"></h6>
                    <h6>Quantidade de Prestações<br><input type="number" name="n3"></h6>
                    <div><input type="submit" value="calcular"></h3></div>
                </form>
                <%if (request.getParameter("n1") == null || request.getParameter("n2") == null
                            || request.getParameter("n3") == null) {%>
                <%} else if (erro != null) {%>
                <div><%=erro%></div>
                <%} else {%>
                <%DecimalFormat df = new DecimalFormat("#,##0.00");%>
                <table  class="table table-bordered">
                    <tr>
                        <th>Prestação</th>
                        <th>Saldo</th>
                        <th>Amortização</th>
                        <th>Juros</th>
                        <th>Parcela</th>
                    </tr>

                    <%
                        jrs = jrs / 100;
                        double parcela = 0;
                        double amort = 0;
                        double juros = 0;
                        juros = val * jrs;
                        parcela = juros;
                    %>
                    <%for (int i = 0; i <= parce; i++) {%>
                    <%if (i == 0) {%>
                    <th><%=i%></th>
                    <td><%=val%></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <%} else if (i > 0 && i < parce) {;%>
                    <tr>
                        <th><%=i%>ª</th>
                        <td><%=df.format(val)%></td>
                        <td></td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(parcela)%></td>
                    </tr>
                    <%} else {%>
                    <%amort = val;%>
                    <%parcela = juros + amort;%>
                    <tr>
                        <th><%=i%>ª</th>
                        <td></td>
                        <td><%=df.format(amort)%></td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(parcela)%></td>
                    </tr>
                    <%}%>
                    <%}%>
                    <%juros = juros * parce;%>
                    <%parcela = amort + juros;%>
                    <tr>
                        <th>Total</th>
                        <td></td>
                        <td><%=df.format(amort)%></td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(parcela)%></td>
                    </tr>
                </table>
                <%}%>
              
        </div>
    </body>
      <%@include file="WEB-INF/jspf/rodape.jspf"%>
</html>
