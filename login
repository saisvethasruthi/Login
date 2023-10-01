
import java.sql.*;
import java.util.Scanne

public class LoginApplication {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/login_app";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter username: ");
        String username = scanner.nextLine();
        System.out.print("Enter password: ");
        String password = scanner.nextLine();

        if (validateUser(username, password)) {
  
            String name = getUserDetails(username, "name");
            String role = getUserDetails(username, "role");

            System.out.println("Welcome, " + name + "!");
            System.out.println("Username: " + username);
            System.out.println("Role: " + role);

            if (role.equals("manager")) {
                System.out.println("Restricted webpage: https://example.com/restricted");
            }

            System.out.println("Logout: https://example.com/logout");
        } else {
            
            System.out.println("Invalid username or password");
        }

        scanner.close();
    }

    private static boolean validateUser(String username, String password) {
        try {
            
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return true;
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private static String getUserDetails(String username, String field) {
        try {
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT " + field + " FROM users WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String details = resultSet.getString(field);
                resultSet.close();
                statement.close();
                connection.close();

                return details;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
