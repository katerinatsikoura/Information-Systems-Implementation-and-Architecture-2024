package xpenser_classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDAO {

    public static List<Expense> getExpensesByUserId(int userId) {
        List<Expense> expenses = new ArrayList<>();
        DB db = new DB();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = db.getConnection();

            String query = "SELECT e.type, e.amount, e.date, e.wbs " +
                           "FROM expenses e " +
                           "JOIN expense_sheets es ON e.expense_sheet_id = es.id " +
                           "WHERE es.user_id = ?";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String type = resultSet.getString("type");
                double amount = resultSet.getDouble("amount");
                Date date = resultSet.getDate("date");
                String wbs = resultSet.getString("wbs");

                expenses.add(new Expense(type, amount, date, wbs));
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return expenses;
    }
}


