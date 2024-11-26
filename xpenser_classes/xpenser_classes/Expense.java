package xpenser_classes;

public class Expense {
    private String type;
    private double amount;
    private java.sql.Date date;
    private String wbs;
    private String url;
    private String comments;
    private int id;



  
    public Expense(String type, double amount, java.sql.Date date, String wbs) {
        this.type = type;
        this.amount = amount;
        this.date = date;
        this.wbs = wbs;
    }

    public Expense(String type, double amount, java.sql.Date date, String wbs, String url, String comments, int id) {
        this.type = type;
        this.amount = amount;
        this.date = date;
        this.wbs = wbs;
        this.url = url;
        this.comments = comments;
        this.id = id;
    }

    public String getType() {
        return this.type;
    }

    public double getAmount() {
        return this.amount;
    }

    public java.sql.Date getDate() {
        return this.date;
    }

    public String getWbs() {
        return this.wbs;
    }

    public String getUrl() {
        return this.url;
    }

    public String getComments() {
        return this.comments;
    }

    public int getId() {
        return this.id;
    }

}

