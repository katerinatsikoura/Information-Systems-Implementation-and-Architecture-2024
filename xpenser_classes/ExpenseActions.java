package xpenser_classes;

import java.sql.*;
import java.util.*;

public class ExpenseActions {

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
                
                expenses.add(new Expense(id, date, amount, type, wbs, receipt, status, comments));
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
        List<Integer> wbs = new ArrayList<>();
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
                    wbs.add(rs.getInt("wbs"));
                }
            }

            rs.close(); 
            stmt.close();

        } catch (Exception e) {
			throw new Exception("Error getting wbs from expensesheet: " + e.getMessage(), e);
		} finally {
            db.close();
        }

        return wbs;

    }

    public List<Expensesheet> getProcessedExpensesheets(String passkey) throws Exception{
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
                String userpasskey = rs.getString("user_passkey");
                String date = rs.getString("es_date");
                status = Arrays.asList(
                    rs.getInt("manager_approved"),
                    rs.getInt("accounting_approved"),
                    rs.getInt("approved"));
                ;

                List<Expense> expenses = getExpensesFromExpensesheet(es_id);
                expensesheets.add(new Expensesheet(es_id, userpasskey, date, expenses, status));
                
            }

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
}
