<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = null;
    double divida;
    double jur;
    double parc;       
    try{
      divida = Double.parseDouble(request.getParameter("n1"));
      jur = Double.parseDouble(request.getParameter("n2"));
      parc = Double.parseDouble(request.getParameter("n3"));
    }catch(Exception ex){
        divida = 0;
        jur = 0;
        parc = 0;
        if(request.getParameter("n1") != null && request.getParameter("n2") != null 
             && request.getParameter("n3") != null){
          erro="erro durante a entrada de dados, insira novamente";}
        
   
    }
   
    
%>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amotização constante</title>
    </head>
    <body>
        <h3><a href="home.jsp">Voltar</a></h3>
        <h1>Calculo amotização contante</h1>
        <div>
            <h2>informe</h2>
            <form>                
                <h3> Valor da parcela <input type="text" name="n1"></h3>
                <h3>Porcetagem do juros <input type="number" name="n2"></h3>
                <h3>quantidade de prestações <input type="number" name="n3"></h3>
                <div><input type="submit" value="calcular"></div>
            </form>
        </div>
        <hr/>       
        <%if(request.getParameter("n1")== null||request.getParameter("n2")== null
                ||request.getParameter("n3")== null){%>
               
                <%}else if(erro != null){%>
                <div><%=erro%></div>
                <%}else{%>
                <table  border="1">
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
                 for(int i = 1; i <= parc;i++){%>
                 <tr>
                     <th><%=i%>ª</th>
                     <td><%=amort%></td>
                     <%juros = divida * jur;
                         BigDecimal b2 = new BigDecimal(juros).setScale(2, RoundingMode.HALF_EVEN);
                     juros =b2.doubleValue();
                     %>
                         <td><%=juros%></td>
                         <%prestacao = juros + amort;
                         BigDecimal b3 = new BigDecimal(prestacao).setScale(2, RoundingMode.HALF_EVEN);
                     prestacao =b3.doubleValue();
                     %>
                     <td><%= prestacao%>
                         <%divida = divida - amort;
                         BigDecimal b4 = new BigDecimal(divida).setScale(2, RoundingMode.HALF_EVEN);
                      divida=b4.doubleValue();
                     %>
                     <td><%=divida%></td>
                     
                 </tr>                     
                 <%}%>
                </table>
                <%}%>
<%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
