package web;

import Metier.CreditMetierImpl;
import Metier.ICreditMetier;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControleurServlet  extends HttpServlet {
    private ICreditMetier metier;

    @Override
    public void init() throws ServletException {
        metier= new CreditMetierImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("creditModel", new CreditModel());
        req.getRequestDispatcher("VueCredit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Reading data from the request
        double montant=Double.parseDouble(req.getParameter("montant"));
        double taux=Double.parseDouble(req.getParameter("taux"));
        int duree=Integer.parseInt(req.getParameter("duree"));

        //Saving data in our model
        CreditModel model= new CreditModel();
        model.setMontant(montant);
        model.setTaux(taux);
        model.setDuree(duree);


        //Calling our "metier" for treating data
        double resultat=metier.calculerMensualiteCredit(montant,taux,duree);

        //saving the result in our model
        model.setMensualite(resultat);

        //saving model in the object request

        req.setAttribute("creditModel",model);

        //forwarding for vuejsp
        req.getRequestDispatcher("VueCredit.jsp").forward(req,resp);
    }
}
