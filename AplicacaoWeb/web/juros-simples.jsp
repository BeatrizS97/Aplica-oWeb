<%@ include file="fragments/menu.jspf" %> <!-- Inclui o menu -->
<html>
<head>
    <title>Cálculo de Juros Simples</title>
</head>
<body>
    <h2>Calculadora de Juros Simples</h2>
    
    <form action="juros-simples.jsp" method="post">
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

                double valorFuturo = montante * (1 + (taxa * meses));

                out.println("<h3>Resultado</h3>");
                out.println("<p>Valor Futuro: R$ " + valorFuturo + "</p>");
            } catch (NumberFormatException e) {
                out.println("<p>Por favor, insira valores válidos.</p>");
            }
        }
    %>
</body>
</html>
