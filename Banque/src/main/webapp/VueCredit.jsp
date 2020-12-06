<%--
  Created by IntelliJ IDEA.
  User: Al4D1N
  Date: 05/12/2020
  Time: 18:10
--%>
<%@page import="web.CreditModel" %>
<%--   <%@ : pour une diréctive --%>
<%
  CreditModel model=(CreditModel)request.getAttribute("creditModel");
%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Crédit bancaire</title>
      <link href="css/style.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  </head>
  <body>

      <p class="spacer"></p>
      <div  class="container">
          <div class="col-md-6 col-xm-12 col-sm-6 col-md-offset-3">
          <div class="panel panel-primary">
              <div class="panel-heading">Simulation de crédits</div>
              <div class="panel-body">
                  <form action="calculerMensualite.do" method="post">
                  <div class="form-group">
                      <label class="control-label">Montant :</label>
                      <input class="form-control" type="text" name="montant"  value="<%=model.getMontant() %>">
                  </div>
                  <div class="form-group">
                      <label class="control-label">Taux :</label>
                      <input class="form-control" type="text" name="taux"  value="<%=model.getTaux() %>">
                  </div>
                  <div class="form-group">
                      <label class="control-label">Durée :</label>
                      <input class="form-control" type="text" name="duree"  value="<%=model.getDuree() %>">
                  </div>
                  <button class="btn btn-danger">Calculer</button>
                  </form>
              </div>
              <div class="space">
              <label>Mensualité :</label>
              <label><%=model.getMensualite()%></label>
              <%--   <%= : pour une expresion (out.println) --%>
              </div>
          </div>
      </div>
      </div>
  </body>
</html>
