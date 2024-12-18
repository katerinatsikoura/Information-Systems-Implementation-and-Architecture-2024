package xpenser_classes;

import java.sql.*;


public class ExpenseActionstest {

    public static void saveExpense(Expense expense) throws SQLException {
        String query = "INSERT INTO expense (expense_id, expense_sheet_id, expense_type, e_date, amount, wbs, mngr_approved, acc_approved, apprvd, comments, URL) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "username", "password");
            PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, expense.getExpenseId());
            stmt.setInt(2, expense.getExpenseSheetId());
            stmt.setString(3, expense.getType());
            stmt.setString(4, expense.getDate());
            stmt.setDouble(5, expense.getAmount());
            stmt.setInt(6, expense.getWbs());
            stmt.setInt(7,-1);
            stmt.setInt(8,-1);
            stmt.setInt(9,-1);
            stmt.setString(10, expense.getComments());
            stmt.setString(11, expense.getReceipt());
            
            
            stmt.executeUpdate();
        } catch (SQLException e) {
            
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            throw e;
        } catch (Exception e) {
            System.err.println("General Error: " + e.getMessage());
            e.printStackTrace();
            throw new SQLException("Error saving expense: " + e.getMessage(), e);
        }
    }
}