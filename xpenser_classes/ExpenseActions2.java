package xpenser_classes;

import java.sql.*;
import java.util.*;

public class ExpenseActions2 {

    public List<Expense> getExpensesFromExpensesheet(int es_id) throws Exception{
        List<Expense> expenses = new ArrayList<>();
        List<Integer> status = new ArrayList<>();
        DB db = new DB();
		Connection con = db.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM expense WHERE expense_sheet_id = ?";

        try{
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, es_id);
            rs = stmt.executeQuery();

            while(rs.next()) {
                int id = rs.getInt("expense_id");
                String date = rs.getString("e_date");
                double amount = rs.getDouble("amount");
                String type = rs.getString("expense_type");
                int wbs = rs.getInt("wbs");
                String receipt = rs.getString("URL");
                status = Arrays.asList(
                    rs.getInt("mngr_approved"),
                    rs.getInt("acc_approved"),
                    rs.getInt("apprvd"));
                ;
                String comments = rs.getString("comments") != null ? rs.getString("comments") : "";
                String rejReason = rs.getString("rej_reason") != null ? rs.getString("rej_reason") : "";
                
                expenses.add(new Expense(id, date, amount, type, wbs, receipt, status, comments, rejReason));
            }

            rs.close(); 
            stmt.close();

        } catch (Exception e) {
			throw new Exception("Error getting expenses from expensesheet: " + e.getMessage(), e);
		} finally {
            db.close();
        }
        return expenses;
    }

    public Expensesheet getExpensesheetFromExpensesheetID(int es_id) throws Exception{
        Expensesheet expensesheet = null;
        List<Integer> status = new ArrayList<>();
        DB db = new DB();
		Connection con = db.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM expense_sheet WHERE expense_sheet_id = ?";

        try{
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, es_id);
            rs = stmt.executeQuery();

            if(rs.next()) {
                String passkey = rs.getString("user_passkey");
                String date = rs.getString("es_date");
                status = Arrays.asList(
                    rs.getInt("manager_approved"),
                    rs.getInt("accounting_approved"),
                    rs.getInt("approved"));
                ;
                List<Expense> expenses = getExpensesFromExpensesheet(es_id);

                expensesheet = new Expensesheet(es_id, passkey, date, expenses, status);
            }
            
            rs.close(); 
            stmt.close();

        } catch (Exception e) {
			throw new Exception("Error getting expenses from expensesheet: " + e.getMessage(), e);
		} finally {
            db.close();
        }
        return expensesheet;
    }

    public List<Expensesheet> getExpensesheetsToReview() throws Exception{
        List<Expensesheet> expensesheets = new ArrayList<>();
        List<Integer> status = new ArrayList<>();
        DB db = new DB();
		Connection con = db.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM expense_sheet WHERE es_date >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH" +
        ", '%Y-%m-01') AND es_date < DATE_FORMAT(CURDATE(), '%Y-%m-01') AND submitted = 1";

        try{
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()) {
                int es_id = rs.getInt("expense_sheet_id");
                String user_passkey = rs.getString("user_passkey");
                String date = rs.getString("es_date");
                status = Arrays.asList(
                    rs.getInt("manager_approved"),
                    rs.getInt("accounting_approved"),
                    rs.getInt("approved"));
                ;

                List<Expense> expenses = getExpensesFromExpensesheet(es_id);
                expensesheets.add(new Expensesheet(es_id, user_passkey, date, expenses, status));
            }

            rs.close(); 
            stmt.close();

        } catch (Exception e) {
			throw new Exception("Error getting expensesheets to review: " + e.getMessage(), e);
		} finally {
            db.close();
        }

        return expensesheets;
    }

    public User getUserFromExpensesheet(Expensesheet es) throws Exception{
        User user = null;
        DB db = new DB();
		Connection con = db.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user WHERE passkey = ?";
        String user_passkey = es.getuserPasskey();
   
        try{
            stmt = con.prepareStatement(sql);
            stmt.setString(1, user_passkey);
            rs = stmt.executeQuery();

            while(rs.next()) {
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String passkey = rs.getString("passkey");

                user = new User(fullname, email, role, passkey);
            }

            rs.close(); 
            stmt.close();

        } catch (Exception e) {
			throw new Exception("Error getting user from expensesheet: " + e.getMessage(), e);
		} finally {
            db.close();
        }

        return user;
    }

    public List<Integer> getWBSFromExpensesheet(Expensesheet es) throws Exception{
        List<Integer> wbsList = new ArrayList<>();
        DB db = new DB();
		Connection con = db.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT wbs FROM expense WHERE expense_id = ?";
        
        try{
            for (Expense exp: es.getExpenseList()){
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, exp.getExpenseId());
                rs = stmt.executeQuery();

                while(rs.next()) {
                    int wbs = rs.getInt("wbs");
                    if (!wbsList.contains(wbs)) { // Add only if not already in the list
                        wbsList.add(wbs);
                    }
                    //wbs.add(rs.getInt("wbs"));
                }
            }

            rs.close(); 
            stmt.close();

        } catch (Exception e) {
			throw new Exception("Error getting wbs from expensesheet: " + e.getMessage(), e);
		} finally {
            db.close();
        }

        return wbsList;

    }

    public List<Expensesheet> getProcessedExpensesheets(String passkey) throws Exception {
        List<Expensesheet> expensesheets = new ArrayList<>();
        List<Integer> status = new ArrayList<>();
        DB db = new DB();
        Connection con = db.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM expense_sheet WHERE user_passkey = ?  AND submitted = 1";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, passkey);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int es_id = rs.getInt("expense_sheet_id");
                String passKey = rs.getString("user_passkey");
                String date = rs.getString("es_date");
                status = Arrays.asList(
                        rs.getInt("manager_approved"),
                        rs.getInt("accounting_approved"),
                        rs.getInt("approved"));
                ;

                List<Expense> expenses = getExpensesFromExpensesheet(es_id);
                expensesheets.add(new Expensesheet(es_id, passKey, date, expenses, status));
    
            }
            rs.close();
            stmt.close();

        } catch (Exception e) {
            throw new Exception("Error getting processed expensesheets: " + e.getMessage(), e);
        } finally {
            db.close();
        }
        return expensesheets;
    }

    public static String getStatusIcon(int status, String contextPath) {
        if (status == 1) {
            return "<img src='" + contextPath + "/images/Approved_Icon.png' alt='Approved'>";
        } else if (status == 0) {
            return "<img src='" + contextPath + "/images/Declined_Icon.png' alt='Rejected'>";
        }
        return "";
    }

    public void updateExpenseStatus(int exp_id, String action, String rejReason, String role) throws Exception {
        DB db = new DB();
        Connection con = db.getConnection();
        PreparedStatement stmt = null;
        String sql;
        if (role.equalsIgnoreCase("manager")) {
            sql = "UPDATE expense SET mngr_approved = ?, rej_reason = ? WHERE expense_id = ?";
        } else if (role.equalsIgnoreCase("accountant")) {
            sql = "UPDATE expense SET acc_approved = ?, rej_reason = ? WHERE expense_id = ?";
        } else {
            throw new IllegalArgumentException("Invalid role: " + role);
        }

        try {
                // Determine the new status (approved or rejected)
                int status;
                if (action.equalsIgnoreCase("approve")) {
                    status = 1; // Approved
                } else if (action.equalsIgnoreCase("reject")) {
                    status = 0; //Rejected
                } else {
                    throw new IllegalArgumentException("Invalid action: " + action);
                }
    
                System.out.println("Executing Update:");
        System.out.println("exp_id: " + exp_id);
        System.out.println("action: " + action);
        System.out.println("rejReason: " + rejReason);
        System.out.println("role: " + role);

                stmt = con.prepareStatement(sql);
                stmt.setInt(1, status);
                stmt.setString(2, rejReason);
                stmt.setInt(3, exp_id);
                int rowsUpdated = stmt.executeUpdate();
                
                System.out.println("Rows updated: " + rowsUpdated);
        if (rowsUpdated == 0) {
            throw new Exception("No rows updated. Verify expense ID.");
        }

                stmt.close();
     
        } catch (Exception e) {
            e.printStackTrace(); // Debugging
            throw new Exception("Error updating expense status: " + e.getMessage(), e);
        } finally {
            db.close();
        }
    }

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
            stmt.setInt(5, expense.getWbs());
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
