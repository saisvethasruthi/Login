import java.util.Locale;
import java.util.ResourceBundle;

public class Login {
    public static void main(String[] args) {
        Locale locale = new Locale("en", "US"); 
        ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
        
        System.out.println(bundle.getString("login.title"));
        System.out.println(bundle.getString("login.username"));
        System.out.println(bundle.getString("login.password"));
        System.out.println("<input type='submit' value='" + bundle.getString("login.submit") + "'>");
        
        System.out.println(bundle.getString("welcome.message") + " " + name + "!");
        System.out.println(bundle.getString("welcome.username") + " " + username);
        System.out.println(bundle.getString("welcome.role") + " " + role);
        
        if (role.equals("manager")) {
            System.out.println(bundle.getString("restricted.link"));
        }
    }
}
