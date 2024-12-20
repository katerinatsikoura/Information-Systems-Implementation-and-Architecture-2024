package xpenser_classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private String fullname;
    private String email;
    private String role;
    private String passkey;

    public User(String fullname, String email, String role, String passkey) {
        this.fullname = fullname;
        this.email = email;
        this.role = role;
        this.passkey = passkey;
    }
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    

    public String getPasskey() {
        return passkey;
    }

    public void setPasskey(String passkey) {
        this.passkey = passkey;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email= email;
    }


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
  
    public User() {}

    public static User authenticate(String passkey) throws Exception {
        Connection connection = null;
		DB db = new DB();
        User user = null;
        
        try {
            connection = db.getConnection();
            String query = "SELECT * FROM user WHERE passkey = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, passkey);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User(
                resultSet.getString("fullname"),
                resultSet.getString("email"),
                resultSet.getString("role"),
                resultSet.getString("passkey"));
            }

        } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null ) {
				try {
					connection.close();
				} catch (SQLException e) {
					System.err.println(e.getMessage());
				}
			}
		}
        return user;
    }


    public static String register(User user) throws Exception {
		Connection connection = null;
		DB db = new DB();
        String passkey="";
		try {
			connection = db.getConnection();
			String query = "SELECT * FROM user WHERE email=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user.getEmail());
			ResultSet rs = preparedStatement.executeQuery();
            
			if (rs.next()) {
				throw new Exception("This email has already registered. Try again");
			}

			String in = "INSERT INTO user (fullname, email, role, passkey) VALUES (?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(in);
			ps.setString(1, user.getFullname());
			ps.setString(2, user.getEmail());
	        ps.setString(3, user.getRole());

            passkey = generatePasskey(user.getRole());
            user.setPasskey(passkey);
            ps.setString(4, passkey);


			ps.executeUpdate();
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		} finally {
			if (connection != null ) {
				try {
					connection.close();
				} catch (SQLException e) {
					System.err.println(e.getMessage());
				}
			}
		}
        return passkey;

	}


    public static String generatePasskey(String role) throws Exception {
        String prefix = role.equalsIgnoreCase("Manager") ? "m" : "e";
        Connection conn = null;
        DB db = new DB();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String passkey = "";

        try {
            conn = db.getConnection(); 
            String sql = "SELECT COUNT(*) FROM user WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, role);
            rs = stmt.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            passkey = prefix + String.format("%06d", count);
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        return passkey;
    }


   
}
