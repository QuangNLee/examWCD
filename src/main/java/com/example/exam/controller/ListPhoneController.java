package com.example.exam.controller;



import com.example.exam.entity.Phone;
import com.example.exam.model.PhoneModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class ListPhoneController extends HttpServlet {
    private PhoneModel phoneModel = new PhoneModel();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Phone> listPhone = phoneModel.findAll();
        req.setAttribute("list", listPhone);
        req.getRequestDispatcher("/admin/phone/list.jsp").forward(req, resp);
    }
}
