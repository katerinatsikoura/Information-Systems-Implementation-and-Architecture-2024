package xpenser_classes;

import java.util.*;

public class Expense {
    
    private int expenseId;
    private String date;
    private double amount;
    private String type;
    private String wbs;
    private String receipt;
    private List<String> status;
    private String comments;

    public Expense(int expenseId, String date, double amount, String type, String wbs, String receipt, List<String> status, String comments) {
        this.expenseId = expenseId;
        this.date = date;
        this.amount = amount;
        this.type = type;
        this.wbs = wbs;
        this.receipt = receipt;
        this.status = status;
        this.comments = comments;
    }

    // Getters and Setters
    public int getExpenseId() {
        return expenseId;
    }

    public void setExpenseId(int expenseId) {
        this.expenseId = expenseId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getWbs() {
        return wbs;
    }

    public void setWbs(String wbs) {
        this.wbs = wbs;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public List<String> getStatus() {
        return status;
    }

    public void setStatus(List<String> status) {
        this.status = status;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

}
