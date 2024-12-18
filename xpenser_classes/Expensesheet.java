package xpenser_classes;

import java.util.*;

public class Expensesheet {
    
    private int expensesheetId;
    private String userPasskey;
    private String date;
    private List<Expense> expenseList;
    private List<Integer> status;

    public Expensesheet(int expensesheetId, String userPasskey, String date, List<Expense> expenseList, List<Integer> status) {
        this.expensesheetId = expensesheetId;
        this.userPasskey = userPasskey;
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

    public String getuserPasskey() {
        return userPasskey;
    }

    public void setuserPasskey(String userPasskey) {
        this.userPasskey = userPasskey;
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

    public List<Integer> getStatus() {
        return status;
    }

    public void setStatus(List<Integer> status) {
        this.status = status;
    }

}