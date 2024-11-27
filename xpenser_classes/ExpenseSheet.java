package xpenser_classes;

import java.sql.Date;

public class ExpenseSheet {
    private int expenseSheetId;
    private int userId;
    private Date esDate;
    private boolean managerApproved;
    private boolean accountingApproved;
    private boolean approved;
    private boolean submitted;

    public ExpenseSheet(int expenseSheetId, int userId, Date esDate, boolean managerApproved, boolean accountingApproved, boolean approved, boolean submitted) {
        this.expenseSheetId = expenseSheetId;
        this.userId = userId;
        this.esDate = esDate;
        this.managerApproved = managerApproved;
        this.accountingApproved = accountingApproved;
        this.approved = approved;
        this.submitted = submitted;
    }

    public int getExpenseSheetId() {
        return expenseSheetId;
    }

    public int getUserId() {
        return userId;
    }

    public Date getEsDate() {
        return esDate;
    }

    public boolean isManagerApproved() {
        return managerApproved;
    }

    public boolean isAccountingApproved() {
        return accountingApproved;
    }

    public boolean isApproved() {
        return approved;
    }

    public boolean isSubmitted() {
        return submitted;
    }
}