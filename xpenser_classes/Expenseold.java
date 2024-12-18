package xpenser_classes;
import java.util.*;

public class Expenseold {
    
    private int expenseId;
    private String date;
    private double amount;
    private String type;
    private int wbs;
    private String receipt;
    private List<Integer> status;
    private String comments;

    public Expenseold(int expenseId, String date, double amount, String type, int wbs, String receipt, List<Integer> status, String comments) {
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

    public int getWbs() {
        return wbs;
    }

    public void setWbs(int wbs) {
        this.wbs = wbs;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public List<Integer> getStatus() {
        return status;
    }

    public void setStatus(List<Integer> status) {
        this.status = status;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

}
