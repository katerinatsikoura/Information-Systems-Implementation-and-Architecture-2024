package xpenser_classes;

public class Expense {
    private String type;
    private double amount;
    private java.sql.Date date;
    private String wbs;

  
    public Expense(String type, double amount, java.sql.Date date, String wbs) {
        this.type = type;
        this.amount = amount;
        this.date = date;
        this.wbs = wbs;
    }


    public String getType() {
        return type;
    }

    public double getAmount() {
        return amount;
    }

    public java.sql.Date getDate() {
        return date;
    }

    public String getWbs() {
        return wbs;
    }
}

