<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = null;
    double divida;
    double jur;
    double parc;
    try {
        divida = Double.parseDouble(request.getParameter("n1"));
        jur = Double.parseDouble(request.getParameter("n2"));
        parc = Double.parseDouble(request.getParameter("n3"));
    } catch (Exception ex) {
        divida = 0;
        jur = 0;
        parc = 0;
        if (request.getParameter("n1") != null && request.getParameter("n2") != null
                && request.getParameter("n3") != null) {
            erro = "erro durante a entrada de dados, insira novamente";
        }

    }

    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização constante</title>
    </head>
    <body>
        <div class="text-center">
             <%@include file="WEB-INF/jspf/menu.jspf" %>
             <%@include file="WEB-INF/jspf/cabecalho.jspf" %> 
            
            <h1>Amortização Constante</h1>
            <form>
                <h6>Valor da Parcela <br><input type="number" name="n1"></h6>
                <h6>Porcentagem do Juros<br> <input type="number" name="n2"></h6>
                <h6>Quantidade de Prestações<br> <input type="number" name="n3"></h6>
                <div><input type="submit" value="calcular"></div>
            </form>
            <%if (request.getParameter("n1") == null || request.getParameter("n2") == null
                        || request.getParameter("n3") == null) {%>

            <%} else if (erro != null) {%>
            <div><%=erro%></div>
            <%} else {%>
            <table class="table table-bordered">
                <tr>
                    <th>Prestações</th>
                    <th>Amortização</th>
                    <th>Juros</th>
                    <th>À ser Pago</th>
                    <th>Saldo devedor</th>
                </tr>
                <%    jur = jur / 100;
                    double amort;
                    double prestacao;
                    double juros;
                    amort = divida / parc;
                    BigDecimal bd = new BigDecimal(amort).setScale(2, RoundingMode.HALF_EVEN);
                    amort = bd.doubleValue();
                    for (int i = 1; i <= parc; i++) {%>
                <tr>
                    <th><%=i%>ª</th>
                    <td><%=amort%></td>
                    <%juros = divida * jur;
                        BigDecimal b2 = new BigDecimal(juros).setScale(2, RoundingMode.HALF_EVEN);
                        juros = b2.doubleValue();
                    %>
                    <td><%=juros%></td>
                    <%prestacao = juros + amort;
                        BigDecimal b3 = new BigDecimal(prestacao).setScale(2, RoundingMode.HALF_EVEN);
                        prestacao = b3.doubleValue();
                    %>
                    <td><%= prestacao%>
                        <%divida = divida - amort;
                            BigDecimal b4 = new BigDecimal(divida).setScale(2, RoundingMode.HALF_EVEN);
                            divida = b4.doubleValue();
                        %>
                    <td><%=divida%></td>

                </tr>                     
                <%}%>
            </table>
            <%}%>
        </div>
    </body>
      <%@include file="WEB-INF/jspf/rodape.jspf"%>
</html>
