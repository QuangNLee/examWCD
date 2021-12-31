package com.example.exam.model;

import com.example.exam.entity.Phone;
import com.example.exam.util.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PhoneModel {
    public ArrayList<Phone> findAll(){
        ArrayList<Phone> result = new ArrayList<>();
        Connection connection = ConnectionHelper.getConnection();
        if(connection != null){
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select * from foods");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String brand = resultSet.getString("brand");
                    String description = resultSet.getString("description");
                    double price = resultSet.getDouble("price");
                    Phone phone = new Phone(id, name, brand, price, description);
                    result.add(phone);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public boolean save(Phone phone) {
        Connection connection = ConnectionHelper.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement =
                        connection.prepareStatement("insert into phones (name, brand, price, description) values (?,?,?,?) ");
                preparedStatement.setString(1, phone.getName());
                preparedStatement.setString(2, phone.getBrand());
                preparedStatement.setDouble(3, phone.getPrice());
                preparedStatement.setString(4, phone.getDescription());
                preparedStatement.execute();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
