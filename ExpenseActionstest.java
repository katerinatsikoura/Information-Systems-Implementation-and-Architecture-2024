package xpenser_classes;



import java.sql.*;


public class ExpenseActionstest {

    public static void saveExpense(Expense expense, String date, String passkey) throws SQLException {

        DB db = new DB();
        Connection connection = null;

        

        try {
            int expenseSheetId = getOrCreateExpenseSheet(passkey, date);
            connection = db.getConnection();
            String query = "INSERT INTO expense (expense_sheet_id, expense_type, e_date, amount, wbs, mngr_approved, acc_approved, apprvd, comments, URL) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(query);


            stmt.setInt(1, expenseSheetId);
            stmt.setString(2, expense.getType());
            stmt.setString(3, expense.getDate());
            stmt.setDouble(4, expense.getAmount());
            stmt.setString(5, expense.getWbs());
            stmt.setInt(6,-1);
            stmt.setInt(7,-1);
            stmt.setInt(8,-1);
            stmt.setString(9, expense.getComments());
            stmt.setString(10, expense.getReceipt());
            
            
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

    public static int getOrCreateExpenseSheet(String passkey, String date) throws Exception {
        int expenseSheetId = -1;
       
        DB db = new DB();
        Connection connection = null;

      
        try {
            String query = "SELECT expense_sheet_id FROM expense_sheet WHERE user_passkey = ? AND es_date >= DATE_FORMAT(CURDATE(), '%Y-%m-01') AND es_date < DATE_FORMAT(CURDATE() + INTERVAL 1 MONTH, '%Y-%m-01')";
            connection = db.getConnection();
            PreparedStatement stmt = connection.prepareStatement(query);
    
            stmt.setString(1, passkey);  
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
    
                expenseSheetId = rs.getInt("expense_sheet_id");
            } else {
        
                String insertQuery = "INSERT INTO expense_sheet (user_passkey, es_date, manager_approved, accounting_approved, approved, submitted) " +
                                     "VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
                    insertStmt.setString(1, passkey);
                    insertStmt.setString(2, date);
                    insertStmt.setInt(3, 0);
                    insertStmt.setInt(4, 0);
                    insertStmt.setInt(5, 0);
                    insertStmt.setInt(6, 0);
                    
                    insertStmt.executeUpdate();
    
                    ResultSet generatedKeys = insertStmt.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        expenseSheetId = generatedKeys.getInt(1);
                    }
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
        } catch (SQLException e) {
            
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            throw e;
        } catch (Exception e) {
            System.err.println("General Error: " + e.getMessage());
            e.printStackTrace();
            throw new SQLException("Error saving expense: " + e.getMessage(), e);
        }
    
        return expenseSheetId;
    }


}