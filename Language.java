import java.sql.*;

public class Login {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/login";
        String username = "root";
        String password = "password";
        
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'");
            
            if (rs.next()) {
                String name = rs.getString("name");
                String role = rs.getString("role");
                
                System.out.println("Welcome, " + name + "!");
                System.out.println("Username: " + username);
                System.out.println("Role: " + role);
                
                if (role.equals("manager")) {
                    System.out.println("Restricted webpage: <a href='restricted'>Restricted Page</a>");
                }
            } else {
                System.out.println("Invalid username or password.");
            }
            
            conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
