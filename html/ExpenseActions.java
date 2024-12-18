package xpenser_classes;

import java.sql.*;
import java.util.*;

public class ExpenseActions {

    public List<Expense> getExpensesFromExpensesheet(int es_id) {
        List<Expense> expenses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM expense WHERE expense_sheet_id = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://195.251.249.131:3306/ismgroup16", "ismgroup16", "uad0bg");
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, es_id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("expense_id");
                String date = rs.getString("expense_date");
                double amount = rs.getDouble("amount");
                String type = rs.getString("expense_type");
                String wbs = rs.getString("wbs");
                String receipt = rs.getString("receipt");
                List<String> status = Arrays.asList(
                        rs.getString("manager_approved"),
                        rs.getString("accounting_approved"),
                        rs.getString("approved"));
                String comments = rs.getString("comments");

                expenses.add(new Expense(id, date, amount, type, wbs, receipt, status, comments));
            }

            rs.close();
            stmt.close();

        } catch (SQLException e) {
            System.err.println(e);
        } catch (ClassNotFoundException e) {
            System.err.println(e);
        }
        return expenses;
    }

    public List<Expensesheet> getExpensheetsToReview() {
        List<Expensesheet> expensesheets = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM expense_sheet WHERE es_date >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH" +
                ", '%Y-%m-01') AND es_date < DATE_FORMAT(CURDATE(), '%Y-%m-01') AND submitted = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://195.251.249.131:3306/ismgroup16", "ismgroup16", "uad0bg");
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, 0);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int es_id = rs.getInt("expense_sheet_id");
                int userid = rs.getInt("user_id");
                String date = rs.getString("es_date");
                List<String> status = Arrays.asList(
                        rs.getString("manager_approved"),
                        rs.getString("accounting_approved"),
                        rs.getString("approved"));

                List<Expense> expenses = getExpensesFromExpensesheet(es_id);
                expensesheets.add(new Expensesheet(es_id, userid, date, expenses, status));
            }

            rs.close();
            stmt.close();

        } catch (SQLException e) {
            System.err.println(e);
        } catch (ClassNotFoundException e) {
            System.err.println(e);
        }

        return expensesheets;
    }

    public User getUserFromExpensesheet(Expensesheet es) {
        User user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user WHERE user_id = ?";
        int user_id = es.getUserId();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://195.251.249.131:3306/ismgroup16", "ismgroup16", "uad0bg");
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, user_id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String name = rs.getString("user_name");
                String username = rs.getString("user_username");
                String password = rs.getString("user_password");
                String role = rs.getString("user_role");

                user = new User(user_id, name, username, password, role);
            }

            rs.close();
            stmt.close();

        } catch (SQLException e) {
            System.err.println(e);
        } catch (ClassNotFoundException e) {
            System.err.println(e);
        }

        return user;
    }

    public List<String> getWBSFromExpensesheet(Expensesheet es) {
        List<String> wbsList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT wbs FROM expense WHERE expense_id = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://195.251.249.131:3306/ismgroup16", "ismgroup16", "uad0bg");

            for (Expense exp : es.getExpenseList()) {
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, exp.getExpenseId());
                rs = stmt.executeQuery();

                while (rs.next()) {
                    wbsList.add(rs.getString("wbs"));
                }
            }

            rs.close();
            stmt.close();

        } catch (SQLException e) {
            System.err.println(e);
        } catch (ClassNotFoundException e) {
            System.err.println(e);
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
        String sql = "SELECT * FROM expense_sheet WHERE passkey = ?  AND submitted = 1";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, passkey);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int es_id = rs.getInt("expense_sheet_id");
                String passKey = rs.getString("passkey");
                String date = rs.getString("es_date");
                status = Arrays.asList(
                        rs.getInt("manager_approved"),
                        rs.getInt("accounting_approved"),
                        rs.getInt("approved"));
                ;

                List<Expense> expenses = getExpensesFromExpensesheet(es_id);
                expensesheets.add(new Expensesheet(es_id, passKey, date, expenses, status));
                // tha prepei na kaneis ena loop opws auta sthn askhsh 2 px pou deixname olous
                // tous user //wste na deixnei k ta palia ejodologia
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
}
