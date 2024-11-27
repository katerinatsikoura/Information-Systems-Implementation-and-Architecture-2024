package xpenser_classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ExpenseSheetDAO {

    public static int getExpenseSheetId(int userId) {
        int expenseSheetId = -1; 
        DB db = new DB();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = db.getConnection();

            String query = "SELECT expense_sheet_id FROM expense_sheet WHERE user_id = ? AND submitted = FALSE";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                expenseSheetId = resultSet.getInt("expense_sheet_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) db.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return expenseSheetId;
    }

    public static boolean makeSubmission(int expenseSheetId) {
        DB db = new DB();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean success = false;

        try {
            connection = db.getConnection();

            String updateQuery = "UPDATE expense_sheet SET submitted = TRUE WHERE expense_sheet_id = ?";
            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setInt(1, expenseSheetId);

            int rowsUpdated = preparedStatement.executeUpdate();
            success = (rowsUpdated > 0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) db.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return success;
    }
}

