package xpenser_classes;

import java.util.*;

public class Expensesheet {
    
    private int expensesheetId;
    private int userId;
    private String date;
    private List<Expense> expenseList;
    private List<String> status;

    public Expensesheet(int expensesheetId, int userId, String date, List<Expense> expenseList, List<String> status) {
        this.expensesheetId = expensesheetId;
        this.userId = userId;
        this.date = date;
        this.expenseList = expenseList;
        this.status = status;
    }

    public int getExpensesheetId() {
        return expensesheetId;
    }

    public void setExpensesheetId(int expensesheetId) {
        this.expensesheetId = expensesheetId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<Expense> getExpenseList() {
        return expenseList;
    }

    public void setExpenseList(List<Expense> expenseList) {
        this.expenseList = expenseList;
    }

    public List<String> getStatus() {
        return status;
    }

    public void setStatus(List<String> status) {
        this.status = status;
    }

}