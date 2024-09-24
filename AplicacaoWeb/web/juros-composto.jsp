<%@ include file="fragments/menu.jspf" %> <!-- Inclui o menu -->
<html>
<head>
    <title>Cálculo de Juros Compostos</title>
</head>
<body>
    <h2>Calculadora de Juros Compostos</h2>
    
    <form action="juros-compostos.jsp" method="post">
        Montante Inicial: <input type="text" name="montante" /><br>
        Taxa de Juros (%): <input type="text" name="taxa" /><br>
        Meses: <input type="text" name="meses" /><br>
        <input type="submit" value="Calcular" />
    </form>

    <% 
        String montanteStr = request.getParameter("montante");
        String taxaStr = request.getParameter("taxa");
        String mesesStr = request.getParameter("meses");

        if (montanteStr != null && taxaStr != null && mesesStr != null) {
            try {
                double montante = Double.parseDouble(montanteStr);
                double taxa = Double.parseDouble(taxaStr) / 100;
                int meses = Integer.parseInt(mesesStr);

                out.println("<h3>Resultado - Tabela de Juros Compostos</h3>");
                out.println("<table border='1'><tr><th>Mês</th><th>Valor Acumulado</th></tr>");

                for (int i = 1; i <= meses; i++) {
                    double valorFuturo = montante * Math.pow(1 + taxa, i);
                    out.println("<tr><td>" + i + "</td><td>R$ " + valorFuturo + "</td></tr>");
                }

                out.println("</table>");
            } catch (NumberFormatException e) {
                out.println("<p>Por favor, insira valores válidos.</p>");
            }
        }
    %>
</body>
</html>
