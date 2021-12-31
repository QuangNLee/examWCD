package com.example.exam.controller;

import com.example.exam.entity.Phone;
import com.example.exam.model.PhoneModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreatePhoneController extends HttpServlet {
    private PhoneModel phoneModel = new PhoneModel();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/phone/form.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String brand = req.getParameter("brand");
            String description = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("price"));
            Phone phone = new Phone(id, name, brand, price, description);
            if(phoneModel.save(phone)){
//                resp.getWriter().println("OK");
                resp.sendRedirect("/admin/phone/list");
            }
        }catch (Exception e){
            resp.getWriter().println("Error");
        }
    }
}
